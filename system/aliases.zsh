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
alias e="vim"

# clypd alias
alias mit="make integration-test"
alias mcm="make -C .. integration-test-up && make check && make -C .. integration-test-run"
alias mcmr="make -C .. integration-test-up && make check && make -C .. integration-test-run && make -C .. redshift-integration-test"

alias fixaudio="sudo launchctl unload /System/Library/LaunchDaemons/com.apple.audio.coreaudiod.plist && sudo launchctl load /System/Library/LaunchDaemons/com.apple.audio.coreaudiod.plist"
alias cl="cd $GOPATH/src/clypd"
alias ans="cd ~/dev/ansible"
alias jg="cd ~/dev/go/src/github.com/andrei-m/jira-graph"
