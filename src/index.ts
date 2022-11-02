import 'dotenv-safe/config';
import add from '@math/add';
import createDebug from 'debug';

const log = createDebug('Index');
log.enabled = true;

console.log(process.env.NAME);
console.log(add(1, 2));
