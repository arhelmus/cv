docker build --platform=linux/amd64 -t cv_generator .
docker run -v $PWD/result:/result cv_generator
