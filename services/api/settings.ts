const env = process.env;
export default  {
    allowAnonRegs: env.ALLOW_ANONYMOUS_REGISTER ? true : false, 
    mongoAddr : env.MONGO_HOST ? env.MONGO_HOST : 'db',
    mongoUser: env.MONGO_USER ? env.MONGO_USER : 'bertagerard',
    mongoPassword: env.MONGO_PASSWORD ? env.MONGO_PASSWORD : 'bertagerard',
    mongoDbName: env.MONGO_DB_NAME ? env.MONGO_DB_NAME : 'api_db',
    version: env.VERSION ? env.VERSION : "1.0",
}