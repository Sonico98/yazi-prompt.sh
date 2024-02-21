# Introduction
Users making use of the [dropping to the shell](https://yazi-rs.github.io/docs/tips/#dropping-to-the-shell) tip may want to display an indicator to easily know they're inside a yazi subshell. The following are simple instructions needed to accomplish that.

# Instructions
### Bash / Zsh
Add the following to your ~/.bashrc or ~/.zshrc file:
```
YAZI_TERM=""
if [ -n "$YAZI_LEVEL" ]; then
	YAZI_TERM="|  Yazi terminal: "
fi
PS1="$PS1$YAZI_TERM"
```
### Powerlevel10k (Zsh)
If using powerlevel10k, you may add the following after the function prompt_example in ~/.p10k.zsh:
```
function prompt_yazi() {
    if [ -n "$YAZI_LEVEL" ]; then
    	p10k segment -f 005 -i '' -t 'Yazi terminal'
    fi
}
```
Then add `yazi` to `POWERLEVEL9K_LEFT_PROMPT_ELEMENTS` or `POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS`, near the top of ~/.p10k.zsh.
### Fish
It's a bit trickier to apply a genral solution to fish.
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

# Screenshots

