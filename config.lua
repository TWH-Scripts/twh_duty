Config = {}

Config.commandTrigger = false
Config.command = "duty"

Config.distance = 1.5  --distance to show up prompt

Config.jobs = {"sheriff", "police", "medic"} --which jobs can go in and off duty

Config.DutyCoords = {
    ["Sheriff Valentine"] = {x = -276.11868286133 , y = 805.21697998047 , z = 118.38006591797, job = "police"}, --job in here must be in Config.jobs aswell
    ["Sheriff Blackwater"] ={x = -762.07666015625 , y = -1268.2001953125 , z = 43.041381835938, job = "police"},
    ["Sheriff Saint Denis"] ={x = 2506.6689453125 , y = -1308.7524414063 , z = 48.953678131104,job = "police"},
    ["Sheriff Rhodes"] ={x = 1362.0283203125 , y = -1302.0721435547 , z = 76.767959594727,job = "police"},
    ["Sheriff Annesburg"] ={x = 2909.6311035156 , y = 1309.0179443359 , z = 44.938407897949,job = "police"},
    ["Sheriff Strawberry"] ={x = -1807.8977050781 , y = -349.83367919922 , z = 164.65737915039,job = "police"},
    ["Sheriff Tumbleweed"] ={x = -5529.2509765625 , y = -2929.9738769531 , z = -1.3609260320663,job = "police"},

    
}
Config.language = {
    offduty = "Du bist nun ausser Dienst",
    induty = "Du bist nun im Dienst",
    duty ="Status",
    changeStatus = "Dienststatus ändern",
    device = "Stempeluhr",
    noJob ="Du kannst dich nicht ausstempeln";
}

local keys = {
    ["Prompt"] = 0x760A9C6F,
}



