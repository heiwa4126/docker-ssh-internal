#!/bin/sh -ue
uid=$(id -u)
gid=$(id -g)
image=test0

docker run --rm -it \
  --user $uid:$gid \
  --workdir="/home/$USER" \
  --volume="/etc/hosts:/etc/hosts:ro" \
  --volume="/etc/group:/etc/group:ro" \
  --volume="/etc/passwd:/etc/passwd:ro" \
  --volume="/etc/shadow:/etc/shadow:ro" \
  -v "/home/$USER/.ssh:/home/$USER/.ssh:ro" \
  -v "$SSH_AUTH_SOCK:$SSH_AUTH_SOCK" \
  --env "SSH_AUTH_SOCK=$SSH_AUTH_SOCK" \
  "$image" bash
