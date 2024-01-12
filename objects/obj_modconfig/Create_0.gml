selecting = -1
optionselected = -1
depth = -99
selected = 0
ini_open("modconfig.ini")
bg_x = 0
bg_y = 0
menu_arr = [
	["Exit", "none"],
	["Smooth Cam", global.smoothcam],
	["Slope Angling", global.slopeangle],
	["Block Style", global.blockstyle],
	["Remix", global.remix]
]
cooldown = 15
optionimg = spr_Opeppino
sped = -1
infor = "Set Thing Here"