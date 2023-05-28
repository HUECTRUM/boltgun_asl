//Create by:AniMeliodas,HUECTRUM

state("Boltgun-Win64-Shipping")
{
	int lvl : 0x04CD7A50, 0x60, 0xFF0;
    float igt: 0x4CFF1F8, 0x140, 0x17C;
}
init
{
    vars.cumulative = 0;
}

start
{
	if (current.igt > 0 && current.lvl != 7209065)
	{
		vars.cumulative = 0;
        return true;
	}
}
split
{
	return old.lvl != current.lvl 
		&& old.lvl != 7209065 
		&& current.lvl != 7209065;
}
gameTime
{
	if (current.igt < old.igt)
	{
		vars.cumulative += old.igt - current.igt;
	}
	return TimeSpan.FromSeconds(vars.cumulative + current.igt);
}

reset
{
	return old.lvl == 7209065 && current.lvl != 7209065;
}

isLoading
{
	return true;
}