# ensure dotfiles bin directory is loaded first
PATH="$HOME/.bin:/usr/local/sbin:$PATH"

UNAME_MACHINE="$(/usr/bin/uname -m)"

if [[ "${UNAME_MACHINE}" == "arm64" ]]
  then
    HOMEBREW_PREFIX="/opt/homebrew"
  else
    HOMEBREW_PREFIX="/usr/local"
  fi

# Initialize shellenv for brew
eval "$($HOMEBREW_PREFIX/bin/brew shellenv)"

# Add homebrew bin folder the PATH.
export PATH="$HOMEBREW_PREFIX/bin:$PATH"

# Try loading ASDF from the regular home dir location
if [ -f "$HOME/.asdf/asdf.sh" ]; then
 . "$HOME/.asdf/asdf.sh"
elif which brew >/dev/null &&
 [ -f "$HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh" ]; then
 . "$HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh"
fi

# mkdir .git/safe in the root of repositories you trust
export PATH=".git/safe/../../bin:$PATH"

if type "npm" > /dev/null && [ "$FDF_ZSH_CONFIG_PATH_DISABLE_NPM" != true ]; then
  export PATH="$(npm bin -g):$PATH"

  # We don't need the path twice, hence we are disabling this for yarn here.
  # However, you can force enable this when you export the variable with a value
  # of `false`.
  if [ "$FDF_ZSH_CONFIG_PATH_DISABLE_YARN" == false ]; then
    export FDF_ZSH_CONFIG_PATH_DISABLE_YARN=true
  fi
fi

if type "yarn" > /dev/null && [ "$FDF_ZSH_CONFIG_PATH_DISABLE_YARN" != true ]; then
  export PATH="$(yarn global bin):$PATH"
fi

export -U PATH
