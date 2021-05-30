const express = require('express');
const mysql = require('mysql');
const cors = require('cors');

const app = express();
let host = 'localhost';
const port = 3000;
const con = mysql.createConnection('mysql://root:root@localhost:3306/one_touch');

app.use(cors());

con.connect(err => {
    if (err)
        return console.error("Coudn't connect to DB:", err.message);
    console.log("Connected to DB");
    require('dns').lookup(require('os').hostname(), function (err, addr, fam) {
        host = addr;
        app.listen(port, host, () => {
            console.log(`Server listening on http://${host}:${port}`);
        });
    })
});

app.use(express.static('public'));

app.get('/', (req, res) => {
    res.sendFile('index.html');
});

app.get('/adminLogin', (req, res) => {
    let sql = 'CALL check_admin(?,?)';
    let data = [req.query.user, req.query.pass];
    con.query(sql, data, (err, result) => {
        if (err) console.log(err.message);
        console.log(result[0]);
        res.json(result[0][0]);
    });
});

app.get('/getEmployees', (req, res) => {
    let sql = 'CALL get_employees()'
    con.query(sql, (err, result) => {
        if (err) console.log(err.message);
        res.json(result[0]);
    });
});

app.get('/addEmployee', (req, res) => {
    console.log(req.query);
    let sql = 'CALL add_employee(?, ?, ?)'
    let data = [req.query.name, req.query.dept, req.query.bio]
    con.query(sql, data, (err, result) => {
        if (err) console.log(err.message);
        res.json(result[0][0]);
    });
});

app.get('/updateEmployee', (req, res) => {
    let sql = 'CALL update_employee(?,?,?,?)';
    console.log("UPDATE", req.query)
    let data = [req.query.empCode, req.query.dept, req.query.bio, req.query.isResetPass == '1' ? 1 : 0];
    con.query(sql, data, (err, result) => {
        if (err) console.log(err.message);
        console.log(result[0]);
        res.json(result[0][0]);
    });
});

app.get('/deleteEmployee', (req, res) => {
    let sql = 'CALL delete_employee(?)';
    let data = [req.query.empCode];
    con.query(sql, data, (err, result) => {
        if (err) console.log(err.message)
        console.log(result[0])
        res.json(result[0][0])
    });
});

app.get('/employeeLogin', (req, res) => {
    let sql = 'CALL check_employee(?,?)';
    let data = [req.query.empCode, req.query.encPass];
    con.query(sql, data, (err, result) => {
        if (err) console.log(err.message)
        console.log(result);
        res.json(result[0][0]);
    });
});

app.get('/markEmployeeAttendance', (req, res) => {
    let sql = 'CALL mark_attendance(?)';
    let data = [req.query.empCode];
    con.query(sql, data, (err, result) => {
        if (err) console.log(err.message);
        console.log(result);
        res.json(result[0][0]);
    });
});

app.get('/getEmployeeAttendance', (req, res) => {
    let sql = 'CALL get_attendance(?,?,?)';
    let data = [req.query.empCode, req.query.month, req.query.year];
    con.query(sql, data, (err, result) => {
        if (err) console.log(err.message);
        console.log(result);
        res.json(result[0]);
    });
});

app.get('/markEmployeeCheckin', (req, res) => {
    let sql = 'CALL mark_checkin(?)';
    let data = [req.query.empCode];
    con.query(sql, data, (err, result) => {
        if (err) console.log(err.message);
        console.log(result);
        res.json(result[0][0]);
    });
});

app.get('/markEmployeeCheckout', (req, res) => {
    let sql = `CALL mark_checkout('EMP0031');`;
    let data = [req.query.empCode];
    con.query(sql, data, (err, result) => {
        if (err) console.log(err.message);
        console.log(result);
        res.json(result[0][0]);
    });
});