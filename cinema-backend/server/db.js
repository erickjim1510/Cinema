import { createPool } from 'mysql2/promise';

export const pool = createPool({
  host: 'mysql',
  port: 3306,
  user: 'root',
  password: 'Sagas123',
  database: 'dbcinema'
});

