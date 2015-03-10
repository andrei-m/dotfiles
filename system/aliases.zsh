# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
fi

alias ls="ls -a"

# git aliases
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gd="git diff"

# clypd alias
alias mit="make integration-test"
alias mcm="make check && cd .. && make integration-test"

