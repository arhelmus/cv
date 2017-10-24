FROM ubuntu:14.04
VOLUME /tmp/.X11-unix
ENV DISPLAY=$DISPLAY
RUN apt-get update
RUN apt-get -y install xvfb libjpeg-turbo8 libicu52 fontconfig libxrender1 xfonts-75dpi
RUN apt-get -y install wget
RUN wget https://bitbucket.org/wkhtmltopdf/wkhtmltopdf/downloads/wkhtmltox-0.13.0-alpha-7b36694_linux-trusty-amd64.deb
RUN dpkg -i wkhtmltox-0.13.0-alpha-7b36694_linux-trusty-amd64.deb
COPY . .
CMD xvfb-run -- wkhtmltopdf --dpi 260 --margin-bottom 0 --margin-top 0 --margin-right 0 --margin-left 0 --user-style-sheet ./pdf.css --enable-external-links ./index.html ./result/cv.pdf
