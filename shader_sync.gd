extends Node3D

static var _static_start_time := _get_time()
var _shader_start_time: float = 0.0

signal start_time_updated(float);


static func _get_time() -> float:
	return float(Time.get_ticks_msec()) / 1000.0


func _ready():
	# at first, send a rough estimation
	start_time_updated.emit(_static_start_time)
	if OS.is_debug_build():
		print("static = {0}".format([_static_start_time]))
	$Viewport/ColorRect.material.set_shader_parameter("ext_time", _get_time())
	

func _process(_delta):
	var color: Color = $Viewport.get_texture().get_image().get_pixel(0,0)
	if absf(color.b - 0.125) < 0.001:
		_shader_start_time = color.r * 16.0 - 8.0
		
		# then, send a precise measure
		start_time_updated.emit(_shader_start_time)
		if OS.is_debug_build():
			print("shader = {0}".format([_shader_start_time]))
		queue_free()
