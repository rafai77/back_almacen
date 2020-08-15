const PORT = process.env.PORT || 3000;
const express = require("express");
const app = express();
const jwt=require('jsonwebtoken');//para la auth

app.use(express.json());
app.use(express.urlencoded({extended: true}));
const mysqlConnection = require('./base');
var moment = require('moment'); // para dechas
const tempfile = require('tempfile');
const { json } = require("express");


const cors = require('cors');

app.use(cors());
app.options('*', cors());

var token
var secret="1234abc"
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

/*
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
  */


 app.get('/', (req, res)=> {
         res.send('Back-end De Alemacen \n by Priva-cimarron ');           
});
