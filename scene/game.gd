extends Node2D

@onready var map: TileMapLayer = $Map
@onready var player_pos: Node2D = $PlayerPos
@onready var camera: Camera2D = $Camera2D

#Pré carregamento do personagem escolhido
var new_game = preload("res://player.tscn")

#CUIDADO ao escolher os números, nossos mapas são diferentes
var pos = Vector2i(35,17)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Buscar os dados do novo jogador
	var dados = Global.characters_data[Global.selected_char_key]
	
	#Instância jogador (Sprite) no mapa
	var hero = new_game.instantiate()
	player_pos.add_child(hero)
	
	#Carrega a classe e o sexo do personagem escolhido
	hero.setup(dados)
	
	# Aqui o personagem vai parar no mapa (Posição Global)
	var positionHero = map.map_to_local(pos)
	hero.global_position = positionHero
	
	#Passa o jogador local para a câmera
	configurarCamera(hero)
	
func configurarCamera(jogador_local):
	#Pega as propriedades da câmera
	var remote = RemoteTransform2D.new()
	remote.remote_path = camera.get_path()
	#faz a câmera seguir o personagem
	jogador_local.add_child(remote)
	
	#posiconar a câmera
	camera.global_position = jogador_local.global_position
