// Import express.js
const express = require("express");

// Create express app
var app = express();

//body parser
const bodyParser = require('body-parser');

// Add static files location
app.use(express.static("static"));

//Add body parser files location
app.use(bodyParser.urlencoded({ extended: false }));

// Get the functions in the db.js file to use
const db = require('./services/db');

// Use the Pug templating engine
app.set('view engine', 'pug');
app.set('views', './app/views');

// Get the models
const { User } = require("./models/user");

// Set the sessions
var session = require('express-session');
app.use(session({
  secret: 'secretkeysdfjsflyoifasd',
  resave: false,
  saveUninitialized: true,
  cookie: { secure: false }
}));

// Create a route for root - /
app.get("/", function(req, res) {
    // Set up an array of data
    // Send the array through to the template as a variable called data
    res.render("index");
});

//admin page 
app.get('/admin', function(req, res) {
    res.render('login');
  });

// Define the authenticateUser function
function authenticateUser(email, password) {
    const query = 'SELECT * FROM users WHERE email=? AND password=?';
    const values = [email, password];
    return db.query(query, values).then(([rows, fields]) => {
      if (!rows || rows.length === 0) {
        return false;
      } else {
        return true;
      }
    });
  }
  
  // Define the login route handler
app.post('/login', function(req, res) {
    var email = req.body.email;
    var password = req.body.password;
    // Call the authenticateUser function
    authenticateUser(email, password).then((authenticated) => {
      if (authenticated) {
      // Set the authenticated session variable
        req.session.authenticated = true;
        res.redirect('/user');
      } else {
        res.render('error', { error: 'Invalid email or password' });
      }
    }).catch((err) => {
        console.log("error")
    });
});

app.get('/user', function(req, res) {
    if (req.session.authenticated) {
      var sql = 'select * from UserProfile';
      db.query(sql).then(results => {
        res.render('all_users', {data: results});
      }).catch((err) => {
        console.error(err);
        res.render('error', { error: 'Internal server error' });
      });
    } else {
      res.redirect('/admin');
    }
  });

// Logout
app.post('/logout', function (req, res) {
    req.session.destroy();
    res.redirect('/admin');
});

app.get("/gallery", function(req, res) {
  res.render("gallery");
});

app.get("/RSVP", function(req, res) {
    res.render("RSVP");
});

app.post('/rsvp_submit',(req,res)=>{
  const{name,phone,email,address,count,message}= req.body;
  db.query(
    'INSERT INTO RSVP (name,phone,email,address,count,message) VALUES(?,?,?,?,?,?)',
    [name,phone,email,address,count,message],
    res.render('index',{name}),
    (err)=>{
      if(err){
        console.error(err);
        res.sendstatus(500)('Error inserting reservation');
      }
    }
  );
});

app.post('/contact_page', (req, res) => {
  // Extract form data from the request body
  const { name, email, message } = req.body;

  // Save the form data to MySQL
  db.query(
    'INSERT INTO contact (name, email, message) VALUES (?, ?, ?)',
    [name, email, message],
     res.render('index'),  
     (error, results) => {
      if (error) {
        console.error('Error saving form data to MySQL:', error);
        res.sendStatus(500);
      } 
    }
  )
});


app.get("/contact", function(req, res) {
  res.render("contact");
});

app.get("/single_user/:id", async function (req, res) {
    if (req.session.authenticated) {
        var stId = req.params.id;
        var user = new User(stId);
        await user.getUserDetails();
        await user.getCakeName();
        await user.getVenuesName();
        await user.getDecorationName();
        await user.getFlowerName();
        res.render('user', {user:user});
    } else {
      res.redirect('/admin');
    }
  });

// Create a route for testing the db
app.get("/db_test", function(req, res) {
    // Assumes a table called test_table exists in your database
    sql = 'select * from test_table';
    db.query(sql).then(results => {
        res.send(results)
    });
});

// Create a route for /goodbye
// Responds to a 'GET' request
app.get("/goodbye", function(req, res) {
    res.send("Goodbye world!");
});

// Create a dynamic route for /hello/<name>, where name is any value provided by user
// At the end of the URL
// Responds to a 'GET' request
app.get("/hello/:name", function(req, res) {
    // req.params contains any parameters in the request
    // We can examine it in the console for debugging purposes
    console.log(req.params);
    //  Retrieve the 'name' parameter and use it in a dynamically generated page
    res.send("Hello " + req.params.name);
});

// Start server on port 3000
app.listen(3000,function(){
    console.log(`Server running at http://127.0.0.1:3000/`);
});