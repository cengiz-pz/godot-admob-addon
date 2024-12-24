#
# © 2024-present https://github.com/cengiz-pz
#

class_name AdmobEnv extends RefCounted

var config : Dictionary = {
		"android": {
			"test": {
				"app_id":"",
				"banner_id":"",
				"interstitial_id":"",
				"rewarded_id":"",
				"rewarded_interstitial_id":"",
			},
			"prod": {
				"app_id":"",
				"banner_id":"",
				"interstitial_id":"",
				"rewarded_id":"",
				"rewarded_interstitial_id":"",
			},
		},
		"ios" :{
			"test": {
				"app_id":"",
				"banner_id":"",
				"interstitial_id":"",
				"rewarded_id":"",
				"rewarded_interstitial_id":"",
			},
			"prod": {
				"app_id":"",
				"banner_id":"",
				"interstitial_id":"",
				"rewarded_id":"",
				"rewarded_interstitial_id":"",
			},
			"att_text": ""
		},
		"common" : {
			"test": true
		}
	}


func _init() -> void:
	_load_config()


func _load_config() -> void:
	var env = ConfigFile.new()
	var err = env.load("res://addons/AdmobPlugin/.env")
	if err == OK:
		for key in config.keys():
			var config_value = config[key]
			for value in config_value.keys():
				if typeof(config_value[value]) == TYPE_DICTIONARY:
					for param in config_value[value].keys():
						config_value[value][param] = env.get_value("%s/%s" % [key,value], param, "")
				else:
					config_value[value] = env.get_value("%s" % [key], value, "")
	else:
		printerr("[AdMob Error] Unable to read .env file at path 'res://addons/AdMob/.env'")
