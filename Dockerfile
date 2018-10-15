FROM openjdk:8

WORKDIR /tmp

RUN apt-get update && apt-get -s build-dep imagemagick; exit 0
RUN apt-get update && apt-get install -y build-essential libbz2-dev libfreetype6-dev libopenjp2-7-dev  librsvg2-dev libjpeg-dev liblcms2-dev libltdl-dev liblzma-dev libpng-dev libtiff-dev libtiff5-dev libtiffxx5 libxml2-dev libxml2-utils zlib1g-dev checkinstall

WORKDIR /imagemagick_build
RUN wget https://www.imagemagick.org/download/ImageMagick-7.0.8-12.tar.bz2
RUN tar xvf ImageMagick-7.0.8-12.tar.bz2
WORKDIR /imagemagick_build/ImageMagick-7.0.8-12
RUN ./configure --with-rsvg=yes --with-jpeg=yes --with-png=yes --with-jp2=yes --with-tiff=yes
RUN make
RUN checkinstall -D --install=yes --fstrans=no --pakdir "$HOME/imagemagick_build" --pkgname imagemagick --backup=no --deldoc=yes --deldesc=yes --delspec=yes --default --pkgversion "7.0.8-12"
RUN make distclean
RUN ldconfig
