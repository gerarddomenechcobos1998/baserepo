import './common/env';
import Server from './common/server';
import routes from './routes';
import Settings from './settings';
import L from './common/logger';
const mongoose = require('mongoose');

L.info(Settings);
const authPrefix = Settings.mongoUser && Settings.mongoPassword ? Settings.mongoUser+':'+encodeURIComponent(Settings.mongoPassword)+'@':'';
const mongo_uri = 'mongodb://'+ authPrefix + Settings.mongoAddr + '/' + Settings.mongoDbName;
L.info('Mongo uri: ' + mongo_uri);

mongoose.connect(mongo_uri, { useUnifiedTopology: true, useNewUrlParser: true }, function (err) {
    if (err) {
        throw err;
    } else {
        L.info(`Connection to ${mongo_uri} sucessful`);
    }
});

const port = parseInt(process.env.PORT);
export default new Server().router(routes).listen(port);