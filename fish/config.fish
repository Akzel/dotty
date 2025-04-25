# add cargo/bin to PATH
set -x PATH $HOME/.cargo/bin $PATH
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
set -gx PATH "$HOME/.rvm/bin" $PATH
set -gx PATH "$HOME/.local/share/gem/ruby/3.3.0/bin" $PATH
