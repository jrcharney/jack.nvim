# JACK.nvim

Jason's Alternative Configuration to Kickstart.nvim

A succinct alternative to [Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) in that you get up and go!

This is the first project that I have written with the help of [ChatGPT](https://chatgpt.com/). Follow along with the raw session at [this link](https://chatgpt.com/canvas/shared/67b55e3fb5fc8191b8534b0929a0eb73)

My knowledge of [Lua](https://www.lua.org/) is very basic, and while I know there may be some ethical issues with letting generative AI write code, it does have its advantages.

For example, in this configuration, I wanted to have the best of everything.

- NeoVim's textual interface with the file tree (via nvim-tree) and tabs and buffers (via bufferline.nvim), and status line (via lualine.nvim)
- Microsoft VS Code's ease of use and UI/UX experience and keybindings (Ctrl+P, Ctrl+B, etc.)
- Kickstart.nvim support for LSP, Autocomplete, Treesitter Syntax Highlighting, and eventually interface supports.

The only difference is that the inital init.lua file is 169 lines long versus 900+ lines that Kickstart.nvim has.

Also, there's been a shift to use NeoVim more than Vim. Like a lot of the more modern themes (e.g. Synthweave) are written in Lua.

I wanted use something that wasn't convoluted. I wanted to write something where I could start coding not spending most of my time configuring Vim or NeoVim.  I want to write code in Python, C++, C#, and JavaScript.

If AI is going to replace programmers (which it shouldn't, it should assist them in being better programmers), then let me enjoy these dying embers of an industry and reserve my creativity and strengths doing what I love.  I mean, look at how it helped me develop this project. Isn't that how we should be using A.I.?  To help us be better programmers? 

Look at how the calculator helped us be better at producing mathematical figures or the computer to create better produced products, or the Internet or smartphones.  

Technology should be used to assist us, not supplant us! Some of us need that assistance for accessibility.

The world still needs accountants. If you are bringing in a bunch of computer hackers to do a financial audit, that should be a red flag. (If you are an American and have been paying attention to the news lately about how some billionaire technofascist is trying to make the American government be more business-like (which corporatization of goverment is fascism), you know what I'm talking about.)

We must use A.I. as a **partner** in development, not as our replacement.  A.I. will always need human guidance to do the right thing. There is no cost-saving replacing humans with some good coding skills with A.I. that has mediocre coding skills when left to its own devices.  It's like trying to let a lawnmower cut the grass without someone to make sure it doesn't run over anything.  You could write an A.I. for a A.I. lawnmower, but it will be more cost effective just to mow the lawn yourself or at very least hire someone to do it for you.

Jack.nvim should represent such a partnership.

## Feature Comparison

| Features        | JACK.nvim                                                    | Kickstart.nvim                                                  |
|-----------------|--------------------------------------------------------------|-----------------------------------------------------------------|
| Plugin Manager  | `lazy.nvim`                                                  | `lazy.nvim`                                                     |
| LSP Support     | `tsserver`, `pyright`, `clangd` pre-configured               | `tsserver`, `pyright`, `clangd`, and others with auto-detection |
| Autocomplete    | `nvim-cmp` with LSP support                                  | nvim-cmp with extended sources                                  |
| Treesitter      | Installed & enabled for `lua`, `python`, `cpp`, `javascript` | Installed & auto-updated with `ensure_installed = "all"`        |
| File Explorer   | `nvim-tree` for VS Code-style navigation                     |	❌ Not included                                                |
| Command Palette |	`telescope.nvim` with `Ctrl+p`                               | `telescope.nvim` with additional pickers                        |
| Tabs & Buffers  | `bufferline.nvim` for tab-like behavior                      |	❌ Uses native buffer switching                                |
| Status Line	  | `lualine.nvim` with `tokyonight` theme                       | `lualine.nvim` with a different setup                           |
| Theme	          | `synthweave.nvim`, `tokyonight.nvim`                         | Defaults to Neovim's theme                                      |
| Key Mappings	  | VS Code-like shortcuts (`Ctrl+P`, `Ctrl+B`, etc.)            | Uses Neovim defaults with some custom mappings                  |

## TODO List

- [ ] More NeoVim themes
- [ ] Better Git support
- [ ] Ensure Nerd Font support (I should have it already.)
- [ ] Window split support
- [ ] Play nice with TMUX
- [ ] Cheat.sh integration
- [ ] ChatGPT integration (they did help write the JACK.nvim `init.lua` file.) (likely will require an API key)
- [ ] Barebones Mode. (For when you are stuck in a vanilla command line on someone else's computer or if you are in bash for some technical emergency outside of X or Wayland.)
- [x] Cyberpunk or Synthwave theme
- [ ] Transparent background in theme
- [ ] Task warrior integration?
- [ ] Check to see if there are any accessibility features that I am missing to help those with disabilities.
- [ ] Rust support
- [x] Spellchecking (Enabled for text and markdown files)
- [x] `mason.nvim` support for LSP
- [x] ~~`null-ls.vim` alternative.~~ We're using `nvim-lint`.
- [x] Modify `nvim-lint to use symbols instead of letter.
- [x] Enable line numbering (should be a easy fix)
- [ ] Refresh the list of features in our table
- [ ] What features does NVChad have?
- [ ] Write down the list of plugins I used in my config file.
- [ ] A linter for Ruby
- [ ] Linters should be enabled only if they are available...and there should be a way to ask if you want to install them if they aren't.
- [ ] Wasn't there a plugin to auto reshape markdown tables? (It might be a linter.)
- [ ] How does NeoVim handle LaTeX?

## Software requirements

- `gcc` or `clang`
- `make`
- `git`
- `ripgrep`
- `fd`
- `unzip`
- `fzf`
- `neovim` (obviously)
- `luacheck` (for linting Lua)
- `clippy` (for linting Rust)
- `clangtidy` (for linting C++)
- `shellcheck` (for linting Bash)
- `eslint` (for linting JavaScript)
- `flake8` (for linting Python)

## Installation instructions

To replace your existing Neovim `init.lua` with the Jack.nvim `init.lua`, follow these instructions.

### 1. Backup your current configuration

Before making any changes, it is a good idea to back up your existing configuration file.

```bash
mv ~/.config/nvim/init.lua ~/.config/nvim/init.lua.backup
```

### 2. Replace `init.lua` with JACK.nvim's `init.lua`

Assuming you cloned this repo are in the repo directory, copy the JACK.nvim repo to your Neovim config directory.

> NOTE: If you don't have a NeoVim config directory, you should `mkdir -p ~/.config/nvim` first.

```bash
cp init.lua ~/.config/nvim/init.lua.backup
``` 

### 3. Remove any old plugins (optional, not recommended)

I really do not recommend doing this, even if you used a different configuration (e.g. Kickstart.nvim's stuff), it probably a good idea NOT to do this step.

We're pretty sure that `lazy.nvim` can help you with this step. So manybe skip this step before removing anything.

Still, if you want to live dangerously and break stuff like an idiot, you can run this command.

```bash
rm -rf ~/.local/share/nvim/lazy
```

Just don't say I didn't warn you.

### 4. Open Neovim and Install new plugins.

Launch Neovim

```bash
nvim
```

And run the following command to install the plugins

```vim
:Lazysync
```

### 5. Restart Neovim

Close and reopen NeoVim.

```vim
:q
```

```bash
nvim
```

NeoVim should now behave like VS Code with all the features that NeoVim provides!

## FAQ

### If you used ChatGPT Open AI to create this file, did you actually code it?

Yes. Although I did ask ChatGPT to write code, I still had to add my own corrections and I did have to ask it to make some changes that I'm not all that familiar with how to do in NeoVim or Vim.  I've asked the A.I. in the past to help me with fixing other computer in my home and it has been helpful.

Again, the idea is not to simply "use" A.I., but work collaboratively with it.  It relies on communication.  Ideally, speak to it politely even when it makes a mistake.

### Can you run this file in Vim?

No. It is designed for NeoVim, preferably v0.10.2 or later.

### Why not use a different A.I. like Grok or CoPilot?

Because I started out with Open A.I.  Eventually, I'd like to use my own A.I. maybe built out of a bunch of Raspberry Pis or some cheap mini-workstation PCs.  I'd like to keep my electric bill down.

### What is it that you plan to do with this configuration?

Learn Python...or at least combine some previous Python Scripts that were previously written with the help of Open A.I. to process data.

For example, ChatGPT helped me write a few smaller scripts to process a list of words from the Duolingo Spanish I had learned so far which I wanted to put into an Excel workbook.  I was also able to determine how many times each of those words occurred so that I could develop a pronunciation guide in the workbook.  Again, the A.I. wasn't doing the work for me. It was helping me process the data in the way that I wanted it to be put in the workbook.  In the end, it helped me add columns to count the rows, the frequency of words, and to expand rows that may have multiple definitions which would have taken hours of my own time.  This is how the A.I. should be used.

