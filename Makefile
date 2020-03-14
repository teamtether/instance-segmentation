TARGET = instance_segmentation 

CXXFLAGS ?= -ggdb
CPPFLAGS ?= -std=c++11

LFLAGS = -lcudnn -lcuda -ldlib -lpng -lgif -ljpeg -lopenblas -lpthread -lX11

CXX ?= nice g++

SRC = src/instance_segmentation.cpp

TMP = $(SRC:.cpp=.o)
OBJ = $(TMP:.c=.o)

$(TARGET): $(OBJ) 
	@echo Linking $@
	@$(CXX) $(LDFLAGS) $(OBJ) $(LFLAGS) -o $@
	@echo Build Complete

clean:
	@rm -f $(OBJ) $(TARGET)
	@echo All object files and binaries removed

dep: 
	@echo Running makedepend
	@makedepend -- $(CFLAGS) -- $(SRC) 2> /dev/null 
	@echo Completed makedepend
