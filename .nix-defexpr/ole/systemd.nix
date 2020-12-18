let mkOption = name: value:
		if value == null then
			null
		else
			"${name}=${value}";

	filterOptions = builtins.filter (x: x != null);

	mkService = {type ? null, remainAfterExit ? null, execStart ? null}:
		builtins.concatStringsSep "\n" (filterOptions [
			"[Service]"
			(mkOption "Type"            type)
			(mkOption "RemainAfterExit" remainAfterExit)
			(mkOption "ExecStart"       execStart)
		]);

in {
	inherit mkService;
}
