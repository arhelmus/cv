docker build -t cv_generator .
docker run -v $PWD/result:/result cv_generator
