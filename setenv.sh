unset TEXINPUTS
unset BIBINPUTS
export TEXINPUTS=$HOME/book/contents/:$TEXINPUTS
export BIBINPUTS=$HOME/book/contents/:$BIBINPUTS

# This for the bug(?) with openmp
export OMP_NUM_THREADS=1
export OPENBLAS_NUM_THREADS=1

alias ll='ls -lt'
alias s='cd ..'
alias lmr='ls -lt | head'

# We need a Documents dir at $HOME for Chpt 7
if [ -d "$HOME/Documents" ] 
then
	rm -rf "$HOME/Documents"
fi

mkdir "$HOME/Documents"