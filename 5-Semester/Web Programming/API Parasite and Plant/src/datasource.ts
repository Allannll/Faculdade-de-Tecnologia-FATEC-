import "reflect-metadata"
import { DataSource } from "typeorm"

export const AppDataSource = new DataSource({
    type: 'postgres',
    host: 'localhost',
    port: 5432,
    username: 'postgres',
    password: '123456', 
    database: 'plantas',
    synchronize: false,
    entities: ['src/models/*.ts'],
    migrations: ['src/migrations/*.ts'],
});