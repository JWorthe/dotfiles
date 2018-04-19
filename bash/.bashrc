#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias t='task'

PS1='[\w]\$ '

export GEM_HOME=$HOME/.gem
[[ -d $GEM_HOME/ruby/2.5.0/bin ]] && export PATH=$GEM_HOME/ruby/2.5.0/bin:$GEM_HOME/bin/:$PATH

export PATH=$HOME/auto:$HOME/.cargo/bin:$PATH
export RUST_SRC_PATH=$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src

alias config='/usr/bin/git --git-dir=/home/justin/.cfg/ --work-tree=/home/justin'
alias getjustinsmail='systemctl --user start getmail'

