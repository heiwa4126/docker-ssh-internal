#!/bin/bash -ue
image=test0
gid=$(id -g)

OPTS="
  --volume=/etc/hosts:/etc/hosts:ro
  --volume=/etc/group:/etc/group:ro
  --volume=/etc/passwd:/etc/passwd:ro
  --volume=/etc/shadow:/etc/shadow:ro
  --user $UID:$gid
  --workdir=$HOME
  -v $HOME/.ssh:$HOME/.ssh:ro
"

if [[ -v SSH_AUTH_SOCK ]]; then
  OPTS_SSH_AGENT="
  -v $SSH_AUTH_SOCK:$SSH_AUTH_SOCK
  --env SSH_AUTH_SOCK=$SSH_AUTH_SOCK
"
else
  OPTS_SSH_AGENT=""
fi

docker run --rm -it $OPTS $OPTS_SSH_AGENT "$image" bash
