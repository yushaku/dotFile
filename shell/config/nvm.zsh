# See https://github.com/nvm-sh/nvm#installation-and-update
if [[ -z "$NVM_DIR" ]]; then
  if [[ -d "$HOME/.nvm" ]]; then
    export NVM_DIR="$HOME/.nvm"
  elif [[ -d "${XDG_CONFIG_HOME:-$HOME/.config}/nvm" ]]; then
    export NVM_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/nvm"
  fi
fi

# Don't try to load nvm if command already available
# Note: nvm is a function so we need to use `which`
! which nvm &>/dev/null || return

if [[ -f "$NVM_DIR/nvm.sh" ]]; then
  # Load nvm if it exists in $NVM_DIR
  source "$NVM_DIR/nvm.sh" ${NVM_LAZY+"--no-use"}
elif (( $+commands[brew] )); then
  # Otherwise try to load nvm installed via Homebrew
  # User can set this if they have an unusual Homebrew setup
  NVM_HOMEBREW="${NVM_HOMEBREW:-${HOMEBREW_PREFIX:-$(brew --prefix)}/opt/nvm}"
  # Load nvm from Homebrew location if it exists
  if [[ -f "$NVM_HOMEBREW/nvm.sh" ]]; then
    source "$NVM_HOMEBREW/nvm.sh" ${NVM_LAZY+"--no-use"}
  else
    return
  fi
else
  return
fi

# Call nvm when first using node, npm or yarn
if (( $+NVM_LAZY )); then
  function node npm yarn $NVM_LAZY_CMD {
    unfunction node npm yarn $NVM_LAZY_CMD
    nvm use default
    command "$0" "$@"
  }
fi

# Autoload nvm when finding a .nvmrc file in the current directory
# Adapted from: https://github.com/nvm-sh/nvm#zsh
if (( $+NVM_AUTOLOAD )); then
  load-nvmrc() {
    local node_version="$(nvm version)"
    local nvmrc_path="$(nvm_find_nvmrc)"

    if [[ -n "$nvmrc_path" ]]; then
      local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

      if [[ "$nvmrc_node_version" = "N/A" ]]; then
        nvm install
      elif [[ "$nvmrc_node_version" != "$node_version" ]]; then
        nvm use
      fi
    elif [[ "$node_version" != "$(nvm version default)" ]]; then
      echo "Reverting to nvm default version"
      nvm use default
    fi
  }

  autoload -U add-zsh-hook
  add-zsh-hook chpwd load-nvmrc

  load-nvmrc
fi

# Load nvm bash completion
for nvm_completion in "$NVM_DIR/bash_completion" "$NVM_HOMEBREW/etc/bash_completion.d/nvm"; do
  if [[ -f "$nvm_completion" ]]; then
    # Load bashcompinit
    autoload -U +X bashcompinit && bashcompinit
    # Bypass compinit call in nvm bash completion script. See:
    # https://github.com/nvm-sh/nvm/blob/4436638/bash_completion#L86-L93
    ZSH_VERSION= source "$nvm_completion"
    break
  fi
done

unset NVM_HOMEBREW NVM_LAZY NVM_AUTOLOAD nvm_completion

# [[ -f "$NVM_DIR/nvm.sh" ]] || return 0

# local -a _1st_arguments
# _1st_arguments=(
#   'help:show help'
#   '--version:print out the latest released version of nvm'
#   'install:download and install a version in <node|iojs|node version number>'
#   'install-latest-npm:download and install the latest npm version'
#   'uninstall:uninstall a version'
#   'use:modify PATH to use <version>. Uses .nvmrc if available'
#   'exec:run <command> on <version>. Uses .nvmrc if available'
#   'run:run `node` on <version> with <args> as arguments. Uses .nvmrc if available'
#   'current:list installed versions'
#   'ls:list installed versions or versions matching a given description'
#   'version:resolve the given description to a single local version'
#   'version-remote:resolve the given description to a single remote version'
#   'ls-remote:list remote versions available for install'
#   'deactivate:undo effects of `nvm` on current shell'
#   'alias:show or set aliases'
#   'unalias:deletes an alias'
#   'reinstall-packages:reinstall global `npm` packages contained in <version> to current version'
#   'unload:unload `nvm` from shell'
#   'which:display path to installed node version. Uses .nvmrc if available'
# )

# _arguments -C '*:: :->subcmds' && return 0

# if (( CURRENT == 1 )); then
#   _describe -t commands "nvm subcommand" _1st_arguments
#   return
# fi
