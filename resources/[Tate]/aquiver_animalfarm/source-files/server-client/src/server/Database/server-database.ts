import mysql from "mysql";
import { SharedConfig } from "../../../../shared/shared-config";
import { AnimalBaseRepository } from "./models/model-animal";
import { CompostsBaseRepository } from "./models/model-composts";
import { FarmBaseRepository } from "./models/model-farm-base";
import { PaddockBaseRepository } from "./models/model-paddock";

export const ServerDatabase = new class {
    private mysqlConnection: mysql.Connection;

    public FarmRepository: FarmBaseRepository;
    public PaddockRepository: PaddockBaseRepository;
    public AnimalRepository: AnimalBaseRepository;
    public CompostsRepository: CompostsBaseRepository;

    constructor() {
        console.info('Connecting to Mysql server...');

        this.mysqlConnection = mysql.createConnection({
            host: SharedConfig.Mysql.host,
            database: SharedConfig.Mysql.database,
            user: SharedConfig.Mysql.user,
            password: SharedConfig.Mysql.password,
            port: SharedConfig.Mysql.port
        });

        this.mysqlConnection.connect(err => {
            if(err) {
                console.error('Database could not connect.');
                console.error(err);
                return;
            }

            console.info('Database successfully connected!');
            this.FarmRepository = new FarmBaseRepository(this.mysqlConnection);
            this.PaddockRepository = new PaddockBaseRepository(this.mysqlConnection);
            this.AnimalRepository = new AnimalBaseRepository(this.mysqlConnection);
            this.CompostsRepository = new CompostsBaseRepository(this.mysqlConnection);

            TriggerEvent(global.exports[GetCurrentResourceName()].obfuscate_database_load());
        });
    }
}