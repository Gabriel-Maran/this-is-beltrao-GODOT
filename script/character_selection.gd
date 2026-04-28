extends CanvasLayer

@onready var grid_container: GridContainer = $VBoxContainer/GridContainer
@onready var confirm_button: Button = $VBoxContainer/ConfirmButton
@onready var label: Label = $VBoxContainer/Label

func _ready() -> void:
	Global.selected_char_key = ""
	
	#Garante que nenhum personagem comece o jogo sem ser selecionado 
	if confirm_button: 
		confirm_button.disabled = true
	
	print("Hora de escolher o personagem!")
	
func _on_character_selected(key : String) -> void:
	print("Personagem escolhido: ", key)
	Global.selected_char_key = key

	var character_data = Global.characteres_data[key]
	label.text = 'Heroi selecionado' + character_data.name
