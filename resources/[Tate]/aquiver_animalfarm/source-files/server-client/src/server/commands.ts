import * as sdk from "./server";

// setImmediate(() =>
// {
//     TriggerClientEvent('chat:addSuggestion', 1, '/farm', 'Farm commands. (Admin)', [
//         { name: 'create, goto, img, resell' }
//     ]);
// });

/** Development commands

/** You can delete this /farmskin command if you want. I just needed it for the images and video. */
RegisterCommand('farmskin', (source: string) => {
    const Player = sdk.players.at(source);
    if(!Player || !Player.isAdmin) return;

    SetPlayerModel(source, GetHashKey('a_m_m_farmer_01'));
}, false);


RegisterCommand('spawnshit', (source:string) => {
    const Player = sdk.players.at(source);
    if(!Player || !Player.isAdmin) return;

    const farmPaddocks = sdk.paddocks.getFarmPaddocks(Player.dimension);
    if(!farmPaddocks) return;
    farmPaddocks.forEach(paddock => {
        paddock.SpawnShit();
    });
}, false);

RegisterCommand('givemilk', (source:string) => {
    const Player = sdk.players.at(source);
    if(!Player || !Player.isAdmin) return;

    const farmPaddocks = sdk.paddocks.getFarmPaddocks(Player.dimension);
    if(!farmPaddocks) return;
    farmPaddocks.forEach(paddock => {
        paddock.Animals.forEach(animal => {
            switch(animal.animalType) {
                case "COW": {
                    animal.milk += 85;
                    break;
                }
                case "PIG": {
                    animal.weight += 90;
                    break;
                }
            }
        });
    });

}, false);

RegisterCommand('spawnloot', (source: string) => {
    const Player = sdk.players.at(source);
    if(!Player || !Player.isAdmin) return;

    const farmLoots = sdk.loots.getFarmLoots(Player.dimension);
    if(!farmLoots) return;
    
    farmLoots.eggLoot = farmLoots.getMaxEggLoot;
    farmLoots.mealLoot = farmLoots.getMaxMealLoot;
    farmLoots.milkLoot = farmLoots.getMaxMilkLoot;
}, false);

RegisterCommand('farm', (source: number | string, args: string[]) =>
{
    const Player = sdk.players.at(source);
    if (!Player) return;

    /** Return instantly if player is not admin. */
    if(!Player.isAdmin) return;

    const [first, second, third, fourth] = args;

    if (first == undefined)
    {
        Player.sendChat('/farm [create, goto, img, price, resell, position]');
        return;
    }

    switch (first)
    {
        case "price": {
            const id = parseInt(second),
                price = parseInt(third);

            if(!id || !price)
                return Player.sendChat('/farm price [farmId] [newPrice]');

            const Farm = sdk.farms.at(id);
            if (!Farm) return Player.sendChat('Farm is not exist!');

            Farm.price = price;
            Player.sendChat(`Farm price changed to ${price}.`);

            break;
        }
        case "position": {
            const id = parseInt(second);

            if(!id) return Player.sendChat('/farm position [farmId]');

            const Farm = sdk.farms.at(id);
            if (!Farm) return Player.sendChat('Farm is not exist!');
            
            Farm.position = Player.position;
            Player.sendChat(`Farm position changed.`);
            break;
        }
        case "resell": {
            const id = parseInt(second);

            if (!id) return Player.sendChat('/farm resell [farmId]');

            const Farm = sdk.farms.at(id);
            if (!Farm) return Player.sendChat('Farm is not exist!');

            Farm.ownerIdentifier = null;
            Farm.ownerName = null;
            Player.sendChat('You resold the Farm, it is buyable again.');

            break;
        }
        case "create": {
            const name = second,
                price = parseInt(third),
                img = fourth,
                { x, y, z } = Player.position;

            if (name == undefined || price == undefined || img == undefined)
            {
                Player.sendChat('/farm create [name] [price] [img URL]');
                Player.sendChat('Farm will be created on your current position!');
                return;
            }
            if (typeof price !== 'number' || price < 1)
                return Player.sendChat('Price is not a valid number!');

            sdk.farms.insert({
                egg: 0,
                meal: 0,
                milk: 0,
                locked: true,
                img: img,
                name: name,
                ownerIdentifier: null,
                ownerName: null,
                price: price,
                x: x,
                y: y,
                z: z
            }).then(() =>
            {
                Player.sendChat(`Farm successfully created!`);
            }).catch(err =>
            {
                Player.sendChat('Farm has not been created, some error happened!');
                console.error(err);
            });

            break;
        }
        // case "delete": {
        //     const id = parseInt(second);

        //     if(!id) {
        //         Player.sendChat('/farm delete [farmId]');
        //         return;
        //     }

        //     break;
        // }
        case "goto": {
            const id = parseInt(second);

            if (!id)
            {
                Player.sendChat('/farm goto [farmId]');
                return;
            }
            const Farm = sdk.farms.at(id);
            if (!Farm) return Player.sendChat('Farm is not exist!');

            Player.position = Farm.position;
            Player.sendChat(`You have teleported to Farm ID: ${id}!`);

            break;
        }
        case "img": {
            const id = parseInt(second),
                img = third;

            if (!id || img == undefined)
                return Player.sendChat('/farm img [farmId] [img URL]');

            const Farm = sdk.farms.at(id);
            if (!Farm) return Player.sendChat('Farm is not exist!');

            Farm.img = img;
            Player.sendChat(`Successfully changed the farm image!`);

            break;
        }
    }
}, false);