if (instance_exists(owner)) {
    x = owner.x;
    y = owner.y;
} else {
    instance_destroy(); // Owner is gone, so this light can go too
}
