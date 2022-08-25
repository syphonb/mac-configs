# mac-configs

- pull this repo into your .config folder.
- install packer https://github.com/wbthomason/packer.nvim
- open nvim and run `:PackerInstall`

---
## NEED TO REVIEW SINCE NEW CONFIG

## Plugin Shortcuts Keys

### Surround
While highlighting the brackets or quotes you want to replace:
Press `cs` + the existing character followed by the new character.
EG: `cs{[` would replace { with [

### Commentary
Comment stuff out. Use `gcc` to comment out a line (takes a count), gc to comment out the target of a motion (for example, `gcap` to comment out a paragraph), `gc` in visual mode to comment out the selection, and `gc` in operator pending mode to target a comment. You can also use it as a command, either with a range like `:7,17Commentary`, or as part of a :global invocation like with `:g/TODO/Commentary`. That's it.

### Telescope
Leader key + ff eg: `,ff`

### Nvim Tree
Leader key + n eg: `,n`
---
