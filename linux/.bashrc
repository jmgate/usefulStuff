# .bashrc

# Source global definitions.
if [ -f /etc/bashrc ]; then
  source /etc/bashrc
fi

# Load modules.
module purge

# Git configuration.
source ~/.personal-git-configuration

# Proxy settings.
export http_proxy=http://jmgate:nopass@proxy.sandia.gov:80
export ftp_proxy=${http_proxy}
export https_proxy=${http_proxy}
export SSL_CERT_FILE=/home/jmgate/sandia_root_ca_and_bc/sandia_root_ca.cer
export REQUESTS_CA_BUNDLE=${SSL_CERT_FILE}

# Set the command prompt.
source ~/.personal-prompt

# Set the visual editor.
export VISUAL='vi'

# Set less to use colors and case-insensitive search.
export LESS=-FRiX

# MY_HOME will be the location on my solid state drive in which I do all my
# building and running.
export MY_HOME=/workspace

# Set various PATH variables.
source ~/.personal-path

# Set location-related environment variables.
source ~/.personal-location-env-vars

# Load personal functions and aliases.
source ~/.personal-functions
source ~/.personal-aliases
