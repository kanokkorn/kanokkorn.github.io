apt install -y git \
               python3-pip \
               build-essential \
               cmake \
               unzip \
               pkg-config \
               libjpeg-dev \
               libpng-dev \
               libtiff-dev \
               libavcodec-dev \
               libavformat-dev \
               libswscale-dev \
               libxvidcore-dev \
               libx264-dev
cd ~ && git clone https://github.com/opencv/opencv.git && git clone https://github.com/opencv/opencv_contrib.git
mkdir ~/opencv_build && cd ~/opencv_build
cmake ../opencv -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D INSTALL_PYTHON_EXAMPLE=OFF \
      -D OPENCV_GENERATE_PKGCONFIG=ON \
      -D ENABLE_VFPV3=ON \
      -D BUILD_TESTS=OFF \
      -D OPENCV_ENABLE_NONFREE=ON \
      -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
      -D BUILD_EXAMPLES=OFF \
      -D SOFTFP=ON
      -D BUILD_opencv_python2=0
      -D BUILD_opencv_python3=1
make -j4
sudo make install