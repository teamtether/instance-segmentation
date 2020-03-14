## Dlib Instance Segmentation

### Dlib Installation

```bash
git clone https://github.com/davisking/dlib
mkdir dlib/build
cd dlib/build

cmake .. -DUSE_AVX_INSTRUCTIONS=1 -DDLIB_USE_CUDA=1
sudo make install
```


### Build Instance Segmentation

```bash
make
```

### Train VOC2012 Model

```
./instance_segmentation /path/to/voc2012
```
