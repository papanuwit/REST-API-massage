const express = require("express");
let cors = require("cors");
const mysql = require("mysql");
const app = express();
const multer = require("multer");
const fs = require("fs");
const path = require("path");
app.use(cors());
app.use(express.json());
app.use('/files', express.static('files'));
let fileName = "";
const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "thaimassage",
});

connection.connect((err) => {
  if (err) {
    console.log("Connect Erro", err);
    return;
  }
  console.log("connect succesFully");
});

const storage = multer.diskStorage({
  destination: function (req, file, callback) {
    callback(null, "./files");
  },
  filename: function (req, file, callback) {
    fileName =
      "file" + "-" + Date.now() + path.extname(file.originalname);
    callback(null, fileName);
  },
});

const upload = multer({ storage });

//upload file 
app.post("/uploadfile", upload.single("file"), (req, res) => {

  const filePath = "files/" + fileName;
  res.json({ path: filePath })

});


// register
app.post("/customers", async (req, res) => {
  const { email, password, firstname, lastname, age, phonenumber, profile, role } = req.body;
  let todo = [firstname, lastname, email, password, age, phonenumber, profile, role];

  let sql = "INSERT INTO customers(firstname, lastname, email, password, age, phonenumber,profile,role) VALUES (?,?,?,?,?,?,?,?)";

  connection.query(sql, todo, (err, result, fields) => {
    if (err) {
      console.log(err.message);
      return res.status(400);
    }

    return res
      .status(200)
      .json({ message: "create new customer sucess" + result.insertId });
  });


});

//login
app.post("/login", async (req, res) => {
  const { email, password } = req.body;

  connection.query(
    "SELECT * FROM `customers` WHERE email=? AND password=?",
    [email, password],
    (err, result, fields) => {
      res.json(result);
    }
  );
});

//get all customers in table 
app.get("/customers", async (req, res) => {
  connection.query("SELECT * FROM `customers`", (err, result, fields) => {
    if (err) {
      console.log(err);
      return res.status(400).send();
    }

    res.status(200).json(result);
  });
});

//get one customers
app.get("/customers/:id", async (req, res) => {
  connection.query(
    "SELECT * FROM customers WHERE customerId=?",
    [req.params.id],
    (err, result, fields) => {
      if (err) {
        console.log(err);
        return res.status(400).send();
      }

      res.status(200).json(result);
    }
  );
});

//delete customer
app.delete("/customers/:id", async (req, res) => {
  connection.query(
    "DELETE FROM customers WHERE customerId=?",
    [req.params.id],
    (err, result, fields) => {
      if (err) {
        res.status(400).json(result);
      }
      return res.json({ message: "delete customer id " + req.params.id });
    }
  );
});

//update customer
app.put("/customers/:id", async (req, res) => {
  const { email, password, firstname, lastname, age, phonenumber } = req.body;
  let todo = [firstname, lastname, email, password, age, phonenumber];
  let sql =
    "UPDATE customers SET firstname=?,lastname=?,email=?,age=?,phonenumber=? WHERE customerId=?";
  connection.query(sql, todo, (err, result, fields) => {
    if (err) {
      res.status(400).json(result);
    }
    return res.json({ message: "update customer id " + req.params.id });
  });
});

//masseuse
app.post("/masseuse", async (req, res) => {
  const { firstname, lastname, age, profile } = req.body;
  let todo = [firstname, lastname, age, profile];
  connection.query(
    "INSERT INTO `masseuse` (firstname, lastname, age, profile) value (?,?,?,?)",
    todo,
    (err, result, fields) => {
      if (err) {
        return res.status(400).send();
      }
      res
        .status(200)
        .json({ message: `crete masseuse sucess id ${result.insertId}` });
    }
  );
});

//get all masseuse
app.get("/masseuses", async (req, res) => {
  connection.query("SELECT * FROM masseuse", (err, result, fields) => {
    if (err) {
      console.log(err);
      return res.status(400).send();
    }

    res.status(200).json(result);
  });
});

//get one customers
app.get("/masseuse/:id", async (req, res) => {
  connection.query(
    "SELECT * FROM masseuse WHERE masseuseId=?",
    [req.params.id],
    (err, result, fields) => {
      if (err) {
        console.log(err);
        return res.status(400).send();
      }

      res.status(200).json(result);
    }
  );
});

//delete masseuse
app.delete("/masseuse/:id", async (req, res) => {
  connection.query(
    "DELETE FROM masseuse WHERE masseuseId=?",
    [req.params.id],
    (err, result, fields) => {
      if (err) {
        res.status(400).json(result);
      }
      return res.json({ message: "delete masseuse id " + req.params.id });
    }
  );
});

//update masseuse
app.put("/masseuse/:id", async (req, res) => {
  const { firstname, lastname, age, profile } = req.body;
  let todo = [firstname, lastname, age, profile, req.params.id];
  let sql =
    "UPDATE masseuse SET firstname=?,lastname=?,age=?,profile=? WHERE masseuseId=?";
  connection.query(sql, todo, (err, result, fields) => {
    if (err) {
      res.status(400).json(result);
    }
    return res.json({ message: "update masseuse id " + req.params.id });
  });
});

//massagequeue
app.post("/massagequeue", async (req, res) => {
  const { masseuseId, date, detail } = req.body;
  let todo = [masseuseId, date, detail];
  connection.query(
    "INSERT INTO `massagequeue` (masseuseId, date, detail) value (?,?,?)",
    todo,
    (err, result, fields) => {
      if (err) {
        console.log(err);
        return res.status(400).send();
      }
      res
        .status(200)
        .json({ message: `create massagequeue sucess id ${result.insertId}` });
    }
  );
});

//get all massagequeue
app.get("/massagequeue", async (req, res) => {
  connection.query(
    "SELECT * FROM masseuse, massagequeue WHERE masseuse.masseuseId=massagequeue.masseuseId",
    (err, result, fields) => {
      res.status(200).json(result);
    }
  );
});

//get statusTime
app.get("/statusqueue/:id", async (req, res) => {
  connection.query(
    "SELECT * FROM statusqueue WHERE massagequeueId=? ",
    [req.params.id],
    (err, result, fields) => {
      res.status(200).json(result);
    }
  );
});

//get statusTime all
app.get("/statusqueues", async (req, res) => {
  connection.query("SELECT * FROM statusqueue", (err, result, fields) => {
    res.status(200).json(result);
  });
});

//get one massagequeue
app.get("/massagequeue/:id", async (req, res) => {
  connection.query(
    "SELECT * FROM massagequeue WHERE massagequeueId=?",
    [req.params.id],
    (err, result, fields) => {
      if (err) {
        console.log(err);
        return res.status(200).send();
      }

      res.status(200).json(result);
    }
  );
});

//delete massagequeue
app.delete("/massagequeue/:id", async (req, res) => {
  connection.query(
    "DELETE FROM massagequeue WHERE massagequeueId=?",
    [req.params.id],
    (err, result, fields) => {
      if (err) {
        res.status(400).json(result);
      }
      return res.json({ message: "delete massagequeue id " + req.params.id });
    }
  );
});

//update massagequeue
app.put("/massagequeue/:id", async (req, res) => {
  const { masseuseId, date, time_start, time_end, detail } = req.body;
  let todo = [masseuseId, date, time_start, time_end, detail, req.params.id];
  let sql =
    "UPDATE massagequeue SET masseuseId=?, date=?, time_start=?, time_end=?, detail=? WHERE massagequeueId=?";
  connection.query(sql, todo, (err, result, fields) => {
    if (err) {
      res.status(400).json(result);
    }
    return res.json({ message: "update massagequeue id " + req.params.id });
  });
});

//save bookingqueue
app.post("/queuebooking", async (req, res) => {
  const { customerId, massagequeueId, massagetype, total, startTime, endTime } =
    req.body;
  let todo = [
    customerId,
    massagequeueId,
    massagetype,
    total,
    startTime,
    endTime,
  ];
  connection.query(
    "INSERT INTO `queuebooking` (customerId, massagequeueId, massagetype, total,startTime,endTime) value (?,?,?,?,?,?)",
    todo,
    (err, result, fields) => {
      if (err) {
        console.log(err);
        return res.status(200).json(err);
      }
      res
        .status(200)
        .json({ message: `create bookingqueue sucess id ${result.insertId}` });
    }
  );
});


//get bookingqueue from customerId
app.get("/queuebooking/:id", async (req, res) => {
  connection.query(
    "SELECT * FROM `queuebooking` WHERE customerId=?",
    [req.params.id],
    (err, result, fields) => {
      if (err) {
        console.log(err);
      }
      res.json(result);
    }
  );
});


//get bookingqueue all
app.get("/queuebooking", async (req, res) => {
  connection.query(
    "SELECT * FROM `queuebooking`",
    [req.params.id],
    (err, result, fields) => {
      if (err) {
        console.log(err);
      }
      res.json(result);
    }
  );
});


//promotion
app.post("/promotion", async (req, res) => {
  const { title, discount, detail } = req.body;
  let todo = [title, discount, detail];
  connection.query(
    "INSERT INTO `promotion` (title, discount,detail) value (?,?,?)",
    todo,
    (err, result, fields) => {
      if (err) {
        return res.status(400).send();
      }
      res
        .status(200)
        .json({ message: `create promotion sucess id ${result.insertId}` });
    }
  );
});

//get all promotion
app.get("/promotion", async (req, res) => {
  connection.query("SELECT * FROM promotion", (err, result, fields) => {
    if (err) {
      return res.status(400).send();
    }

    res.status(200).json(result);
  });
});

//get one promotion
app.get("/promotion/:id", async (req, res) => {
  connection.query(
    "SELECT * FROM massagequeue WHERE promotionId=?",
    [req.params.id],
    (err, result, fields) => {
      if (err) {
        return res.status(400).send();
      }
      res.status(200).json(result);
    }
  );
});

//delete promotion
app.delete("/promotion/:id", async (req, res) => {
  connection.query(
    "DELETE FROM promotion WHERE promotionId=?",
    [req.params.id],
    (err, result, fields) => {
      if (err) {
        res.status(400).json(result);
      }
      return res.json({ message: "delete promotion id " + req.params.id });
    }
  );
});

//update promotion
app.put("/promotion/:id", async (req, res) => {
  const { title, discount, detail } = req.body;
  let todo = [title, discount, detail];
  let sql =
    "UPDATE promotion SET title=?, discount=?, detail=? WHERE promotionId=?";
  connection.query(sql, todo, (err, result, fields) => {
    if (err) {
      res.status(400).json(result);
    }
    return res.json({ message: "update promotion id " + req.params.id });
  });
});

//review 10:31 AM
app.post("/review", async (req, res) => {
  const { queuebookingId, customerId, reviewdetail, dateTime, reviewname } =
    req.body;
  let todo = [queuebookingId, customerId, reviewdetail, dateTime, reviewname];
  connection.query(
    "INSERT INTO review (title, discount,detail) value (?,?,?,?,?)",
    todo,
    (err, result, fields) => {
      if (err) {
        return res.status(400).send();
      }
      res
        .status(200)
        .json({ message: `create review sucess id ${result.insertId}` });
    }
  );
});

//get all reviews
app.get("/review", async (req, res) => {
  connection.query("SELECT * FROM review", (err, result, fields) => {
    if (err) {
      return res.status(400).send();
    }

    res.status(200).json(result);
  });
});

//get one review
app.get("/review/:id", async (req, res) => {
  connection.query(
    "SELECT * FROM review WHERE reviewId=?",
    [req.params.id],
    (err, result, fields) => {
      if (err) {
        return res.status(400).send();
      }
      res.status(200).json(result);
    }
  );
});

//delete review
app.delete("/review/:id", async (req, res) => {
  connection.query(
    "DELETE FROM review WHERE reviewId=?",
    [req.params.id],
    (err, result, fields) => {
      if (err) {
        res.status(400).json(result);
      }
      return res.json({ message: "delete review id " + req.params.id });
    }
  );
});

//update review
app.put("/review/:id", async (req, res) => {
  const { reviewdetail, reviewname } = req.body;
  let todo = [reviewdetail, reviewname];
  let sql = "UPDATE review SET reviewdetail=?, reviewname=? WHERE reviewId=?";
  connection.query(sql, todo, (err, result, fields) => {
    if (err) {
      res.status(400).json(result);
    }
    return res.json({ message: "update review id " + req.params.id });
  });
});


//ดึงโปรไฟล์ที่คล้ายกัน
app.get("/recomandtaion/:age/:gender", async (req, res) => {
  let query = "";

  let age = req.params.age;
  let gender = req.params.gender;

  if (age >= 18 && age <= 25) {
    query = "SELECT customerId,age,gender FROM customers WHERE age BETWEEN 18 AND 25";
  } else if (age >= 26 && age <= 35) {
    query = "SELECT customerId,age,gender FROM customers WHERE age BETWEEN 26 AND 35";
  } else if (age >= 36 && age <= 45) {
    query = "SELECT customerId,age,gender FROM customers WHERE age BETWEEN 36 AND 45";
  } else if (age >= 46 && age <= 60) {
    query = "SELECT customerId,age,gender FROM customers WHERE age BETWEEN 46 AND 60";
  } else {
    query = "SELECT customerId,age,gender FROM customers WHERE age =? AND gender=?";

  }

  connection.query(
    query
    ,
    [age, gender],
    (err, result) => {
      if (err) {
        res.status(400).send();
      }
      let newData = result?.filter(obj => obj.gender === gender);
      res.status(200).json(newData);
    }
  );
});


//แนะนำการนวดจากคนที่เคยจองคิวแล้ว
app.get("/messageRecomandtaion/:id", async (req, res) => {

  connection.query(
    "SELECT massagetype FROM `queuebooking` WHERE customerId=?",
    [req.params.id],
    (err, result) => {
      if (err) {
        return res.status(400).send();
      }
      res.status(200).json(result);

    }

  );



});


//stop 10:39 AM


app.listen(3050, () => {
  console.log("server runnig is port 3050");
});
