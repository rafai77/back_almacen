const PORT = process.env.PORT || 3000;
const express = require("express");
const app = express();
const jwt = require('jsonwebtoken'); //para la auth
const utf8 = require('utf8');
app.use(express.json());
app.use(express.urlencoded({
  extended: true
}));
const webpush=require('web-push');

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


publicKey= 'BPu9H4WQdDC2Ll6h7KQNrQqOs1LzRL5aXG-oNhr4raRIdwKdxPugDyl6FuYSJzvpwI0M6j35q_obeEbzrriKjzU';
privateKey= 'DXwZvsh0r__PjGqkGcjJuh4wV1MANvypO9vWDzcd2Mk';
webpush.setVapidDetails('mailto:rafac11@hotmail.com',publicKey,privateKey);




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
      console.log(req.body,"sd")
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
        console.log(result,error)
        if(result!=0 )
        mysqlConnection.query("select DISTINCT  p.producto, f.cantidad from productos p ,cms c,formulas f where f.id_producto=p.id_producto and f.id_cm=?", [result[0].id_cm], function (error, row, fields) {
          if (error)
            res.json({
              "error": true
            })
          else
            res.json(row);
        });
        else
        res.json({"Error":"no se pudo"})
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

app.post('/addconsumo', verificaTk, async (req, res) => {
  jwt.verify(req.token, secret, (err, data) => {
    if (err) {
      res.json({
        "estatus": "Clave vencida",
        "vecido": true
      });
    } else {

    
      var productos = req.body.productos;
      var cantidades = req.body.cantidades;
      var producto_cantidades_inven=req.body.datosA.sort(function (a, b) {
        return ((a.producto < b.producto) ? -1 : ((a.producto > b.producto) ? 1 : 0));
      });
    
      var cm=""
      if(req.body.cm=="cm1")
        cm="consumocm1"
      let sql = "select id_producto,producto from productos where "
      for (var i in productos) {
        sql += "producto='" + productos[i] + "' or ";
      }
     // console.log(sql.substr(0, sql.length - 3));
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
      
        //restar valores 
        var nuevoalmacen=[];
        
        for(let i in productos_totales)
        {
          for (let j in producto_cantidades_inven)
          {
            if(producto_cantidades_inven[j].producto==productos_totales[i].producto)
              {
                producto_cantidades_inven[j].total=producto_cantidades_inven[j].total-productos_totales[i].cantidades
              }
          }
        }
      
        //
    
      mysqlConnection.query(sql, function (error, result, fields) {
        let consumo = [];
        for (let j in result) {
          consumo.push([
             result[j].id_producto,
            productos_totales[productos.indexOf(result[j].producto)].cantidades,1,moment().format().substr(0, 10)]
          )
        }
      
       
        mysqlConnection.query("insert into consumocm1 (id_producto,cantidad ,id_cm,fecha) Values ?", [consumo], function (er, row, field) {
    
          if(er!=null)
          {
            
            res.json({"error":true,"status":"Ya aplico formula el dia de hoy\n ó  no tiene suficiente producto verifique "});
          }
          
          else
          {
            
            let sqlUpdatecm=[];
            for (let j in producto_cantidades_inven)
              actualizarproducto(` UPDATE ${req.body.cm} set `+" total="+producto_cantidades_inven[j].total +" Where id_producto= '"+producto_cantidades_inven[j].id_producto +"';");
              
            
          }
           
       });
  
         
      });

    }
  });
});

async function actualizarproducto (query) {
  try{
  const r= await mysqlConnection.query(query);
  console.log(r.error)
  }
  catch{
    console.log("error")
  }
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
   //console.log(req.body);
    
    mysqlConnection.query( `Select DATE_FORMAT(x.fecha ,'%Y-%m-%d')as fecha,p.producto,x.cantidad from productos p,${req.body.cm} x where x.id_producto=p.id_producto and fecha BETWEEN ? and ?`,[req.body.f1.substr(0,10),req.body.f2.substr(0,10)],function(error,data,field)
    {
     //console.log(error)
      res.json(data);
    });

  }

  })
});

app.post('/not',(req,res)=>
{
  console.log(req.body,"siiii")
  //webpush.sendNotification(req.body,JSON.stringify(payload))
  res.json(req.body);

});


const sub={
  endpoint:"https://fcm.googleapis.com/fcm/send/eYvzqF9iiXQ:APA91bH6VgFuwRvnRmkcWi88k5PFez3bK-1KjZPvCZDjv0BYueRXGdBOqEtz7KSQRSXBvnkxZB3vTJG1XNpEDcXNs3fM7KdQggI7ELQ4QLH9UsHatbOGI62pzGVyuwfKxrfyzCHVBkss",
  expirationTime:null,
  keys:{
    p256dh:"BL8Oie6UVAN_ye2vnWevNomxjgkk1RL3i7s3Wovh48SP9Jd0mzurhhT2bRoo5TBvDwlLAHv-TCyALNO1LufHSQA",
    auth:"h1VWOsZ3kjx2aeMHhGaXlw",
  },
};
//const payload = JSON.stringify({ title: 'test' });
const payload=
{
  notification:{
   
    data:{url:"www.youtube.com",},
    tite:"hola",
    vibrate:[110,50,50],
  },
}
//webpush.sendNotification(sub,JSON.stringify(payload)).then(res=>console.log(res,"bin")).catch(er=>console.log(er,"mal"))

app.post("/actualizarPedidos",verificaTk,(req,res)=>
{
  jwt.verify(req.token, secret, (err, data) => {
    if(err)
    res.json(
      {
      "estatus": "Clave vencida",
      "vecido": true
    });
    else
    {
     // console.log(req.body);
      let datos=req.body.info
      let con=[]
      let inventario=[]
     mysqlConnection.query("Update pedidos set status=? where id_pedido=?",[req.body.status,req.body.info[0][2]],(error,data)=>
     {
        // console.log(error,data)
          for (var i in req.body.info)
          {
            let s="Update pedido_producto  set "
            s+="cantidad_entrgada"+" = "+req.body.info[i][1] +" where id_pedido="+req.body.info[0][2]+" and " + " id_producto='"+req.body.info[i][0]+"';"
            con.push(s);
          }
          
        for (let i in con)
          actualizarproducto(con[i])
        //console.log(con[i])
        mysqlConnection.query("Select * from inventario order by id_producto ",(error,data,field)=>
        {
          
          var datos=req.body.info.sort(function (a, b){var n = a[0].toLocaleLowerCase().localeCompare(b[0].toLocaleLowerCase());
            return n === 0 && a !== b[0] ? b[0].localeCompare(a) : n; });
         // console.log(data);
          
         for (let i in datos)
          if(data[i]["id_producto"]==datos[i][0])
            inventario.push("update inventario set "+"total "+" = "+(datos[i][1]+data[i]["total"]) +" where id_producto = '"+datos[i][0]+"';")
          console.log(inventario)
            for (let i in inventario)
            actualizarproducto(inventario[i])
          
        });
        
          res.end();
     })

    }
})
})


app.post("/viewPedidosadmin",verificaTk,(req,res)=>
{
jwt.verify(req.token, secret, (err, data) => {
  if(err)
  res.json(
    {
    "estatus": "Clave vencida",
    "vecido": true
  });
  else
  {

    //console.log(req.body,"cuerpo")
    mysqlConnection.query("select p.status ,p.id_cm,c.nom2,pr.producto , pp.cantidad,pp.id_producto, pp.cantidad_entrgada,p.id_pedido,  DATE_FORMAT(p.fecha ,'%Y-%m-%d')as fecha, p.status  from cms c,pedido_producto pp, pedidos p,productos pr  where  c.id_cm=p.id_cm and pp.id_pedido=p.id_pedido and pp.id_producto=pr.id_producto order by id_pedido",(error,data,field)=>
    {
      //console.log(error,data)
      if(error==null)
      res.json(data)
      else
      res.json({
        error:true,
        mensaje:"erro en los pedidos"
      })
    });
  }

});
});



app.post("/viewPedidos",verificaTk,(req,res)=>
{
jwt.verify(req.token, secret, (err, data) => {
  if(err)
  res.json(
    {
    "estatus": "Clave vencida",
    "vecido": true
  });
  else
  {

    //console.log(req.body,"cuerpo")
    mysqlConnection.query("select p.status ,p.id_cm,c.nom2,pr.producto , pp.cantidad,pp.id_producto, pp.cantidad_entrgada,p.id_pedido,  DATE_FORMAT(p.fecha ,'%Y-%m-%d')as fecha, p.status  from cms c,pedido_producto pp, pedidos p,productos pr  where p.id_cm=((select id_cm from cms where nom2=?)) and c.id_cm=p.id_cm and pp.id_pedido=p.id_pedido and pp.id_producto=pr.id_producto order by id_pedido",[req.body.cm,],(error,data,field)=>
    {
      //console.log(error,data)
      if(error==null)
      res.json(data)
      else
      res.json({
        error:true,
        mensaje:"erro en los pedidos"
      })
    });
  }

});
});

app.post("/changestatus",verificaTk,(req,res)=>
{
  jwt.verify(req.token , secret ,(err,data)=>
  {
    if(err)
    res.json({
      "estatus": "Clave vencida",
      "vecido": true
    });
    else{
      console.log(req.body)
      mysqlConnection.query("Update pedidos set status=? where fecha=? and id_cm=((Select id_cm from cms where nom2=?))",[req.body.status,req.body.info[1],req.body.info[0]],(error,data)=>
      {
       // console.log(data,error)
        if(error==null)
         res.json({"error":false,mensaje:"se aprobo "})
         else
         res.json({"error":false,mensaje:"No se pudo realizar  "})
      }
      );
    }
  })
})

app.post('/addPedidos',verificaTk,(req,res)=> 
{
  jwt.verify(req.token, secret, (err, data) => {
    if(err)
    res.json({
      "estatus": "Clave vencida",
      "vecido": true
    });
    else
    {
      console.log(req.body);
      var datos=req.body.datos;
      var cm=req.body.cm;
      var datofinal=[]
     
      
      //console.log(datofinal)
      var f1=moment()
      f1=(f1.toDate().toISOString().substr(0,10))
      mysqlConnection.query("insert into pedidos (id_cm,status,fecha) VALUES((select id_cm from cms where nom2=?),'Revision',?)",[cm,f1],(error,data,field)=>
      {
        if(error!= null)
        {
          res.json({
            "error":true,
            "mensaje":"no se puedo añadir ese pedido"
          })
        }
        else
        {
        mysqlConnection.query("select id_pedido from pedidos where fecha=? and id_cm=(select id_cm from cms where nom2=?)",[f1,cm],(error,id,field)=>
        {
            for (let i in datos)
             datofinal.push( [id[0]["id_pedido"],datos[i].id,datos[i].value,0] )
            console.log(datofinal)
            mysqlConnection.query("insert pedido_producto (id_pedido,id_producto,cantidad,cantidad_entrgada) values ? ",[datofinal],(err,data)=>
            {
              console.log(err,data)
              res.json(
                {
                  error:false,
                  mensaje:"Pedido listo"
                }
              )
            })
        });
        
        }
        
      })


    }
  });


})



app.post("/traspasos",verificaTk,(req,res)=>
{
  jwt.verify(req.token, secret, (err, data) => {
    if(err)
    res.json({
      "estatus": "Clave vencida",
      "vecido": true
    });
    else
    {
      var f1=moment()
      f1=(f1.toDate().toISOString().substr(0,10))
      mysqlConnection.query("INSERT into almacen.traspasos (id_cm,id_cm2,fecha) VALUES ( (SELECT id_cm from almacen.cms where nombre=?),(SELECT id_cm from almacen.cms where nombre=?),?)",[req.body.origen,req.body.destino,f1] ,(error,data,field)=>
      {
        //console.log(error,data)
        if(error==null)
          for (let i in  req.body.prestamo)
            if(req.body.prestamo[i].valor)
            actualizarproducto(`INSERT into traspasos_producto (status,id_producto,id_traspasos,valor) VALUES('proceso',(select id_producto from productos where producto = '${req.body.prestamo[i].nombre}' ),(select id_traspasos from traspasos where fecha='${f1}'  and id_cm= (SELECT id_cm from almacen.cms where nombre='${req.body.origen}') and id_cm2=(SELECT id_cm from almacen.cms where nombre='${req.body.destino}')) ,${req.body.prestamo[i].valor  })`)
            
      });
      res.end();
      //añadior el trasásp 
    }
})
})


app.post("/traspasosview",verificaTk,(req,res)=>
{
  jwt.verify(req.token, secret, (err, data) => {
    if(err)
    res.json({
      "estatus": "Clave vencida",
      "vecido": true
    });
    else
    {
      console.log(req.body)
      mysqlConnection.query("Select t.* from t traspasos,tp traspasos_producto  ");
      res.end()
       
    }
  });
});