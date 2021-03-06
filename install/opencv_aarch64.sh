sudo apt update && sudo apt -y upgrade
sudo apt install -y git binutils-arm-linux-gnueabihf python3-dev python3-pip \ 
                  build-essential cmake unzip libjpeg-dev libpng-dev libtiff-dev libavcodec-dev \ 
                  libavformat-dev libswscale-dev libxvidcore-dev libx264-dev \ 
                  libatlas-base-dev
cd ~ && git clone https://github.com/numpy/numpy.git
cd numpy && sudo pip3 install -e .
cd ~ && git clone https://github.com/opencv/opencv.git && git clone https://github.com/opencv/opencv_contrib.git
mkdir ~/opencv_build && cd ~/opencv_build
cmake ../opencv -D CMAKE_BUILD_TYPE=RELEASE
      -D CMAKE_INSTALL_PREFIX=/usr/local
      -D INSTALL_PYTHON_EXAMPLE=ON 
      -D ENABLE_VFPV3=ON 
      -D BUILD_TESTS=ON 
      -D OPENCV_ENABLE_NONFREE=ON 
      -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules 
      -D BUILD_EXAMPLES=ON 
      -D OPENCV_PYTHON3_VERSION=ON 
      -D WITH_GTK=ON
      -D WITH_CUDA=ON 
      -D WITH_GSTREAM=ON
      -D WITH_OPENGL=ON 
      -D WITH_FFMPEG=ON
make -j4
sudo make install && sudo python3 ~/opencv_build/python_loader/setup.py develop