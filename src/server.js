const PORT = process.env.PORT || 3000;
const express = require("express");
const app = express();
const jwt = require('jsonwebtoken'); //para la auth
const utf8 = require('utf8');
app.use(express.json());
app.use(express.urlencoded({
  extended: true
}));
const mysqlConnection = require('./base');
var moment = require('moment'); // para fechas
const tempfile = require('tempfile');
const {
  json
} = require("express");
var token;
var secret = "abc1234cimarron"

const StringBuilder = require('node-stringbuilder');
const cors = require('cors');
const AES = require('mysql-aes');
app.use(cors());
app.options('*', cors());
const IV_LENGTH = 16

crypto = require('crypto');


app.listen(PORT, () => console.log(`Server is up on port: ${PORT}`));





//verificar jwt
function verificaTk(req, res, next) {
  //console.log(req.headers)
  //console.log(req.body)

  let tk = req.headers['vefificador']
  //console.log(tk);
  if (typeof tk != 'undefined') {
    //console.log(tk)
    req.token = tk;
    next();
  } else {
    res.json({
      "estatus": "Clave vencida",
      "vecido": true
    });
  }
}


app.get('/', verificaTk, (req, res) => {
  jwt.verify(req.token, secret, (err, data) => {
    if (err) {
      res.json({
        "estatus": "Clave vencida",
        "vecido": true
      });
    } else {

      res.send('Back-end De Calidad \n by Priva-cimarron ');
    }

  });
});

app.post('/log', function (req, res) {
  var user = req.body.user;
  var pass = req.body.pass;
  console.log(pass)
  mysqlConnection.query("select * from usuarios where user=? and aes_decrypt(pass ,?)= ? ", [user, secret, pass], function (error, results, fields) {
    if (error || results.length > 1 || results.length < 1) {
      console.log("Intento de ingreso de " + user + " contraseña " + pass + " con la ip " + req.ip)
      res.json({
        log: false,
        status: "usuario o contraseña mal ",
        user: null,
        token: null
      });
    } else {
      var User = {
        id_user: results[0].id_user,
        nombre: results[0].nombre,
        rol: results[0].rol,
        user: results[0].user
      }
      token = jwt.sign(User, secret);
      console.log("Entro el ususario:");
      console.log(User);
      res.json({
        log: true,
        status: "Entro",
        user: User,
        token: token
      });
    }
  });
});

app.post('/datos', verificaTk, (req, res) => {
  jwt.verify(req.token, secret, (err, data) => {
    if (err) {
      res.json({
        "estatus": "Clave vencida",
        "vecido": true
      });
    } else {
      //preparar la query 
      let sql = "select p.id_producto,p.producto,x.total,p.tipo,p.unidad from productos p ,";
      sql = sql + req.body.tabla + " x";
      sql = sql + " where  p.id_producto=x.id_producto"
      if (req.body.tipo != "ls") sql = sql + " and tipo = '" + req.body.tipo + "' "
      sql = sql + " order by x.total DESC"
      //console.log(sql);
      mysqlConnection.query(sql, function (error, result, fields) {
        if (!error)
          res.json(result);
        else
          res.json({
            "error": "error en el servidor"
          })
      });
    }

  });

});

app.post('/productos', verificaTk, (req, res) => {
  jwt.verify(req.token, secret, (err, data) => {
    if (err) {
      res.json({
        "estatus": "Clave vencida",
        "vecido": true
      });
    } else {
      //preparar la query 
      let sql = "select producto,total from  ";
      if (req.body.tabla != null) sql = sql + req.body.tabla;
      if (req.body.tipo != null) sql = sql + " where tipo = '" + req.body.tipo + "'"
      console.log(sql);
      mysqlConnection.query(sql, function (error, result, fields) {
        res.json(result);
      });
    }

  });

});

app.post('/valores', verificaTk, (req, res) => {
  jwt.verify(req.token, secret, (err, data) => {
    if (err) {
      res.json({
        "estatus": "Clave vencida",
        "vecido": true
      });
    } else {
      //preparar la query 
      let sql = "select total from  ";
      if (req.body.tabla != null) sql = sql + req.body.tabla;
      if (req.body.tipo != null) sql = sql + " where tipo = '" + req.body.tipo + "'"
      console.log(sql);
      mysqlConnection.query(sql, function (error, result, fields) {
        res.json(result);
      });
    }

  });

});

app.post('/cm-inver', verificaTk, (req, res) => {
  jwt.verify(req.token, secret, (err, data) => {
    if (err) {
      res.json({
        "estatus": "Clave vencida",
        "vecido": true
      });
    } else {
      var id = parseInt(req.body.id)
      var sql = "select c.* from user_cms uc,usuarios u,cms c where uc.id_user=u.id_user and c.id_cm=uc.id_cm and u.id_user=" + id
      //console.log(sql);
      mysqlConnection.query(sql, function (error, result, fields) {
        res.json(result);
      });
    }

  });
});

app.get('/formulaView/:cm/', verificaTk, (req, res) => {
  jwt.verify(req.token, secret, (err, data) => {

    if (err) {
      res.json({
        "estatus": "Clave vencida",
        "vecido": true
      });
    } else {
      var cm;
      cm = req.params.cm;
      mysqlConnection.query("select id_cm from cms where nom2=?", [cm], function (error, result, fields) {
        mysqlConnection.query("select DISTINCT  p.producto, f.cantidad from productos p ,cms c,formulas f where f.id_producto=p.id_producto and f.id_cm=?", [result[0].id_cm], function (error, row, fields) {
          if (error)
            res.json({
              "error": true
            })
          else
            res.json(row);
        });
      });
    }
  });
});

app.post('/formulaadd', verificaTk, (req, res) => {
  if (err) {
    res.json({
      "estatus": "Clave vencida",
      "vecido": true
    });
  } else {

  }
});

app.post('/addconsumo', verificaTk, (req, res) => {
  jwt.verify(req.token, secret, (err, data) => {
    if (err) {
      res.json({
        "estatus": "Clave vencida",
        "vecido": true
      });
    } else {
      var productos = req.body.productos;
      var cantidades = req.body.cantidades;
      var cm=""
      if(req.body.cm=="consumocm1")
        cm="cm1"
      let sql = "select id_producto,producto from productos where "
      for (var i in productos) {
        sql += "producto='" + productos[i] + "' or ";
      }
      console.log(sql.substr(0, sql.length - 3));
      sql = sql.substr(0, sql.length - 3)
      var productos_totales = [];
      var t
      for (let j in cantidades)
        productos_totales.push({
          "producto": productos[j],
          "cantidades": cantidades[j],
        })

      productos_totales = (productos_totales.sort(function (a, b) {
        return ((a.producto < b.producto) ? -1 : ((a.producto > b.producto) ? 1 : 0));
      }));
      productos = productos.sort();
      mysqlConnection.query(sql, function (error, result, fields) {
        let consumo = [];
        for (let j in result) {
          //console.log(result[j].producto,","+productos[j])
          //console.log(result[productos.indexOf(result[j].producto)].id_producto)
          consumo.push({
            "id_producto": result[j].id_producto,
            "cantidad": productos_totales[productos.indexOf(result[j].producto)].cantidades,
            "id_cm": 1,
            "fecha": moment().format().substr(0, 10)
          })
        }
        var x = 0;
        var t;
        var respuesta=true;
        for (let j in consumo)
        {
          
          t=agragarconsumo(consumo[j],respuesta);
          
          console.log("sa",t)
         if(!t) 
            {
              x=1;
              
            }
        }
        console.log(x)
        if(x==1)
         res.json({"error":true,"status":"Ya aplico formula el dia de hoy\n ó  no tiene suficiente producto verifique "});
        if(x==0)
          res.json({"error":false,"status":"Se aplico formula"});         
      });
    }
  });
});

function trueorflase(x)
{
  return x
}
function agragarconsumo(consumo,respuesta)
{
  mysqlConnection.query("insert into consumocm1 (id_producto,cantidad ,id_cm,fecha) Values(?,?,?,?)", [consumo.id_producto, consumo.cantidad, consumo.id_cm, consumo.fecha], function (er, row, field) {
    
      return trueorflase(respuesta);
   });
}

app.post('/Consumo',verificaTk,(req,res)=>
{
  jwt.verify(req.token, secret, (err, data) => {
  if(err)
  res.json({
    "estatus": "Clave vencida",
    "vecido": true
  });
  else{
    console.log(req.body);
    
    mysqlConnection.query( `Select DATE_FORMAT(x.fecha ,'%Y-%m-%d')as fecha,p.producto,x.cantidad from productos p,${req.body.cm} x where x.id_producto=p.id_producto and fecha BETWEEN ? and ?`,[req.body.f1.substr(0,10),req.body.f2.substr(0,10)],function(error,data,field)
    {
     console.log(error)
      res.json(data);
    });

  }

  })
});