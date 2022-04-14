import mysql from 'mysql';
import { SharedConfig } from '../../../../shared/shared-config';

/** This source will be continued and published to npm.  */

export class MysqlConnection
{
    private _pool: mysql.Connection;

    constructor(
        private host: string,
        private database: string,
        private user: string,
        private password: string,
        private port: number = 3306
    )
    {
        this._pool = mysql.createConnection({
            host: this.host,
            user: this.user,
            database: this.database,
            password: this.password,
            port: this.port
        });
    }
    get pool()
    {
        return this._pool;
    }
    get connected()
    {
        return this.pool ? true : false;
    }
}

export abstract class BaseDatabase<T, I> {
    constructor(protected connection: mysql.Connection, protected tableName: string) { }

    public queryCounts:number = 0;

    abstract constructModel(row: I): T;

    private async QueryBaseExecute(
        query: string,
        params: any[],
        connection: mysql.Connection
    ): Promise<any>
    {
        return new Promise((resolve, reject) =>
        {
            connection!.query(query, params, (error, result) =>
            {
                if (error) return reject(error);
                return resolve(result);
            })
        });
    }

    async query(query: string, values?: any): Promise<T[]>
    {
        if(SharedConfig.Mysql.QueryDebugger) {
            console.log(`[#${this.queryCounts} @${this.tableName}] ${query}`);
            this.queryCounts++;
        }

        let rows = await this.QueryBaseExecute(query, values, this.connection);
        if (Array.isArray(rows)) return this.constructModels(rows);
        return rows;
    }
    /** It returns the Object keys & values in a string. (Mysql SET) */
    private mysqlStringSet(obj: Object)
    {
        let w: string[] | string = [];
        Object.entries(obj).forEach(([key, value]) =>
        {
            if (typeof value === 'string')
                (w as string[]).push(`${key} = '${value}'`);
            else if (typeof value === 'number' || typeof value === 'boolean')
                (w as string[]).push(`${key} = ${value}`);
            else if(typeof value === 'undefined' || value == null)
                (w as string[]).push(`${key} = NULL`);
        });
        return w.join(', ');
    }
    /** It returns the Object keys & values in a string. (Mysql WHERE) */
    private mysqlStringWhere(obj: Object)
    {
        let w: string[] | string = [];
        Object.entries(obj).forEach(([key, value]) =>
        {
            if (typeof value === 'string')
                (w as string[]).push(`${key} = '${value}'`);
            else if (typeof value === 'number' || typeof value === 'boolean')
                (w as string[]).push(`${key} = ${value}`);
        });
        return w.join(' AND ');
    }
    update(d: { where?: Partial<I>, set?: Partial<I> })
    {
        let qryString = `UPDATE ${this.tableName}`;
        qryString += ' ';

        if (typeof d.set !== 'undefined' && Object.keys(d.set).length > 0)
        {
            let setArr = 'SET ' + this.mysqlStringSet(d.set);
            qryString += setArr;
        }

        if (typeof d.where !== 'undefined' && Object.keys(d.where).length > 0)
        {
            qryString += ' ';
            let whereArr = 'WHERE ' + this.mysqlStringWhere(d.where);
            qryString += whereArr;
        }

        return this.query(qryString);
    }
    find(d: { where: Partial<I>, find?: Array<keyof I>, limit?: number })
    {
        let qryString = 'SELECT ';

        if (typeof d.find !== 'undefined' && Array.isArray(d.find))
        {
            let findArr = d.find.join(', ');
            qryString += findArr;
        }
        else
        {
            qryString += '*';
        }

        qryString += ' ';
        qryString += `FROM ${this.tableName}`;

        if (typeof d.where !== 'undefined' && Object.keys(d.where).length > 0)
        {
            qryString += ' ';
            let whereArr = 'WHERE ' + this.mysqlStringWhere(d.where);
            qryString += whereArr;
        }

        if (typeof d.limit === 'number' && d.limit > 0)
        {
            qryString += ' ';
            qryString += `LIMIT ${d.limit}`;
        }

        return this.query(qryString);
    }
    delete(d: { where: Partial<I>, limit?: number })
    {
        let qryString = `DELETE FROM ${this.tableName}`;
        qryString += ' ';

        if(typeof d.where === 'undefined' || Object.keys(d.where).length < 1) 
            return console.error('Bad mysql delete trigger.');

        let whereArr = 'WHERE ' + this.mysqlStringWhere(d.where);
        qryString += whereArr;

        if(typeof d.limit === 'number' && d.limit > 0) {
            qryString += ' ';
            qryString += `LIMIT ${d.limit}`;
        }

        return this.query(qryString);
    }
    insert(model: Partial<I>)
    {
        return this.QueryBaseExecute(`INSERT INTO ${this.tableName} SET ?`, [model], this.connection);
    }
    async exist(w: Partial<I>)
    {
        if (w && Object.keys(w).length > 0)
        {

            let qryString = `SELECT count(*) as count FROM ${this.tableName}`;
            qryString += ' ';
            qryString += 'WHERE ' + this.mysqlStringWhere(w);
            qryString += ' ';
            qryString += 'LIMIT 1';

            const res = await this.QueryBaseExecute(qryString, [], this.connection);
            if (res && res[0])
            {
                return res[0].count > 0 ? true : false;
            }
        }
    }
    private constructModels(rows: any)
    {
        return rows.map(a => this.constructModel(a));
    }
    all()
    {
        return this.query(`SELECT * FROM ${this.tableName}`);
    }
}