FROM ubuntu:16.04
VOLUME /tmp/.X11-unix
ENV DISPLAY=$DISPLAY
RUN apt-get update
RUN apt-get -y install xvfb libjpeg-turbo8 fontconfig libxrender1 xfonts-75dpi wget
RUN wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.xenial_amd64.deb
RUN dpkg -i wkhtmltox_0.12.6-1.xenial_amd64.deb
COPY . .
CMD xvfb-run -- wkhtmltopdf --dpi 300 --margin-bottom 0 --margin-top 0 --margin-right 0 --margin-left 0 --user-style-sheet ./pdf.css --enable-local-file-access --enable-external-links ./index.html ./result/cv.pdf
