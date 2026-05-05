extends CanvasLayer

@onready var grid_container: GridContainer = $VBoxContainer/GridContainer
@onready var confirm_button: Button = $VBoxContainer/ConfirmButton
@onready var label: Label = $VBoxContainer/Label


func _ready() -> void:
	#Garante que nenhum personagem começe o jogo sem ser selecionado
	Global.selected_char_key = ""
	if confirm_button:
		confirm_button.disabled = true
	
	print("Hora de escolher o personagem!")

func _on_texture_button_pressed(key: String) -> void:
	print("Personagem escolhido: ", key)
	#A variavel Global passa a ter o valor do personagem escolhido
	Global.selected_char_key = key
	
	#Passa os dados do personagem escolhido
	var character_data = Global.characters_data[key]
	label.text = "Herói selecionado: " + character_data.name
	
	#Habilita o botão de JOGAR!
	confirm_button.disabled = false
	
func _on_confirm_button_pressed():
	#Muda para o MAPA, e começa o jogo!
	get_tree().change_scene_to_file("res://scene/game.tscn")
