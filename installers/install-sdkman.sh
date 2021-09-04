#!/bin/bash

curl -s "https://get.sdkman.io" | bash

# configure in bash
bash -c 'source ${SDKMAN_DIR}/bin/sdkman-init.sh'

# configure in fish
if type "fish" &> /dev/null; then
    fish -c 'fisher install reitzig/sdkman-for-fish@v1.4.0'
    source $HOME/.config/fish/conf.d/sdk.fish
fi   
