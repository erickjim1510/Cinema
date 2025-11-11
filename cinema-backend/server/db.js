/*import  {createPool} from 'mysql2/promise';

export const pool = createPool({
    host:"localhost",
    port:3307,
    user:"root",
    password:"Sagas123",
    database:"dbcinema",
});*/

import { createPool } from "mysql2/promise";

export const pool = createPool({
  host: process.env.DB_HOST || "localhost",
  port: process.env.DB_PORT || 3307,
  user: process.env.DB_USER || "root",
  password: process.env.DB_PASSWORD || "Sagas123",
  database: process.env.DB_NAME || "dbcinema",
});
