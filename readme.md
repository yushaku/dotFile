# yushaku's dotfiles

## Contents

- Neovim config
- tmux config
- git config
- zsh config

## Neovim setup

### Requirements

- Neovim >= **0.9.0** (needs to be built with **LuaJIT**)
- Git >= **2.19.0**
- [LazyVim](https://www.lazyvim.org/)
- a [Nerd Font](https://www.nerdfonts.com/) **_(optional)_**
- [lazygit](https://github.com/jesseduffield/lazygit) **_(optional)_**
- for [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) **_(optional)_**
  - **live grep**: [ripgrep](https://github.com/BurntSushi/ripgrep)
  - **find files**: [fd](https://github.com/sharkdp/fd)
- [Catppuccin](https://github.com/catppuccin/nvim)

## download open-source tools

```bash
bash prepare.sh zsh
bash prepare.sh tools
bash prepare.sh js
bash prepare.sh docker
```

## copy file configuration

Option: `shell` | `tmux` | `theme` | `lazyvim` | `all`

```bash
 ./set.sh <option>
```

### neovim configuration

LazyVim is a Neovim setup powered by 💤 lazy.nvim
to make it easy to customize and extend your config.
![neovim](https://user-images.githubusercontent.com/292349/213447056-92290767-ea16-430c-8727-ce994c93e9cc.png)

### zsh configuration

z-shell powered by a lot of cool plugin like fzf, fzf-tab, auto suggestion...
![intro2](https://github.com/yushaku/dotFile/assets/72312124/310a876b-7500-4f86-af82-2d2a73b7b80f)

## make mint-os like mac-os

link [youtube](https://www.youtube.com/watch?v=AnNx-Se9wkc&t=710s)

## turso database

```bash
curl -sSfL https://get.tur.so/install.sh | bash
turso db create
```

## quicktype

[quicktype github](https://github.com/glideapps/quicktype)

```bash
pnpm install -g quicktype
quicktype --just-types --prefer-types --prefer-unions \
-o /tmp/output_quicktype.ts \
data.json
```

Options for TypeScript

```bash
--[no-]just-types                                  Interfaces only (off by default)
--[no-]nice-property-names                         ransform property names to be JavaScripty (off by default)
--[no-]explicit-unions                             Explicitly name unions (off by default)
--[no-]runtime-typecheck                           Verify JSON.parse results at runtime (on by default)
--[no-]runtime-typecheck-ignore-unknown-properties Ignore unknown properties when verifying at runtime (off by default)
--[no-]prefer-unions                               Use union type instead of enum (off by default)
--[no-]prefer-types                                Use types instead of interfaces (off by default)

--acronym-style original|pascal|camel|lowerCase    Acronym naming style
--converters top-level|all-objects                 Which converters to generate (top-level by default)
--raw-type json|any                                Type of raw input (json by default)
```

## git commit like pro

- use with [gitmoji](https://github.com/carloscuesta/gitmoji)

```bash
pnpm install -g gitmoji-cli
```

## format json with jq

```bash
sudo install -y jq

curl -X GET  http://localhost:3000/api/setup | jq
% Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                Dload  Upload   Total   Spent    Left  Speed
100   233    0   233    0     0    682      0 --:--:-- --:--:-- --:--:--   683
{
  "user": {
    "name": "yushaku",
    "position": "full-stack developer",
    "skill": ['use HTML hack Nasa'],
  },
}
```

## configuration file to use specific github account

```bash
nvim ~/.ssh/config

# add ssh config
Host yushaku
  HostName github.com
  User git
  IdentitiesOnly yes
  IdentityFile ~/.ssh/id_rsa


# usage that configuration
git clone yushaku:yushaku/dotfiles
```

## Terminal + AI

[warp terminal](https://docs.warp.dev/getting-started/readme)

```bash
sudo install -y warp-terminal
```

## pnpm ubuntu

```js
export PNPM_HOME="/home/yushaku/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
```

pnpm mac-os

```sh
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
```

## security package manager

npq allows you to audit npm packages before you install them

[npq](https://github.com/lirantal/npq?ref=dailydev)
