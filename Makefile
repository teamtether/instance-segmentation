TARGET = instance_segmentation 

CXXFLAGS ?= -ggdb
CPPFLAGS ?= -std=c++11

LFLAGS = -ldlib -L/usr/local/cuda-10.1/lib64 -lcudnn -lpthread -lcuda -lcublas -lcurand -lcusolver -lpng -lgif -ljpeg -lopenblas -lX11

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
