-- FOR ESX:
INSERT INTO `items` (`name`, `label`) VALUES
  ('tv','TV'),
  ('microwave','Microwave'),
  ('telescope','Telescope'),
  ('lockpick','Lockpick'),
  ('laptop','Laptop'),
  ('rolex','Rolex'),
  ('art','Art'),
  ('coffeemaker','Coffee Maker');
  
  
 -- For QBUS:
QBShared.Items = {
	["tv"] = {["name"] = "tv", ["label"] = "TV", ["weight"] = 10, ["type"] = "item", ["image"] = "tv.png", ["unique"] = true, ["useable"] = false, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
	["art"] = {["name"] = "art", ["label"] = "Art", ["weight"] = 10, ["type"] = "item", ["image"] = "art.png", ["unique"] = true, ["useable"] = false, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
	["microwave"] = {["name"] = "microwave", ["label"] = "Microwave", ["weight"] = 10, ["type"] = "item", ["image"] = "microwave.png", ["unique"] = true, ["useable"] = false, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
	["telescope"] = {["name"] = "telescope", ["label"] = "Telescope", ["weight"] = 10, ["type"] = "item", ["image"] = "telescope.png", ["unique"] = true, ["useable"] = false, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
	["lockpick"] = {["name"] = "lockpick", ["label"] = "Lockpick", ["weight"] = 10, ["type"] = "item", ["image"] = "lockpick.png", ["unique"] = false, ["useable"] = false, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
	["laptop"] = {["name"] = "laptop", ["label"] = "Laptop", ["weight"] = 10, ["type"] = "item", ["image"] = "laptop.png", ["unique"] = false, ["useable"] = false, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
	["rolex"] = {["name"] = "rolex", ["label"] = "Rolex", ["weight"] = 10, ["type"] = "item", ["image"] = "rolex.png", ["unique"] = false, ["useable"] = false, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},
	["coffeemaker"] = {["name"] = "coffeemaker", ["label"] = "Coffee Maker", ["weight"] = 10, ["type"] = "item", ["image"] = "coffeemaker.png", ["unique"] = true, ["useable"] = false, ["shouldClose"] = false, ["combinable"] = nil, ["description"] = ""},

}

-- I couldn't find any info about adding items on VRP :/