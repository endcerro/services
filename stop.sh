docker stop $(docker ps -aq)


if [ $# -eq 1 ]
  then
    echo "RM TIME"
    docker rm $(docker ps -aq)
fi
