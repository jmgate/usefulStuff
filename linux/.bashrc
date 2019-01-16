# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Load modules.
module purge

# Git configuration.
source ~/.git-completion.bash
source ~/.git-prompt.sh
alias g="git"
complete -o default -o nospace -F _git g
_git_p()
{
  _git_push
} # end of _git_p()
_git_up()
{
  _git_push
} # end of _git_up()
_git_finish()
{
  _git_checkout
} # end of _git_finish()

# gitdist configuration.
export GITDIST_MOVE_TO_BASE_DIR=EXTREME_BASE
alias gd=gitdist
alias gds="gitdist dist-repo-status --dist-utf8-output"
alias gdc="gitdist --dist-repos=Trilinos/tcad-charon,charon/charon-data,charon/charon-ouo-data"
alias gde="gitdist --dist-repos=Trilinos,empire/EMPIRE,empire/EMPIRE-PIC,empire/EMPIRE-Fluid,empire/EMPIRE-Hybrid,empire/SPIN,empire/BuildScripts"
alias gdd="gitdist --dist-repos=Trilinos/DrekarBase"
alias gdcod="gitdist checkout _DEFAULT_BRANCH_"
complete -o default -o nospace -F _git gd
complete -o default -o nospace -F _git gdc
complete -o default -o nospace -F _git gde
complete -o default -o nospace -F _git gdd

# Proxy settings.
export http_proxy=http://wwwproxy.sandia.gov:80
export https_proxy=http://wwwproxy.sandia.gov:80

# The following creates a three- or four-line prompt that looks like the
# following:
#   <blank line>
#   <machine name>: <current working directory> ----------------- <date> <time>
#   [<command #>] <user name> (<git branch name>)$
# or, if <git branch name> is too long,
#   <blank line>
#   <machine name>: <current working directory> ----------------- <date> <time>
#   (<git branch name>)
#   [<command #>] <user name>$
function promptCommand
{
  local FG_BLUE="\[\e[34m\]"
  local FG_DEFAULT="\[\e[39m\]"
  local BG_RED="\[\e[101m\]"
  local BG_YELLOW="\[\e[103m\]"
  local BG_DEFAULT="\[\e[49m\]"
  local branch=$(__git_ps1 "%s")
  local branchLength=${#branch}
  local tooLong=$(($(tput cols) / 3))
  if [[ $branch != "" ]]; then
    local upstream=$(git for-each-ref --format="%(upstream:short)" $(git symbolic-ref -q HEAD))
    if [[ $upstream != "" ]]; then
      branch="${FG_BLUE}$(echo $upstream | awk -F/ '{print $1}')/${FG_DEFAULT}${branch}"
    fi
    if [[ -f $(git rev-parse --git-dir)/FETCH_HEAD ]]; then
      local secondsSinceFetch=$(($(date +%s) - $(stat -c %Y $(git rev-parse --git-dir)/FETCH_HEAD)))
      local minutesSinceFetch=$(($secondsSinceFetch / 60))
      local hoursSinceFetch=$((minutesSinceFetch / 60))
      local daysSinceFetch=$((hoursSinceFetch / 24))
      branch=$branch"|"
      if [[ $daysSinceFetch -gt 0 ]]; then
        if [[ $daysSinceFetch -gt 5 ]]; then
          branch="$branch${BG_RED}"
        elif [[ $daysSinceFetch -gt 2 ]]; then
          branch="$branch${BG_YELLOW}"
        fi
        branch=$branch$daysSinceFetch"d${BG_DEFAULT}"
      elif [[ $hoursSinceFetch -gt 0 ]]; then
        branch=$branch$hoursSinceFetch"h"
      elif [[ $minutesSinceFetch -gt 0 ]]; then
        branch=$branch$minutesSinceFetch"m"
      else
        branch=$branch$secondsSinceFetch"s"
      fi
    fi
    branch="($branch)"
  fi
  local hostname="$(hostname --short)"
  local pwd="${PWD}"
  local availableSpace=$(($(tput cols) - ${#hostname} - 24))
  if [ ${#pwd} -gt ${availableSpace} ]; then
    pwd="...${pwd:$((${#pwd} - ${availableSpace} + 3))}"
  fi
  PS1="\n\[$(printf "%*s" $(($(tput cols) - 20)) "" | sed "s/ /─/g") \d \t\r${hostname}: ${pwd} \]\n"
  if [ $branchLength -gt $tooLong ]; then
    PS1=$PS1"$branch\n[\#] \u\$ "
  else
    if [[ $branch != "" ]]; then
      branch=" $branch"
    fi
    PS1=$PS1"[\#] \u$branch\$ "
  fi
  export PS1
}
PROMPT_COMMAND=promptCommand

# Set the visual editor.
export VISUAL='vi'

# Set less to use colors and case-insensitive search.
export LESS=-FRiX

# MY_HOME will be the location on my solid state drive in which I do all my
# building and running.
export MY_HOME=/workspace

# Set various PATH variables.
export TRIBITS_BASE_DIR=${MY_HOME}/TriBITS
# old stuff
PATH="${TRIBITS_BASE_DIR}/tribits/python_utils:${PATH}"
PATH="${TRIBITS_BASE_DIR}/tribits/ci_support:${PATH}"
PATH="/home/jmgate/Downloads/p4v-2017.1.1491634_x64/bin:${PATH}"
PATH="/home/jmgate/Downloads/ParaView-5.1.2-Qt4-OpenGL2-MPI-Linux-64bit/bin:${PATH}"
PATH="/usr/local/texlive/2016/bin/x86_64-linux:${PATH}"
PATH="${MY_HOME}/install/bin:${PATH}"
PATH="/home/jmgate/bin:${PATH}"
PATH="/usr/local/bin:${PATH}"
PATH="/usr/totalview/bin:${PATH}"
# new stuff
PATH="/home/jmgate/toolchain/install/gcc-7.3.0/bin:${PATH}"
PATH="/home/jmgate/toolchain/install/openmpi-3.0.0/bin:${PATH}"
PATH="/home/jmgate/toolchain/install/cmake-3.11.0/bin:${PATH}"
PATH="/home/jmgate/toolchain/install/anaconda3-5.1.0/bin:${PATH}"
PATH="/home/jmgate/toolchain/install/hdf5-1.10.1/bin:${PATH}"
PATH="/home/jmgate/toolchain/install/parallel-netcdf-1.9.0/bin:${PATH}"
PATH="/home/jmgate/toolchain/install/netcdf-4.6.0/bin:${PATH}"
PATH="/home/jmgate/toolchain/install/parmetis-4.0.3/bin:${PATH}"
PATH="/home/jmgate/toolchain/install/papi-5.6.1.0/bin:${PATH}"
PATH="/home/jmgate/toolchain/install/gitkraken:${PATH}"
PATH="/home/jmgate/toolchain/install/spack-0.12.0/bin:${PATH}"
export PATH
# old stuff
LD_LIBRARY_PATH="/usr/lib64:${LD_LIBRARY_PATH}"
LD_LIBRARY_PATH="/usr/local/lib64:${LD_LIBRARY_PATH}"
LD_LIBRARY_PATH="/usr/local/lib:${LD_LIBRARY_PATH}"
# new stuff
LD_LIBRARY_PATH="/home/jmgate/toolchain/install/gcc-7.3.0/lib:${LD_LIBRARY_PATH}"
LD_LIBRARY_PATH="/home/jmgate/toolchain/install/gcc-7.3.0/lib64:${LD_LIBRARY_PATH}"
LD_LIBRARY_PATH="/home/jmgate/toolchain/install/openmpi-3.0.0/lib:${LD_LIBRARY_PATH}"
LD_LIBRARY_PATH="/home/jmgate/toolchain/install/lapack-3.8.0/lib64:${LD_LIBRARY_PATH}"
LD_LIBRARY_PATH="/home/jmgate/toolchain/install/boost-1.66.0/lib:${LD_LIBRARY_PATH}"
LD_LIBRARY_PATH="/home/jmgate/toolchain/install/zlib-1.2.11/lib:${LD_LIBRARY_PATH}"
LD_LIBRARY_PATH="/home/jmgate/toolchain/install/hdf5-1.10.1/lib:${LD_LIBRARY_PATH}"
LD_LIBRARY_PATH="/home/jmgate/toolchain/install/parallel-netcdf-1.9.0/lib:${LD_LIBRARY_PATH}"
LD_LIBRARY_PATH="/home/jmgate/toolchain/install/netcdf-4.6.0/lib:${LD_LIBRARY_PATH}"
LD_LIBRARY_PATH="/home/jmgate/toolchain/install/parmetis-4.0.3/lib:${LD_LIBRARY_PATH}"
LD_LIBRARY_PATH="/home/jmgate/toolchain/install/papi-5.6.1.0/lib:${LD_LIBRARY_PATH}"
export LD_LIBRARY_PATH
export MANPATH=/usr/local/texlive/2016/texmf-dist/doc/man:${MANPATH}
export INFOPATH=/usr/local/texlive/2016/texmf-dist/doc/info:${INFOPATH}

# Set location-related environment variables.
export TRILINOS_DIR=${MY_HOME}/Trilinos
export AMESOS_DIR=${TRILINOS_DIR}/packages/amesos
export EPETRA_DIR=${TRILINOS_DIR}/packages/epetra
export KOKKOS_DIR=${TRILINOS_DIR}/packages/kokkos
export NOX_DIR=${TRILINOS_DIR}/packages/nox
export PANZER_DIR=${TRILINOS_DIR}/packages/panzer
export PHALANX_DIR=${TRILINOS_DIR}/packages/phalanx
export PIRO_DIR=${TRILINOS_DIR}/packages/piro
export RYTHMOS_DIR=${TRILINOS_DIR}/packages/rythmos
export SACADO_DIR=${TRILINOS_DIR}/packages/sacado
export STK_DIR=${TRILINOS_DIR}/packages/stk
export STRATIMIKOS_DIR=${TRILINOS_DIR}/packages/stratimikos
export TEKO_DIR=${TRILINOS_DIR}/packages/teko
export TEMPUS_DIR=${TRILINOS_DIR}/packages/tempus
export TEUCHOS_DIR=${TRILINOS_DIR}/packages/teuchos
export THYRA_DIR=${TRILINOS_DIR}/packages/thyra
export TPETRA_DIR=${TRILINOS_DIR}/packages/tpetra
export DREKAR_DIR=${TRILINOS_DIR}/DrekarBase/drekar
export DREKAR_SYSTEM_TESTS_DIR=${MY_HOME}/DrekarSystemTests
export DREKAR_DOCS_DIR=${MY_HOME}/DrekarDocuments/trunk
export CHARON_DIR=${TRILINOS_DIR}/tcad-charon
export CHARON_DATA_DIR=${MY_HOME}/charon/charon-data
export CHARON_OUO_DATA_DIR=${MY_HOME}/charon/charon-ouo-data
export TRILINOS_BUILD_DIR=${MY_HOME}/build/trilinos
export TRILINOS_INSTALL_DIR=${MY_HOME}/install
export PANZER_BUILD_DIR=${TRILINOS_BUILD_DIR}/packages/panzer
export CHARON_BUILD_DIR=${TRILINOS_BUILD_DIR}/tcad-charon
export DREKAR_BUILD_DIR=${TRILINOS_BUILD_DIR}/DrekarBase/drekar
export EMPIRE_DIR=${MY_HOME}/empire/EMPIRE
export PIC_DIR=${MY_HOME}/empire/EMPIRE-PIC
export FLUID_DIR=${MY_HOME}/empire/EMPIRE-Fluid
export HYBRID_DIR=${MY_HOME}/empire/EMPIRE-Hybrid
export SPIN_DIR=${MY_HOME}/empire/SPIN
export SCEPTXS_DIR=${MY_HOME}/empire/SCEPTXS
export BUILD_SCRIPTS_DIR=${MY_HOME}/empire/BuildScripts
export EMPIRE_BUILD_DIR=${MY_HOME}/build/EMPIRE
export PIC_BUILD_DIR=${MY_HOME}/build/EMPIRE-PIC
export FLUID_BUILD_DIR=${MY_HOME}/build/EMPIRE-Fluid
export HYBRID_BUILD_DIR=${MY_HOME}/build/EMPIRE-Hybrid
export SPIN_BUILD_DIR=${PIC_BUILD_DIR}/src/collision
export SCEPTXS_BUILD_DIR=${SPIN_BUILD_DIR}/TPL/sceptxs

# cd with history.
function myCd
{
  if [ $# -ge 1 ]; then
    pushd $@ > /dev/null
  else
    pushd $HOME > /dev/null;
  fi
} # end of function myCd

# Move back up the directory stack.
function myBack
{
  num=1
  if [ $# -ge 1 ]; then
    re='^[0-9]+$'
    if ! [[ $1 =~ $re ]]; then
      echo "Error:  argument = $1 must be an integer."
      exit 1
    fi
    num=$1
  fi
  for i in $(seq 1 $num); do
    popd > /dev/null
  done
} # end of function myBack

# Move up one or more directories.
function myUp
{
  num=1
  if [ $# -ge 1 ]; then
    re='^[0-9]+$'
    if ! [[ $1 =~ $re ]]; then
      echo "Error:  argument = $1 must be an integer."
      exit 1
    fi
    num=$1
  fi
  str=".."
  for i in $(seq 2 $num); do
    str="${str}/.."
  done
  myCd ${str}
} # end of function myUp

# Git branch with descriptions.
function gitBranchDescriptions
{
  branches=$(git for-each-ref --format='%(refname)' refs/heads/ | sed 's|refs/heads/||')
  for branch in $branches; do
    desc=$(git config branch.$branch.description)
    if [ $branch == $(git rev-parse --abbrev-ref HEAD) ]; then
      branch="* \033[0;32m$branch\033[0m"
    else
      branch="  $branch"
    fi
    echo -e "$branch \033[0;36m"
    while read -r line; do
      echo "    $line"
    done <<< "$desc"
    echo -e "\033[0m"
  done
}

# Generally useful aliases.
alias .b="source ~/.bashrc"
alias .bp="source ~/.bash_profile"
alias vi=vim
alias less="less -R"
alias grep="grep --color --exclude-dir=doc --exclude-dir=.git"
alias rgrep="grep -rsIn"
alias f="find . -name"
alias o="gio open"
alias rm="rm -v"
alias cd="myCd"
alias up="myUp"
alias back="myBack"
alias dirs="dirs -v"
alias tree="tree -C --charset UTF8"
alias ssh="ssh -Y"
alias texdocs="cd /usr/local/texlive/2016/texmf-dist/doc"
alias valgrind="valgrind -v --leak-check=full --suppressions=${HOME}/valgrind.supp"

# Machine aliases.
alias skybridge="ssh jmgate@skybridge.sandia.gov"
alias hansen="ssh jmgate@hansen.sandia.gov"
alias shiller="ssh jmgate@shiller.sandia.gov"
alias estolad="ssh jmgate@estolad.sandia.gov"
alias mac="ssh jmgate@s1001843.srn.sandia.gov"
alias linux="ssh jmgate@s1002179.srn.sandia.gov"
alias chama="ssh jmgate@chama.sandia.gov"
alias breve="ssh jmgate@breve.sandia.gov"
alias cortado="ssh jmgate@cortado.sandia.gov"
alias doppio="ssh jmgate@doppio.sandia.gov"

# Location aliases.
alias home="cd ${MY_HOME}"
alias trilinos="cd ${TRILINOS_DIR}"
alias amesos="cd ${AMESOS_DIR}"
alias epetra="cd ${EPETRA_DIR}"
alias kokkos="cd ${KOKKOS_DIR}"
alias nox="cd ${NOX_DIR}"
alias panzer="cd ${PANZER_DIR}"
alias phalanx="cd ${PHALANX_DIR}"
alias piro="cd ${PIRO_DIR}"
alias rythmos="cd ${RYTHMOS_DIR}"
alias sacado="cd ${SACADO_DIR}"
alias stk="cd ${STK_DIR}"
alias stratimikos="cd ${STRATIMIKOS_DIR}"
alias teko="cd ${TEKO_DIR}"
alias tempus="cd ${TEMPUS_DIR}"
alias teuchos="cd ${TEUCHOS_DIR}"
alias thyra="cd ${THYRA_DIR}"
alias tpetra="cd ${TPETRA_DIR}"
alias drekar="cd ${DREKAR_DIR}"
alias dstests="cd ${DREKAR_SYSTEM_TESTS_DIR}"
alias ddocs="cd ${DREKAR_DOCS_DIR}"
alias charon="cd ${CHARON_DIR}"
alias cdata="cd ${CHARON_DATA_DIR}"
alias codata="cd ${CHARON_OUO_DATA_DIR}"
alias tbuild="cd ${TRILINOS_BUILD_DIR}"
alias dbuild="cd ${DREKAR_BUILD_DIR}"
alias pbuild="cd ${PANZER_BUILD_DIR}"
alias cbuild="cd ${CHARON_BUILD_DIR}"
alias ebuild="cd ${EMPIRE_BUILD_DIR}"
alias epbuild="cd ${PIC_BUILD_DIR}"
alias fbuild="cd ${FLUID_BUILD_DIR}"
alias hbuild="cd ${HYBRID_BUILD_DIR}"
alias spinbuild="cd ${SPIN_BUILD_DIR}"
alias sbuild="cd ${SCEPTXS_BUILD_DIR}"
alias discfe="cd ${PANZER_DIR}/disc-fe/src"
alias dofmgr="cd ${PANZER_DIR}/dof-mgr/src"
alias adapstk="cd ${PANZER_DIR}/adapters-stk/src"
alias pcore="cd ${PANZER_DIR}/core/src"
alias empire="cd ${EMPIRE_DIR}"
alias epic="cd ${PIC_DIR}"
alias fluid="cd ${FLUID_DIR}"
alias hybrid="cd ${HYBRID_DIR}"
alias spin="cd ${SPIN_DIR}"
alias sceptxs="cd ${SCEPTXS_DIR}"
alias bscripts="cd ${BUILD_SCRIPTS_DIR}"
alias tribits="cd ${TRIBITS_BASE_DIR}"
