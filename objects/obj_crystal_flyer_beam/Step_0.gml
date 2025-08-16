if (round(image_index) == image_number - 1) {
	instance_destroy();
}

if (length < 1500) {
	length += 10;
}
else {
	//image_speed = 1;
}

image_xscale = length;
image_angle = angle;