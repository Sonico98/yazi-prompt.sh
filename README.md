# Introduction
[Yazi](https://yazi-rs.github.io/) users making use of the [dropping to the shell](https://yazi-rs.github.io/docs/tips/#dropping-to-the-shell) tip may want to display an indicator to easily know they're inside a yazi subshell. The following are simple instructions needed to accomplish that.
If your shell theme is not listed below and requires specific instructions to work, feel free to submit a PR!

# Instructions
## Bash
<details>
<summary>Default prompt</summary>

Add the following at the end of your ~/.bashrc file:

```
YAZI_TERM=""
if [ -n "$YAZI_LEVEL" ]; then
	YAZI_TERM="|  Yazi terminal: "
fi
PS1="$PS1$YAZI_TERM"
```
</details>

##  Zsh
<details>
<summary>Default prompt</summary>

Add the following at the end of your ~/.zshrc file:

```
YAZI_TERM=""
if [ -n "$YAZI_LEVEL" ]; then
	YAZI_TERM="|  Yazi terminal: "
fi
PS1="$PS1$YAZI_TERM"
```
</details>

<details>
<summary>Powerlevel10k</summary>

If using [powerlevel10k](https://github.com/romkatv/powerlevel10k), you may add the following after the function prompt_example in ~/.p10k.zsh instead:

```
function prompt_yazi() {
    if [ -n "$YAZI_LEVEL" ]; then
    	p10k segment -f 005 -i '' -t 'Yazi terminal'
    fi
}
```
Then add `yazi` to `POWERLEVEL9K_LEFT_PROMPT_ELEMENTS` or `POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS`, near the top of ~/.p10k.zsh.

005 is the segment color. If you want to change it, you can run this in a terminal to see all available colors: 
```
for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
```
</details>

## Fish
<details>
<summary>Default prompt</summary>

It's a bit trickier to apply a general solution to fish. If someone knows a better way of doing this, please open a Pull Request.

Open a fish shell and execute `funced fish_prompt`. This will open up your text editor. Add the following near the end of the file, inside the fish_prompt function, before any echo or printf calls: 

```
if test -n "$YAZI_LEVEL"
    set suffix "  Yazi terminal $suffix"
end
```
Make sure `$suffix` is present in the echo or printf line, save the file and exit your editor. Fish should ask you if you want to save the file, confirm. In case it doesn't, execute `funcsave fish_prompt`.

As an example, this is how the end of the file looks for the default fish prompt:
```
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

If you use fish  with [tide](https://github.com/IlanCosman/tide) here is a way to end up with a nice prompt:

- Create the file `~/.config/fish/functions/_tide_item_yazi.fish`

```shell
function _tide_item_yazi
    if test -n "$YAZI_LEVEL"
        _tide_print_item yazi ' Yazi terminal'
    end
end
```

- Run the following commands to add color to the prompt:
**NOTE**: You can pick whatever colors you are interested in

```shell
set --universal tide_yazi_bg_color brblack
set --universal tide_yazi_color black
```

- Add `yazi-prompt` to the tide_left_prompt:
**NOTE**: Adjust it to your `tide_left_prompt`

```shell
set --universal tide_left_prompt_items os yazi context pwd git newline character
```

- Reload `tide reload`
</details>

# Screenshots
This is what you can expect to see by following the instructions above:

## Bash
<details>
<summary>Default prompt</summary>

![bash](https://github.com/Sonico98/yazi-prompt.sh/assets/61394886/05f8c124-c428-4b12-ac04-a4da98bbe06a)
</details>

## Zsh
<details>
<summary>Default prompt</summary>

![zsh](https://github.com/Sonico98/yazi-prompt.sh/assets/61394886/a2f693c7-3c82-4294-ac26-665def2e4a54)
</details>
<details>
<summary>Powerlevel10k</summary>

![p10k](https://github.com/Sonico98/yazi-prompt.sh/assets/61394886/650b977f-d215-4b93-957c-191a4313a897)
</details>

## Fish
<details>
<summary>Default prompt</summary>

![fish](https://github.com/Sonico98/yazi-prompt.sh/assets/61394886/7463296b-74df-48f9-b013-6d8e7c72b131)
</details>
<details>
<summary>Tide</summary>

![tide](https://github.com/Sonico98/yazi-prompt.sh/assets/61394886/96fa8d43-6d00-4dae-a250-300d2dce104f)
</details>
