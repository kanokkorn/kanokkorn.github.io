sudo apt update && sudo apt -y upgrade
sudo apt install -y git binutils-arm-linux-gnueabihf python3-dev python3-pip build-essential \
      cmake unzip pkg-config libjpeg-dev pkg-config libgtk2.0-dev libpng-dev libjasper-dev \
      libtiff-dev libavcodec-dev libavformat-dev libswscale-dev libxvidcore-dev libx264-dev \
      libatlas-base-dev ocl-icd-opencl-dev
cd ~ && git clone https://github.com/numpy/numpy.git && sudo pip3 install -e ~/numpy 
cd ~ && git clone https://github.com/opencv/opencv.git && git clone https://github.com/opencv/opencv_contrib.git
mkdir ~/opencv_build && cd ~/opencv_build
cmake ~/opencv -D CMAKE_BUILD_TYPE=RELEASE
      -D CMAKE_INSTALL_PREFIX=/usr/local 
      -D INSTALL_PYTHON_EXAMPLE=ON 
      -D ENABLE_VFPV3=ON 
      -D BUILD_TESTS=ON 
      -D OPENCV_ENABLE_NONFREE=ON 
      -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules 
      -D BUILD_EXAMPLES=ON 
      -D OPENCV_PYTHON3_VERSION=ON 
      -D WITH_LIBV4L=OFF 
      -D WITH_GTK=ON 
      -D WITH_V4L=ON
      -D WITH_OPENCL=ON
make 
sudo make install && sudo pip3 install -e ~/opencv_build/python_loader/ 