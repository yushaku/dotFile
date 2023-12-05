# configuration my work flow

## auto download open source tools and code environment nodejs

```bash
bash prepare.hs zsh
bash prepare.hs tools
bash prepare.hs js
bash prepare.hs docker
```

## copy file configuration

Option: `shell` | `tmux` | `theme` | `lazyvim` | `all`

```bash
 ./set.sh <option>
```

### neovim configuration

LazyVim is a Neovim setup powered by 💤 lazy.nvim to make it easy to customize and extend your config.
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
--[no-]just-types                                           Interfaces only (off by default)
--[no-]nice-property-names                                  Transform property names to be JavaScripty (off by default)
--[no-]explicit-unions                                      Explicitly name unions (off by default)
--[no-]runtime-typecheck                                    Verify JSON.parse results at runtime (on by default)
--[no-]runtime-typecheck-ignore-unknown-properties          Ignore unknown properties when verifying at runtime (off by default)
--[no-]prefer-unions                                        Use union type instead of enum (off by default)
--[no-]prefer-types                                         Use types instead of interfaces (off by default)

--acronym-style original|pascal|camel|lowerCase             Acronym naming style
--converters top-level|all-objects                          Which converters to generate (top-level by default)
--raw-type json|any                                         Type of raw input (json by default)
```

## commit with gpt

- [opencommit](https://github.com/di-sukharev/opencommit#setup) use with [gitmoji](https://github.com/carloscuesta/gitmoji)

```bash
pnpm install -g gitmoji-cli opencommit
oco config set OCO_EMOJI=true
oco config set OCO_OPENAI_API_KEY=<key>
```

## format json with jq

```bash
sudo install -y jq

curl -X GET  http://localhost:3000/api/setup | jq
% Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                Dload  Upload   Total   Spent    Left  Speed
100   233    0   233    0     0    682      0 --:--:-- --:--:-- --:--:--   683
{
  "database": {
    "name": "ai-assistant",
    "dimension": 1536,
    "metric": "cosine",
    "pods": 1,
    "replicas": 1,
    "shards": 1,
    "podType": "starter"
  },
  "status": {
    "ready": true,
    "state": "Ready",
    "host": "ai-assistant-d6cf69f.svc.gcp-starter.pinecone.io",
    "port": 433
  }
}
```
