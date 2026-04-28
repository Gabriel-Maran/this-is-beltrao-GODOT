extends CharacterBody2D


#Referência as animações do Personagem
@onready var animacao = $AnimatedSprite2D

#Velocidadae de movimento do personagem
var velocidade = 50 
var estaAtacando = false

#Variavel de controle de estados 
var  esta_atacando = false

func _physics_process(delta: float) -> void:
	
	#Esse if espera a animação de ataque terminar
	if esta_atacando:
		return
	
	#Personagem começa parado
	var direcao = Vector2.ZERO
	
	#Pegar os input do teclado para mover o personagem
	direcao.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direcao.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	#Normalizar o vetor(evita correr no diagonal)
	velocity = direcao.normalized() * velocidade 
	
	move_and_slide()

	# ANIMAÇÕES
	#Se o personagem esta parado, toca a animação correspondente0
	if direcao == Vector2.ZERO:
		animacao.play("idle")
	
	#O personagem não está parado
	if direcao.x != 0: 
		animacao.play("walk")
		animacao.flip_h = direcao.x < 0 
		
func _input(event):
	if event.is_action_pressed("atacar") and not esta_atacando:
		attack()
	
	
func attack():
	esta_atacando = true #Agora ele está no ESTADO de ataque
	velocity = Vector2.ZERO #Paro o personagem
	animacao.play("attack")
		
		

func _on_animated_sprite_2d_animation_finished() -> void:
	if animacao.animation == "attack":
		esta_atacando = false
