import 'dotenv-safe/config';
import add from '@math/add';
import createDebug from 'debug';

const log = createDebug('Index');
log.enabled = true;

log(process.env.NAME);
log(add(1, 2));
