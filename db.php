<?php
// Database connection details
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "company";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

function getTableNames() {
    global $conn, $dbname; 
    $result = $conn->query("SELECT table_name FROM information_schema.tables WHERE table_schema = '$dbname' AND table_type = 'BASE TABLE'");
    $tables = array();
    while ($row = $result->fetch_row()) {
        $tables[] = $row[0];
    }
    return $tables;
}

function query_1()
{
    global $conn;
    $result = $conn->query("
    SELECT E.Fname, E.Lname
    FROM employee E
    WHERE E.Dno = (
        SELECT E1.Dno
        FROM employee E1
        WHERE E1.SALARY = (
            SELECT MAX(E2.Salary)
            FROM employee E2
        )
    )
    ");

    $data = array();
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
    return $data;
}

function query_2()
{
    global $conn;
    $result = $conn->query("
    SELECT E.Fname, E.Lname FROM employee E WHERE E.Mgr_ssn IN (SELECT E1.Essn FROM employee E1 WHERE E1.Mgr_ssn IN (SELECT E2.Essn FROM employee E2 WHERE E2.Essn = '888665555' ))
    ");

    $data = array();
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
    return $data;
}

function query_3()
{
    global $conn;
    $result = $conn->query("
    SELECT E.Fname,E.Lname FROM employee E WHERE E.Salary >= (SELECT MIN(Salary) + 10000 FROM employee)
    ");

    $data = array();
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
    return $data;
}

function query_4()
{
    global $conn;
    $result = $conn->query("
    SELECT D.Dname, COUNT(E.Essn) as NumEmployess FROM department D JOIN employee E ON D.Dnumber = E.Dno GROUP BY D.Dname HAVING AVG(E.Salary) > 30000
    ");

    $data = array();
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
    return $data;
}

function query_5()
{
    global $conn;
    $result = $conn->query("
    SELECT  D.Dname, COUNT(E.Essn) as NumMaleEmployees FROM department D JOIN employee E on D.Dnumber = E.Dno WHERE E.Salary > 30000 AND E.Sex = 'M' GROUP BY D.Dname
    ");

    $data = array();
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
    return $data;
}
function query_6()
{
    global $conn;
    $result = $conn->query("
    SELECT D.Dnumber, COUNT(E.Essn) as NumHighSalaryEmployees FROM department D JOIN employee E on D.Dnumber = E.Dno WHERE D.Dnumber IN (SELECT Dno FROM employee GROUP BY Dno HAVING COUNT(Essn) > 5) AND E.Salary > 40000 GROUP BY D.Dnumber
    ");

    $data = array();
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
    return $data;
}
function query_7()
{
    global $conn;
    $result = $conn->query("
    SELECT SUM(Salary) as TotalSalary,MAX(Salary) as MaxSalary,MIN(Salary) as MinSalary, AVG(Salary) as AvgSalary FROM employee
    ");

    $data = array();
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
    return $data;
}
function query_8()
{
    global $conn;
    $result = $conn->query("
    SELECT E.Fname,E.Lname FROM employee E WHERE E.Essn IN (SELECT DISTINCT Mgr_ssn FROM department) AND E.Essn IN (SELECT DISTINCT Essn FROM department)
    ");

    $data = array();
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
    return $data;
}

function getTableByName($currtable)
{
    global $conn;
    $result = $conn->query("DESC $currtable");
    if ($result) {
        $tableAttributes = array();

        while ($row = $result->fetch_assoc()) {
            $columnDetails = array(
                'name' => $row['Field'],
                'type' => $row['Type'],
                'null' => ($row['Null'] == 'YES') ? true : false
            );

            $tableAttributes[] = $columnDetails;
        }
        return $tableAttributes;
    } else {
        return "Error: " . $conn->error;
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $tableName = $_POST['selectTable'];

    // Get attribute names and values from form data
    $attributes = [];
    foreach ($_POST as $key => $value) {
        // Exclude the table name from attributes
        if ($key !== 'selectTable') {
            $attributes[$key] = $conn->real_escape_string($value);
        }
    }

    // Build SQL query
    $columns = implode(", ", array_keys($attributes));
    $values = "'" . implode("', '", $attributes) . "'";
    $sql = "INSERT INTO $tableName ($columns) VALUES ($values)";
    echo "<script>console.log(" . json_encode($sql) . ");</script>";

    // Perform the SQL query
    if ($conn->query($sql) === TRUE) {
        echo "Record inserted successfully";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}
