extends Node
onready var music : AudioStreamPlayer = get_node("Music/music")
onready var hammer : AudioStreamPlayer = get_node("Efx/Hammer")
onready var slide : AudioStreamPlayer = get_node("Efx/slide")

func play_music():
	if !music.playing:
		music.play()

func play_hammer():
	if !hammer.playing:
		hammer.play()

func play_slide():
	if !slide.playing:
		slide.play()
