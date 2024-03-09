# 005 is the segment color. If you want to change it, you can run this in a terminal to see all available colors: 
# for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done

function prompt_yazi() {
	if [ -n "$YAZI_LEVEL" ]; then
		p10k segment -f 005 -i '' -t 'Yazi terminal'
	fi
}
