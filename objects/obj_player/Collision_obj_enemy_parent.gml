if (i_frames == 0 && is_dead == false)
{
	if (other.damage <= hp) {
		hp -= other.damage;
	}
	else {
		hp -= hp;
	}
	i_frames = 50
}