
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[ -f /usr/local/opt/dvm/dvm.sh ] && . /usr/local/opt/dvm/dvm.sh

function setTerm() { PROFILE=${1}; echo "tell app \"Terminal\" to set current settings of first window to settings set \"${PROFILE}\""|osascript; };

qd-prod() {
  eval $(docker-machine env qnap)
  export DOCKER_API_VERSION=1.32
  export COMPOSE_API_VERSION=1.32
#  dvm use 17.05.0-ce
  setTerm QD-Prod
  clear
  echo "Connected to REMOTE QNAP Docker for PROD - QNAP Compatible"
  echo
  docker version
  echo
  docker info | grep "Server\ Version\|Containers\|Operating\ System\|Name:"
  echo
}

qd-dev() {
  eval $(docker-machine env -u)
  export DOCKER_API_VERSION=1.32
  export COMPOSE_API_VERSION=1.32
#  dvm use 17.05.0-ce
  setTerm QD-Dev
  clear
  echo "Connected to Local Docker for DEV - QNAP Compatible"
  echo
  docker version
  echo
  docker info | grep "Server\ Version\|Containers\|Operating\ System\|Name:"
  echo
}

qd-off() {
  eval $(docker-machine env -u)
  unset DOCKER_API_VERSION
  unset COMPOSE_API_VERSION
#  dvm deactivate
  setTerm basic
  clear
  echo "Connected to Local Docker - MAC"
  echo
  docker version
  echo
  docker info | grep "Server\ Version\|Containers\|Operating\ System\|Name:"
  echo
}


