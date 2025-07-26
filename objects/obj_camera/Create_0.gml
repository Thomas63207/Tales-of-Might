camera = view_camera[0];

camDist = -300;
camFov = 90;
camAsp = camera_get_view_width(camera) / camera_get_view_height(camera);

follow = obj_player;

camera_width = camera_get_view_width(camera);
camera_height = camera_get_view_height(camera);


xto = x;
yto = y;