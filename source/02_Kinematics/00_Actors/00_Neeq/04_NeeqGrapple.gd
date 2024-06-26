#Inherits NeeqCombat Code
extends NeeqCombat
class_name NeeqGrapple
#------------------------------------------------------------------------------#
#Variables
var look: Vector2 = Vector2.ZERO
#OnReady Variables
@onready var grapple_guide = $Grapple/Sprites/GrappleGuideSprite
#------------------------------------------------------------------------------#
func grapple_rotation() -> void:
	if grapple_guide.visible:
		if G.ACTIONS.CONTROLLER == "Mouse & Keyboard":
			grapple_guide.look_at(get_global_mouse_position())
		else:
			look.x = snapped(Input.get_joy_axis(0, JOY_AXIS_LEFT_X), 0.001)
			look.y = snapped(Input.get_joy_axis(0, JOY_AXIS_LEFT_Y), 0.001)
			grapple_guide.rotation = look.angle()
			if Input.get_action_strength("move_down") == 0 && \
				Input.get_action_strength("move_up") == 0 && \
				Input.get_action_strength("move_left") == 0 && \
				Input.get_action_strength("move_right") == 0:
					if facing.x == FACING_RIGHT: grapple_guide.rotation = 0
					else: grapple_guide.rotation = deg_to_rad(180)
