![Godot v4.4+](https://img.shields.io/badge/Godot-v4.4+-%233d78a3)


# ShaderSync for Godot 4

A basic Godot scene to measure shader's startup delay, which depends on the running environment.

Can be used to synchronize shader TIME with engine Time, preventing lag.

Uses two techniques: gdscript static variable (rough, immediately available) + canvas_item shader feedback (precise, delayed).
