const PORT = process.env.PORT || 3000;
const express = require("express");
const app = express();
const jwt=require('jsonwebtoken');//para la auth

app.use(express.json());
app.use(express.urlencoded({extended: true}));
const mysqlConnection = require('./base');
var moment = require('moment'); // para fechas
const tempfile = require('tempfile');
const { json } = require("express");


const cors = require('cors');

app.use(cors());
app.options('*', cors());

var token
var secret="abc1234cimarron"
app.listen(PORT, ()=> console.log(`Server is up on port: ${PORT}`));

//verificar jwt
function verificaTk(req,res,next)
{
  console.log(req.headers)
  //console.log(req.body)

  let tk=req.headers['vefificador']
  console.log(tk);
  if(typeof tk != 'undefined')
  {       
   console.log(tk)
  req.token=tk;
  next();
  }
  else{
    res.sendStatus(403);
  }
}


app.get('/', verificaTk, (req, res)=> {
    jwt.verify(req.token,secret,(err,data)=>
    {
      if(err)
      {
        res.sendStatus(403);
      }
      else
      {
       
         res.send('Back-end De Calidad \n by Priva-cimarron ');
      }

    });       
});
  

 app.post('/log',function(req, res) {
  

    var user = req.body.user;
    var pass = req.body.pass;
    mysqlConnection.query("select * from usuarios where user=? and pass=aes_decrypt(?,?) ",[user,pass,secret],function (error, results, fields)
    {
      if(error || results.length>1 || results.length<1)
      {
        console.log("Intento de ingreso de "+user+" contraseña "+pass+" con la ip "+req.ip)
        res.json
        (
          {
            log:false,
            status:"usuario o contraseña mal ",
            user:null,
            token:null
          }
        );
      }
      else
      {
        var User={
          id_user:results[0].id_user,
          nombre:results[0].nombre,
          rol:results[0].rol,
          user:results[0].user
        }
        token=jwt.sign(User, secret);
        console.log("Entro el ususario:");
        console.log(User) ;
        res.json(
          {
            log:true,
            status:"Entro",
            user:User,
            token:token
          }
        );
      }
    });  
});



