const PORT = process.env.PORT || 3000;
const express = require("express");
const app = express();
const jwt=require('jsonwebtoken');//para la auth
const utf8 = require('utf8');
app.use(express.json());
app.use(express.urlencoded({extended: true}));
const mysqlConnection = require('./base');
var moment = require('moment'); // para fechas
const tempfile = require('tempfile');
const { json } = require("express");
var token;
var secret="abc1234cimarron"

const StringBuilder = require('node-stringbuilder');
const cors = require('cors');
const AES = require('mysql-aes');
app.use(cors());
app.options('*', cors());
const IV_LENGTH = 16

crypto = require('crypto');


app.listen(PORT, ()=> console.log(`Server is up on port: ${PORT}`));





//verificar jwt
function verificaTk(req,res,next)
{
  //console.log(req.headers)
  //console.log(req.body)

  let tk=req.headers['vefificador']
  //console.log(tk);
  if(typeof tk != 'undefined')
  {       
   //console.log(tk)
  req.token=tk;
  next();
  }
  else{
    res.json(
    {"estatus":"Clave vencida",
    "vecido":true}
    );
  }
}


app.get('/', verificaTk, (req, res)=> {
    jwt.verify(req.token,secret,(err,data)=>
    {
      if(err)
      {
        res.json(
          {"estatus":"Clave vencida",
          "vecido":true}
          );
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
    console.log(pass)
    mysqlConnection.query("select * from usuarios where user=? and aes_decrypt(pass ,?)= ? ",[user,secret,pass],function (error, results, fields)
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

app.post('/datos', verificaTk, (req,res) =>
{
  jwt.verify(req.token,secret,(err,data)=>
  {
    if(err)
    {
      res.json(
        {"estatus":"Clave vencida",
        "vecido":true}
        );
    }
    else
    {
      //preparar la query 
      let sql ="select p.id_producto,p.producto,x.total,p.tipo,p.unidad from productos p ,";
       sql=sql+req.body.tabla+" x";
       sql=sql+" where  p.id_producto=x.id_producto"
       if(req.body.tipo!="ls")sql=sql+" and tipo = '" + req.body.tipo+"' "
      sql=sql+" order by x.total DESC"
      console.log(sql);
      mysqlConnection.query(sql,function(error,result,fields)
      {
        if(!error)
        res.json(result);
        else
        res.json({"error":"error en el servidor"})
      });
    }

  });

});

app.post('/productos', verificaTk, (req,res) =>
{
  jwt.verify(req.token,secret,(err,data)=>
  {
    if(err)
    {
      res.json(
        {"estatus":"Clave vencida",
        "vecido":true}
        );
    }
    else
    {
      //preparar la query 
      let sql ="select producto,total from  ";
      if(req.body.tabla!=null) sql=sql+req.body.tabla;
      if(req.body.tipo!=null) sql=sql+" where tipo = '" + req.body.tipo+"'"
      console.log(sql);
      mysqlConnection.query(sql,function(error,result,fields)
      {
        res.json(result);
      });
    }

  });

});

app.post('/valores', verificaTk, (req,res) =>
{
  jwt.verify(req.token,secret,(err,data)=>
  {
    if(err)
    {
      res.json(
        {"estatus":"Clave vencida",
        "vecido":true}
        );
    }
    else
    {
      //preparar la query 
      let sql ="select total from  ";
      if(req.body.tabla!=null) sql=sql+req.body.tabla;
      if(req.body.tipo!=null) sql=sql+" where tipo = '" + req.body.tipo+"'"
      console.log(sql);
      mysqlConnection.query(sql,function(error,result,fields)
      {
        res.json(result);
      });
    }

  });

});

app.post('/cm-inver',verificaTk,(req,res)=>
{
  jwt.verify(req.token,secret,(err,data)=>{
    if(err)
    {
      res.json(
        {"estatus":"Clave vencida",
        "vecido":true}
        );
    }
    else
    {
      var id=parseInt(req.body.id)
      var sql="select c.* from user_cms uc,usuarios u,cms c where uc.id_user=u.id_user and c.id_cm=uc.id_cm and u.id_user="+id
      console.log(sql);
      mysqlConnection.query(sql,function(error,result,fields)
      {
        res.json(result);
      });
    }

  });
});

