# Introduction

[Yazi](https://yazi-rs.github.io/) users making use of the [dropping to the shell](https://yazi-rs.github.io/docs/tips/#dropping-to-shell)
tip may want to display an indicator to easily know they're inside a yazi
subshell. The following are simple instructions needed to accomplish that. If
your shell theme is not listed below and requires specific instructions to work,
feel free to submit a PR!

## Instructions

### Bash

<details>
  <summary>Default prompt</summary>

  <details>
    <summary>Screenshot</summary>

![bash](https://github.com/Sonico98/yazi-prompt.sh/assets/61394886/05f8c124-c428-4b12-ac04-a4da98bbe06a)

  </details>

Copy and paste this into a terminal:

```sh
git clone https://github.com/Sonico98/yazi-prompt.sh ./yazi-prompt && \
chmod +x ./yazi-prompt/posix/yazi.sh && \
cp ./yazi-prompt/posix/yazi.sh  ~/.yazi.sh && \
echo '''source ~/.yazi.sh''' >> ~/.bashrc && \
rm -rf ./yazi-prompt
```

Then open a new shell or run `source ~/.bashrc`.

</details>

### Zsh

<details>
  <summary>Default prompt</summary>

  <details>
    <summary>Screenshot</summary>

![zsh](https://github.com/Sonico98/yazi-prompt.sh/assets/61394886/a2f693c7-3c82-4294-ac26-665def2e4a54)

  </details>

Copy and paste this into a terminal:

```sh
git clone https://github.com/Sonico98/yazi-prompt.sh ./yazi-prompt && \
chmod +x ./yazi-prompt/posix/yazi.sh && \
cp ./yazi-prompt/posix/yazi.sh  "$ZDOTDIR"/.yazi.sh && \
echo '''source "$ZDOTDIR"/.yazi.sh''' >> "$ZDOTDIR"/.zshrc && \
rm -rf ./yazi-prompt
```

Then open a new shell or run `source "$ZDOTDIR"/.zshrc`.

</details>

<details>
  <summary>Powerlevel10k</summary>

  <details>
    <summary>Screenshot</summary>

![p10k](https://github.com/Sonico98/yazi-prompt.sh/assets/61394886/650b977f-d215-4b93-957c-191a4313a897)

  </details>

If using [powerlevel10k](https://github.com/romkatv/powerlevel10k), copy and
paste this into a terminal:

```sh
git clone https://github.com/Sonico98/yazi-prompt.sh ./yazi-prompt && \
chmod +x ./yazi-prompt/zsh/p10k/yazi_p10k.zsh && \
cp ./yazi-prompt/zsh/p10k/yazi_p10k.zsh "$ZDOTDIR"/.yazi_p10k.zsh && \
sed 's/  # If p10k is already loaded, reload configuration./  source "$ZDOTDIR"\/.yazi_p10k.zsh×  # If p10k is already loaded, reload configuration./' ~/.p10k.zsh | tr '×' '\n' >| ~/.p10k.zsh.tmp && yes | mv ~/.p10k.zsh{.tmp,} && \
rm -rf ./yazi-prompt
```

Then add `yazi` to `POWERLEVEL9K_LEFT_PROMPT_ELEMENTS` or
`POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS`, near the top of ~/.p10k.zsh, and open a
new shell. You can modify the color by editing $ZDOTDIR/.yazi_p10k.zsh

</details>

### Fish

<details>
  <summary>Default prompt</summary>

  <details>
    <summary>Screenshot</summary>

![fish](https://github.com/Sonico98/yazi-prompt.sh/assets/61394886/7463296b-74df-48f9-b013-6d8e7c72b131)

  </details>
It's a bit trickier to apply a general solution to fish. If someone knows a
better way of doing this, please open a Pull Request.

Open a fish shell and execute `funced fish_prompt`. This will open up your text
editor. Add the following near the end of the file, inside the fish_prompt
function, before any echo or printf calls:

```fish
if test -n "$YAZI_LEVEL"
    set suffix "  Yazi terminal $suffix"
end
```

Make sure `$suffix` is present in the echo or printf line, save the file and exit
your editor. Fish should ask you if you want to save the file, confirm. In case
it doesn't, execute `funcsave fish_prompt`.

As an example, this is how the end of the file looks for the default fish prompt:

```fish
    [...]
    set -l prompt_status (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)
    if test -n "$YAZI_LEVEL"
      set suffix "  Yazi terminal $suffix"
    end

    echo -n -s (prompt_login)' ' (set_color $color_cwd) (prompt_pwd) $normal (fish_vcs_prompt) $normal " "$prompt_status $suffix " "
end
```

</details>

<details>
  <summary>Tide</summary>

  <details>
    <summary>Screenshot</summary>

![tide](https://github.com/Sonico98/yazi-prompt.sh/assets/61394886/96fa8d43-6d00-4dae-a250-300d2dce104f)

  </details>

If you use fish with [tide](https://github.com/IlanCosman/tide) here is a way to
end up with a nice prompt:

Copy and paste the following into a terminal:

```sh
git clone https://github.com/Sonico98/yazi-prompt.sh ./yazi-prompt && \
chmod +x ./yazi-prompt/fish/tide/_tide_item_yazi.fish && \
mkdir -p ~/.config/fish/functions/ && \
cp ./yazi-prompt/fish/tide/_tide_item_yazi.fish  ~/.config/fish/functions/_tide_item_yazi.fish && \
rm -rf ./yazi-prompt
```

Run the following commands to add color to the prompt:
**NOTE**: You can pick whatever colors you are interested in

```sh
set --universal tide_yazi_bg_color brblack
set --universal tide_yazi_color black
```

Add `yazi-prompt` to the tide_left_prompt:
**NOTE**: Adjust it to your `tide_left_prompt`

```sh
set --universal tide_left_prompt_items os yazi context pwd git newline character
```

Reload: `tide reload`

</details>

### Starship

<details>
  <summary>starship.toml</summary>

  <details>
    <summary>Screenshot</summary>

![starship](https://github.com/Sonico98/yazi-prompt.sh/assets/61394886/f46a2e45-afec-4672-977b-28ef64065d36)

  </details>

Add a custom module to your `starship.toml`.

```toml
[custom.yazi]
description = "Indicate the shell was launched by `yazi`"
symbol = " "
when = """ test -n "$YAZI_LEVEL" """
```

Include `${custom.yazi}` in your `format`.

```toml
format = """
$hostname\
$shell\
${custom.yazi}\
$username\
$sudo\
$character\
"""
```

</details>
