if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

export PATH=$PATH:~/go/bin

# something for docker setup for Virta
source ~/code/docker_dev/docker/.docker_functions.sh

# Android stuff for Virta
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
