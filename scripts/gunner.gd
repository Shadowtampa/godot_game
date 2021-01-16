extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var vel = 200




var mouse_position = 0

var current_state = 0
# 0 = idle
# 1 = movimento
# 2 = atirando


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	pass # Replace with function body.

func _process(delta):
	
	var mouse_position = get_local_mouse_position()
	
	var movimento_direita = 0
	
	var movimento_esquerda = 0
	
	var movimento_frente = 0
	
	var movimento_atras = 0
	
	# MOVIMENTACAO
	if Input.is_action_pressed("direita"):
		movimento_direita = 1
		
	if Input.is_action_pressed("esquerda"):
		movimento_esquerda = -1

		
	if Input.is_action_pressed("atras"):
		movimento_atras = 1
			
	if Input.is_action_pressed("frente"):
		current_state = 1
		movimento_frente = -1
		
	set_position(get_position() + Vector2(vel,0) * delta * (movimento_direita + movimento_esquerda))
	
	set_position(get_position() + Vector2(0,vel) * delta * (movimento_frente + movimento_atras))
	
	#CENTRALIZAR CAMERA
	
	
	#PLAYER OLHA PRO MOUSE
	rotation += mouse_position.angle()*0.9
	
	#PLAYER NAO SAI DA CENA
	if get_position().x > (640 - 50):
		movimento_direita = 0
	
	#PLAYER ATIRA
	if Input.is_action_just_pressed("atirar"):
		print("atirei gay")
		
	#PLAYER MUDA DE SPRITE
#	if current_state == 0:
#		$Sprite.play("idle")
#
#	elif current_state == 1:
#		$Sprite.play("move")
#
#	elif current_state == 2:
#		$Sprite.play("fire")
#
#	else:
#		$Sprite.play("idle")
		
		
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
