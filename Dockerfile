FROM openjdk:8

WORKDIR /tmp

RUN apt-get update && apt-get -s build-dep imagemagick; exit 0

RUN apt-get install -y apt-utils
RUN apt-get install -y build-essential 
RUN apt-get install -y checkinstall
RUN apt-get install -y libbz2-dev 
RUN apt-get install -y libfreetype6-dev 
RUN apt-get install -y libopenjp2-7-dev 
RUN apt-get install -y librsvg2-dev 
RUN apt-get install -y libjpeg-dev 
RUN apt-get install -y liblcms2-dev 
RUN apt-get install -y libltdl-dev 
RUN apt-get install -y liblzma-dev 
RUN apt-get install -y libpng-dev 
RUN apt-get install -y libtiff-dev 
RUN apt-get install -y libtiff5-dev 
RUN apt-get install -y libtiffxx5 
RUN apt-get install -y libxml2-dev 
RUN apt-get install -y libxml2-utils 
RUN apt-get install -y zlib1g-dev 
RUN apt-get install -y libbz2-dev 
RUN apt-get install -y libfreetype6-dev 
RUN apt-get install -y libopenjp2-7-dev 
RUN apt-get install -y librsvg2-dev 
RUN apt-get install -y libjpeg-dev 
RUN apt-get install -y liblcms2-dev 
RUN apt-get install -y libltdl-dev 
RUN apt-get install -y liblzma-dev 
RUN apt-get install -y libpng-dev 
RUN apt-get install -y libtiff-dev 
RUN apt-get install -y libtiff5-dev 
RUN apt-get install -y libtiffxx5 
RUN apt-get install -y libxml2-dev 
RUN apt-get install -y libxml2-utils 
RUN apt-get install -y zlib1g-dev 
RUN apt-get install -y libdjvulibre-dev
RUN apt-get install -y libfftw3-dev
RUN apt-get install -y liblqr-1-0-dev
RUN apt-get install -y libltdl-dev
RUN apt-get install -y libopenexr-dev
RUN apt-get install -y libwmf-dev

WORKDIR /imagemagick_build
RUN wget https://www.imagemagick.org/download/ImageMagick-7.0.8-16.tar.bz2
RUN tar xvf ImageMagick-7.0.8-16.tar.bz2

WORKDIR /imagemagick_build/ImageMagick-7.0.8-16
RUN ./configure --with-rsvg=yes --with-jpeg=yes --with-png=yes --with-openjp2=yes --with-tiff=yes
RUN make
RUN checkinstall -D --install=yes --fstrans=no --pakdir "$HOME/imagemagick_build" --pkgname imagemagick --backup=no --deldoc=yes --deldesc=yes --delspec=yes --default --pkgversion "7.0.8-16"
RUN make distclean
RUN ldconfig

WORKDIR / 
RUN rm -rf imagemagick_build
