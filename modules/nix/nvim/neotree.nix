{}:
{
	programs.nixvim = {
		plugins = {
			neo-tree = {
				enable = true;
				enableDiagnostics = true;
				enableGitStatus = true;
				window = {
					position = "right";
					width = "45"
				};	
			};
		};
	};
}
