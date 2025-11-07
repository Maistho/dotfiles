if test -d /opt/homebrew
	eval "$(/opt/homebrew/bin/brew shellenv)"
    # I would like to use this but was running into issues with installing cocoapods...
    # Comment out if you're getting odd issues
    set -x PATH $HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin $PATH
end
