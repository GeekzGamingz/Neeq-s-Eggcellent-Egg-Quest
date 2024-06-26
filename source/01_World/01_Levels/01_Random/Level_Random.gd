#Inherits Node2D Code
extends Node2D
#------------------------------------------------------------------------------#
#Variables
#Exported Variables
@export_enum("Minor", "Moderate", "Major", "Mystery") var LEVEL: String
#OnReady Variables
@onready var changers_minor = $SceneChangers/Minor
@onready var changers_moderate = $SceneChangers/Moderate
@onready var changers_major = $SceneChangers/Major
#------------------------------------------------------------------------------#
#Ready Method
func _ready() -> void:
	match(LEVEL):
		"Minor":
			for changer in changers_moderate.get_children(): changer.monitoring = false
			for changer in changers_major.get_children(): changer.monitoring = false
		"Moderate":
			for changer in changers_minor.get_children(): changer.monitoring = false
			for changer in changers_major.get_children(): changer.monitoring = false
		"Major":
			for changer in changers_minor.get_children(): changer.monitoring = false
			for changer in changers_moderate.get_children(): changer.monitoring = false
