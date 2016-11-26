#include <amxmodx>

#pragma semicolon 1

new const SKYNAME[] = "desert"; // skybox name

new g_SkyName;

public plugin_precache() {
	register_plugin("Sky change helper", "0.1", "AMXX.Shop");
	new const SKYNAME_POSTFIXES[][] = {"bk", "dn", "ft", "lf", "rt", "up"};
	new Buffer[96];
	for(new i; i < sizeof SKYNAME_POSTFIXES; i++) {
		formatex(Buffer, charsmax(Buffer), "gfx/env/%s%s.tga", SKYNAME, SKYNAME_POSTFIXES[i]);
		if(!file_exists(Buffer)) {
			format(Buffer, charsmax(Buffer), "File ^"%s^" not found", Buffer);
			set_fail_state(Buffer);
		}
		precache_generic(Buffer);
	}
	g_SkyName = get_cvar_pointer("sv_skyname");
}

public plugin_cfg() {
	set_pcvar_string(g_SkyName, SKYNAME);
}
