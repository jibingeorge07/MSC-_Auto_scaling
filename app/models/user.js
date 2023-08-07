// Get the functions in the db.js file to use
const db = require('./../services/db');

class User {
    // user ID
    id;
    // user name
    name;

    cakeid;

    constructor(id) {
        this.id = id;
    }
   
    // Gets the user name from the database
    async getUserDetails() {
        if (typeof this.name !== 'string') {
            var sql = "SELECT * from UserProfile where id = ?"
            const results = await db.query(sql, [this.id]);
            this.name = results[0].name;
            this.address = results[0].address
            this.contact = results[0].contact
            this.emailid = results[0].emailid
            this.cakeid = results[0].cakeid
            this.venuesid = results[0].venuesid
            this.flowersid = results[0].flowersid
            this.decorationsid = results[0].decorationsid
        }
    }
    async getCakeName()  {
        var sql = "SELECT * from Cake where id=?"
        const results = await db.query(sql, [this.cakeid]);
        this.cakeid = results[0].name;
    }
    async getFlowerName()  {
        var sql = "SELECT * from Flowers where id=?"
        const results = await db.query(sql, [this.flowersid]);
        this.flowersid = results[0].Name;
    }
    async getVenuesName()  {
        var sql = "SELECT * from Venues where id=?"
        const results = await db.query(sql, [this.venuesid]);
        this.venuesid = results[0].Name;
    }
    async getDecorationName()  {
        var sql = "SELECT * from Decorations where id=?"
        const results = await db.query(sql, [this.decorationsid]);
        this.decorationsid = results[0].Name;
    }

}

module.exports = {
    User
}



