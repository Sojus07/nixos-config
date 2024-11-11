{ config, pkgs, ... }:
{
	programs = {
		bash = {
            enable = true;
			enableCompletion = true;
			bashrcExtra = ''
				PS1="\[\e[35m\][\u@\h:\w] % \[\e[0m\]"
				eval "$(${pkgs.fzf}/bin/fzf --bash)"
				alias rm="rm -rv"
				alias mv="mv -v"
				alias ls="${pkgs.eza}/bin/eza -l --icons --absolute"
				alias mkdir="mkdir -pv"
				alias http="python3 -m http.server 1337"
			    alias update="doas nixos-rebuild switch"
            '';
		}; 
    
        git = {
            enable = true;
            userName = "meml0rz";
            userEmail = "meml0rz";
        };
	};	
}
