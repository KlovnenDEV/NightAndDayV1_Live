import * as sdk from "./server";

/** Main FiveM events here. Not all over the files. */
onNet('playerJoining', () =>
{
    playerJoin(global.source);
});
onNet('playerDropped', () =>
{
    sdk.players.playerDropped(global.source);
});

/** Triggered when the database is connected successfully. */
onNet(global.exports[GetCurrentResourceName()].obfuscate_database_load(), async () =>
{
    await sdk.farms.loadAll();

    const onlinePlayers = getPlayers();
    onlinePlayers.forEach(src =>
    {
        playerJoin(src);
    });
});

function playerJoin(source: string | number)
{
    setTimeout(() =>
    {
        sdk.players.playerJoining(source);
        sdk.farms.playerJoining(source);
    }, 1000);
}