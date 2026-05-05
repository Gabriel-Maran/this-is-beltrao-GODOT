#Script GLOBAL
extends Node2D

var characters_data = {
	"cleriga":{
		"name" : "Clériga",
		"portrait" : "res://portrait/cleric(f).png",
		"sprite_sheet" : "res://sprite/cleric_female.png",
	},
	"clerigo":{
		"name" : "Clérigo",
		"portrait" : "res://portrait/cleric(m).png",
		"sprite_sheet" : "res://sprite/cleric_male.png",
	},
	"maga":{
		"name" : "Maga",
		"portrait" : "res://portrait/wizard(f).png",
		"sprite_sheet" : "res://sprite/wizard_female.png",
	},
	"mago":{
		"name" : "Mago",
		"portrait" : "res://portrait/wizard(m).png",
		"sprite_sheet" : "res://sprite/wizard_male.png",
	},
	"guerreira":{
		"name" : "Guerreira",
		"portrait" : "res://portrait/warrior(f).png",
		"sprite_sheet" : "res://sprite/warrior_female.png",
	},
	"guerreiro":{
		"name" : "Guerreiro",
		"portrait" : "res://portrait/warrior(m).png",
		"sprite_sheet" : "res://sprite/warrior_male.png",
	},
	"arquerira":{
		"name" : "Arqueira",
		"portrait" : "res://portrait/ranger(f).png",
		"sprite_sheet" : "res://sprite/ranger_female.png",
	},
	"arqueiro":{
		"name" : "Arqueiro",
		"portrait" : "res://portrait/ranger(m).png",
		"sprite_sheet" : "res://sprite/ranger_male.png",
	}
}

#Varaivel que guarda o ID do personagem escolhido
var selected_char_key : String = ""
