extends CharacterBody2D

@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D

func setup(data):
	#Espera carregar todo o nó
	if not is_node_ready():
		await ready
	
	#Essa variavel vai ser a responsavel, por mudar
	#a classe e o sexo do personagem
	var new_player = load(data.sprite_sheet)
	
	if new_player:
		sprite.texture = new_player #Nova textura da Sprite
		print("Nova textura carregada: ",new_player)
	else:
		print("Deu ruim, não carregou a nova textura...")
	
	#toca a animação, isso é só um teste
	animation.play("idle")
