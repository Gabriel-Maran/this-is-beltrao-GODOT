extends Node
#Script GLOBAL

var characteres_data = {
	"cleriga":{
		"name" : "Cleriga",
		"portrait" : "res://portrait/cleric(f).png",
		"sprite_sheet" : "res://sprite/cleric.png",
		"offset_frame" : 50#(Coluna x  Linha)
	},
	"clerigo":{
		"name" : "Clerigo",
		"portrait" : "res://portrait/cleric(m).png",
		"sprite_sheet" : "res://sprite/cleric.png",
		"offset_frame" : 0#(Linha x  coluna)
	},
	"maga":{
		"name" : "Mago",
		"portrait" : "res://portrait/wizard(f).png",
		"sprite_sheet" : "res://sprite/wizard.png",
		"offset_frame" : 50#(Linha x  coluna)
	},
	"mago":{
		"name" : "Cleriga",
		"portrait" : "res://portrait/wizard(m).png",
		"sprite_sheet" : "res://sprite/wizard.png",
		"offset_frame" : 0#(Coluna x  Linha)
	},
	"arqueira":{
		"name" : "Arqueira",
		"portrait" : "res://portrait/ranger(f).png",
		"sprite_sheet" : "res://sprite/ranger.png",
		"offset_frame" : 50#(Coluna x  Linha)
	},
	"arqueiro":{
		"name" : "arqueiro",
		"portrait" : "res://portrait/ranger(m).png",
		"sprite_sheet" : "res://sprite/ranger.png",
		"offset_frame" : 0#(Coluna x  Linha)
	},
	"guerreira":{
		"name" : "Guerreira",
		"portrait" : "res://portrait/warrior(f).png",
		"sprite_sheet" : "res://sprite/warrior.png",
		"offset_frame" : 50#(Coluna x  Linha)
	},
	"guerreiro":{
		"name" : "Guerreiro",
		"portrait" : "res://portrait/warrior(m).png",
		"sprite_sheet" : "res://sprite/warrior.png",
		"offset_frame" : 0#(Coluna x  Linha)
	}
}

#Variavel que guarda o ID do personagem escolhido 

var selected_char_key : String = ""

#Um dicionario CHAVE -> VALOR
