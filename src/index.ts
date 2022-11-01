import dotenv from 'dotenv-safe';
import add from '@math/add';

dotenv.config();

console.log(process.env.NAME);
console.log(add(1, 2));
