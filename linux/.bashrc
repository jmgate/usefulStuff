# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Load modules.
module purge
#module load sems-env
#module load sems-cmake/3.5.2
#module load sems-gcc/5.1.0
#module load sems-openmpi/1.8.7
#module load sems-git/2.1.3
#module load sems-netcdf/4.3.2/parallel
#module load sems-boost/1.59.0/base
#module load sems-hdf5/1.8.12/parallel
#module load sems-tex/2015
#module load parmetis/4.0.3/gcc/5.1.0/openmpi/1.8.7

# Git configuration.
source ~/.git-completion.bash
source ~/.git-prompt.sh

# Proxy settings.
export http_proxy=http://wwwproxy.sandia.gov:80
export https_proxy=http://wwwproxy.sandia.gov:80

# The following creates a three-line prompt that looks like the following:
# <blank line>
# <machine name>: <current working directory> ------------------- <date> <time>
# [<command #>] <user name>$
export PS1='\n\[$(printf "%*s" $(($(tput cols)-20)) "" | sed "s/ /-/g") \d \t\r\h: \w \]\n[\#] \u$(__git_ps1 " (%s)")\$ '

# Set the visual editor.
export VISUAL='vi'

# MY_HOME will be the location on my solid state drive in which I do all my
# building and running.
export MY_HOME=/build

# Set various PATH variables.
export PATH=~/Downloads/ParaView-5.1.2-Qt4-OpenGL2-MPI-Linux-64bit/bin:~/eclipse/cpp-neon/eclipse:/usr/local/texlive/2016/bin/x86_64-linux:${MY_HOME}/Packages/install/bin:${MY_HOME}/Packages/forked-install/bin:~/bin:~/anaconda3/bin:~/Downloads/cmake-3.6.1-Linux-x86_64/bin:/usr/local/bin:/usr/totalview/bin:${PATH}
export LD_LIBRARY_PATH=/usr/local/lib64:/usr/local/lib:/usr/local/hdf5/lib:${LD_LIBRARY_PATH}
export MANPATH=/usr/local/texlive/2016/texmf-dist/doc/man:${MANPATH}
export INFOPATH=/usr/local/texlive/2016/texmf-dist/doc/info:${INFOPATH}

# Set Trilinos-related environment variables.
export TRILINOS_DIR=${MY_HOME}/Packages/Trilinos
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
export TEUCHOS_DIR=${TRILINOS_DIR}/packages/teuchos
export THYRA_DIR=${TRILINOS_DIR}/packages/thyra
export TPETRA_DIR=${TRILINOS_DIR}/packages/tpetra
export DREKAR_BASE_DIR=${TRILINOS_DIR}/DrekarBase/drekar
export DREKAR_RESEARCH_DIR=${TRILINOS_DIR}/DrekarResearch
export DREKAR_SYSTEM_TESTS_DIR=${MY_HOME}/Packages/DrekarSystemTests
export DREKAR_DOCS_DIR=${MY_HOME}/Packages/DrekarDocuments/trunk
export CHARON_DIR=${TRILINOS_DIR}/tcad-charon
export CHARON_DATA_DIR=${TRILINOS_DIR}/charon-data
export CHARON_OUO_DATA_DIR=${TRILINOS_DIR}/charon-ouo-data
export DREKAR_BUILD_DIR=${MY_HOME}/Packages/build/mpi-drekar
export PANZER_BUILD_DIR=${DREKAR_BUILD_DIR}/packages/panzer
export CHARON_BUILD_DIR=${DREKAR_BUILD_DIR}/tcad-charon
export FORKED_TRILINOS_DIR=${MY_HOME}/Packages/jmgateTrilinos
export FORKED_AMESOS_DIR=${FORKED_TRILINOS_DIR}/packages/amesos
export FORKED_EPETRA_DIR=${FORKED_TRILINOS_DIR}/packages/epetra
export FORKED_KOKKOS_DIR=${FORKED_TRILINOS_DIR}/packages/kokkos
export FORKED_NOX_DIR=${FORKED_TRILINOS_DIR}/packages/nox
export FORKED_PANZER_DIR=${FORKED_TRILINOS_DIR}/packages/panzer
export FORKED_PHALANX_DIR=${FORKED_TRILINOS_DIR}/packages/phalanx
export FORKED_PIRO_DIR=${FORKED_TRILINOS_DIR}/packages/piro
export FORKED_RYTHMOS_DIR=${FORKED_TRILINOS_DIR}/packages/rythmos
export FORKED_SACADO_DIR=${FORKED_TRILINOS_DIR}/packages/sacado
export FORKED_STK_DIR=${FORKED_TRILINOS_DIR}/packages/stk
export FORKED_STRATIMIKOS_DIR=${FORKED_TRILINOS_DIR}/packages/stratimikos
export FORKED_TEKO_DIR=${FORKED_TRILINOS_DIR}/packages/teko
export FORKED_TEUCHOS_DIR=${FORKED_TRILINOS_DIR}/packages/teuchos
export FORKED_THYRA_DIR=${FORKED_TRILINOS_DIR}/packages/thyra
export FORKED_TPETRA_DIR=${FORKED_TRILINOS_DIR}/packages/tpetra
export FORKED_DREKAR_BASE_DIR=${FORKED_TRILINOS_DIR}/DrekarBase/drekar
export FORKED_DREKAR_RESEARCH_DIR=${FORKED_TRILINOS_DIR}/DrekarResearch
export FORKED_CHARON_DIR=${FORKED_TRILINOS_DIR}/tcad-charon
export FORKED_CHARON_DATA_DIR=${FORKED_TRILINOS_DIR}/charon-data
export FORKED_CHARON_OUO_DATA_DIR=${FORKED_TRILINOS_DIR}/charon-ouo-data
export FORKED_DREKAR_BUILD_DIR=${MY_HOME}/Packages/build/forked-mpi-drekar
export FORKED_PANZER_BUILD_DIR=${FORKED_DREKAR_BUILD_DIR}/packages/panzer
export FORKED_CHARON_BUILD_DIR=${FORKED_DREKAR_BUILD_DIR}/tcad-charon

# cd with history.
function myCd
{
  if [ $# -ge 1 ]; then
    pushd $@ > /dev/null
  else
    pushd $HOME > /dev/null;
  fi
} # end of function myCd

# Generally useful aliases.
alias .b="source ~/.bashrc"
alias .bp="source ~/.bash_profile"
alias less="less -R"
alias grep="grep --color"
alias rgrep="grep -rsIn"
alias f="find . -name"
alias o="xdg-open"
alias rm="rm -v"
alias cd="myCd"
alias up="cd .."
alias back="popd > /dev/null"
alias dirs="dirs -v"
alias cls="clear; ls"
alias ssh="ssh -Y"
alias texdocs="cd /usr/local/texlive/2016/texmf-dist/doc"

# Machine aliases.
alias skybridge="ssh jmgate@skybridge.sandia.gov"
alias hansen="ssh jmgate@hansen.sandia.gov"
alias shiller="ssh jmgate@shiller.sandia.gov"
alias estolad="ssh estolad"

# Trilinos aliases.
alias myhome="cd ${MY_HOME}"
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
alias teuchos="cd ${TEUCHOS_DIR}"
alias thyra="cd ${THYRA_DIR}"
alias tpetra="cd ${TPETRA_DIR}"
alias dbase="cd ${DREKAR_BASE_DIR}"
alias dres="cd ${DREKAR_RESEARCH_DIR}"
alias dstests="cd ${DREKAR_SYSTEM_TESTS_DIR}"
alias ddocs="cd ${DREKAR_DOCS_DIR}"
alias charon="cd ${CHARON_DIR}"
alias cdata="cd ${CHARON_DATA_DIR}"
alias codata="cd ${CHARON_OUO_DATA_DIR}"
alias dbuild="cd ${DREKAR_BUILD_DIR}"
alias pbuild="cd ${PANZER_BUILD_DIR}"
alias cbuild="cd ${CHARON_BUILD_DIR}"
alias discfe="cd ${PANZER_DIR}/disc-fe/src"
alias dofmgr="cd ${PANZER_DIR}/dof-mgr/src"
alias adapstk="cd ${PANZER_DIR}/adapters-stk/src"
alias pcore="cd ${PANZER_DIR}/core/src"
alias ftrilinos="cd ${FORKED_TRILINOS_DIR}"
alias famesos="cd ${FORKED_AMESOS_DIR}"
alias fepetra="cd ${FORKED_EPETRA_DIR}"
alias fkokkos="cd ${FORKED_KOKKOS_DIR}"
alias fnox="cd ${FORKED_NOX_DIR}"
alias fpanzer="cd ${FORKED_PANZER_DIR}"
alias fphalanx="cd ${FORKED_PHALANX_DIR}"
alias fpiro="cd ${FORKED_PIRO_DIR}"
alias frythmos="cd ${FORKED_RYTHMOS_DIR}"
alias fsacado="cd ${FORKED_SACADO_DIR}"
alias fstk="cd ${FORKED_STK_DIR}"
alias fstratimikos="cd ${FORKED_STRATIMIKOS_DIR}"
alias fteko="cd ${FORKED_TEKO_DIR}"
alias fteuchos="cd ${FORKED_TEUCHOS_DIR}"
alias fthyra="cd ${FORKED_THYRA_DIR}"
alias ftpetra="cd ${FORKED_TPETRA_DIR}"
alias fdbase="cd ${FORKED_DREKAR_BASE_DIR}"
alias fdres="cd ${FORKED_DREKAR_RESEARCH_DIR}"
alias fcharon="cd ${FORKED_CHARON_DIR}"
alias fcdata="cd ${FORKED_CHARON_DATA_DIR}"
alias fcodata="cd ${FORKED_CHARON_OUO_DATA_DIR}"
alias fdbuild="cd ${FORKED_DREKAR_BUILD_DIR}"
alias fpbuild="cd ${FORKED_PANZER_BUILD_DIR}"
alias fcbuild="cd ${FORKED_CHARON_BUILD_DIR}"
alias fdiscfe="cd ${FORKED_PANZER_DIR}/disc-fe/src"
alias fdofmgr="cd ${FORKED_PANZER_DIR}/dof-mgr/src"
alias fadapstk="cd ${FORKED_PANZER_DIR}/adapters-stk/src"
alias fpcore="cd ${FORKED_PANZER_DIR}/core/src"
