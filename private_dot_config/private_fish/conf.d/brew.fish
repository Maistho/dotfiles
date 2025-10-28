if test -d /opt/homebrew
	eval "$(/opt/homebrew/bin/brew shellenv)"
	set -x PATH $HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin $PATH
end
