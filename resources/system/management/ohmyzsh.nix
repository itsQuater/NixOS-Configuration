# Configuration of the zsh terminal shell and its OhMyZsh extension.

{config, lib, pkgs, ...}:

{
	programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestions.enable = true;
		syntaxHighlighting.enable = true;
		shellAliases = {
			ff = "fastfetch";
			update = "doas nixos-rebuild switch --flake /etc/nixos/#nixos";
		};
		ohMyZsh = {
			enable = true;
			plugins = ["git" "history"];
		};
	};
}
