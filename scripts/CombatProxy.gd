# res://scripts/CombatProxy.gd
#----------------------------------------------------------------------#
### QUAL PADRÃO DE PROJETO PODE SER IDENTIFICADO NESTE ARQUIVO? ###
### PROXY
#----------------------------------------------------------------------#
extends Node

# unit.gd chama este método no lugar de rpc_id direto.
# O Proxy valida e encaminha para o servidor.
func solicitar_dano(alvo: Node, valor: int):
	if alvo == null or alvo.is_dead:
		return
	# Valida se há conexão ativa antes de tentar enviar
	if multiplayer.multiplayer_peer == null:
		return
	print("[CombatProxy] Solicitando %d de dano em %s" % [valor, alvo.name])
	_rpc_receber_dano.rpc_id(1, alvo.get_path(), valor)

# Proxy também centraliza a propagação do HP — chamado pelo servidor.
func propagar_hp(alvo_path: NodePath, novo_hp: int):
	if not multiplayer.is_server():
		return
	_rpc_aplicar_hp.rpc(alvo_path, novo_hp)

# ── RPCs internos — não são chamados diretamente por outros scripts ──
@rpc("any_peer", "reliable")
func _rpc_receber_dano(alvo_path: NodePath, valor: int):
	if not multiplayer.is_server():
		return
	var alvo = get_node_or_null(alvo_path)
	if alvo == null or alvo.is_dead:
		return
	var novo_hp = clamp(alvo.current_hp - valor, 0, alvo.max_hp)
	print("[CombatProxy] Aplicando HP: %s → %d" % [alvo.name, novo_hp])
	_rpc_aplicar_hp.rpc(alvo_path, novo_hp)

@rpc("authority", "call_local", "reliable")
func _rpc_aplicar_hp(alvo_path: NodePath, novo_hp: int):
	var alvo = get_node_or_null(alvo_path)
	if alvo == null:
		return
	alvo.current_hp = novo_hp
	if alvo.current_hp <= 0 and not alvo.is_dead:
		alvo._morrer()
