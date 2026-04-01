extends CharacterBody2D

@onready var animacao = $AnimatedSprite2D
var velocidade = 50
var estaAtacando = false

func _physics_process(delta: float) -> void:
	if(estaAtacando):
		return
	var direcao = Vector2.ZERO
	
	direcao.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direcao.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	velocity = direcao.normalized() * velocidade
	move_and_slide()
	
	
	
	if direcao == Vector2.ZERO:
		animacao.play("idle")
	if direcao.x != 0:
		animacao.play("walk")
		animacao.flip_h = direcao.x < 0
	

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("attack") and not estaAtacando:
		attack()
	
func attack():
	estaAtacando = true
	velocity = Vector2.ZERO
	animacao.play("attack")

func _on_animated_sprite_2d_animation_finished() -> void:
	if animacao.animation == "attack":
		estaAtacando = false
