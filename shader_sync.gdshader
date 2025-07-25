shader_type canvas_item;

uniform float ext_time = 0.0;
varying flat float delta_time;

void vertex() {
	delta_time = ext_time - TIME;
}

void fragment() {
	COLOR = vec4(clamp(delta_time+8.0, 0.0, 16.0)/16.0, 0.0, 0.125, 1.0);
}
