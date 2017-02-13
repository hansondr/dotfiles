# makes color contants available
autoload -U colors
colors

# enable colored output from ls, etc. on FreeBSD-based systems
export CLICOLOR=1

# Import colorscheme from 'wal'
(wal -r &)
source "$HOME/.cache/wal/colors.sh"
