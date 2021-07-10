# adds better zsh autocompletion
export FPATH="/opt/local/share/zsh/site-functions:$FPATH"

# a function for all-in-one software upgrades

autoload -Uz packageupgrade

# Helper function to conditionally regenerate the comp file.
# Speeds up shell startup times
zstyle ':compinstall' filename '$HOME/.zshrc'

zcachedir="$HOME/.zcache"
[[ -d "$zcachedir" ]] || mkdir -p "$zcachedir"

_update_zcomp() {
	setopt local_options
	setopt extendedglob
	autoload -Uz compinit
	local zcompf="$1/zcompdump-${ZSH_VERSION}"
	# use a separate file to determine when to regenerate, as compinit doesn't
	# always need to modify the compdump
	local zcompf_a="${zcompf}.augur"

	if [[ -e "${zcompf_a}" && -f "${zcompf_a}"(#qN.md-1) ]]; then
		compinit -C -d "${zcompf}"
	else
		compinit -d "${zcompf}"
		touch "${zcompf_a}"
	fi
	# if zcompdump exists (and is non-zero), and is older than the .zwc file,
	# then regenerate
	if [[ -s "${zcompf}" && (! -s "${zcompf}.zwc" || "${zcompf}" -nt "${zompf}.zwc") ]]; then
		# since file is mapped, it might be mapped right now (current shells), so rename it
		# then make a new one
		[[ -e "${zcompf}.zwc" ]] && mv -f "${zcompf}.zwc" "${zcompf}.zwc.old"
		# compile it mapped, so multiple shells can share it (total mem reduction)
		# run in background
		zcompile -M "${zcompf}" &!
	fi
}
