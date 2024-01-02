<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Results Page</title>
</head>

<body>
    <?php include 'db.php'; ?>
    <div>
        <button onclick="goback()">&lt;Back</button>
    </div>
    <div class="grid-container">
        <div class="grid-item" onclick="runQuery(1)">
            1. Employees with highest salaries
        </div>

        <div class="grid-item" onclick="runQuery(2)">
            2. Employees with supervisor has '888665555' for Ssn
        </div>

        <div class="grid-item" onclick="runQuery(3)">
            3. Employees who make at least $10000 more than the
            employee who is paid the least in the company
        </div>

        <div class="grid-item" onclick="runQuery(4)">
            4. Department with average employee salary is more than $30,000,
            retrieve the department name and the number of employees working for that
            department
        </div>

        <div class="grid-item" onclick="runQuery(5)">
            5. The number of male employees in each department making more
            than $30,000
        </div>

        <div class="grid-item" onclick="runQuery(6)">
            6. Department that has more than five employees, retrieve the
            department number and the number of its employees who are making more
            than $40,000.
        </div>

        <div class="grid-item" onclick="runQuery(7)">
            7. The sum of the salaries of all employees, the maximum salary, the
            minimum salary, and the average salary.
        </div>

        <div class="grid-item" onclick="runQuery(8)">
            8. The names of managers who have at least one dependent
        </div>
    </div>
    <hr />
    <div id="resultDiv"></div>
    <script>
        function runQuery(num) {
            let data;
            switch (num) {
                case 1:
                    data = JSON.parse('<?php echo json_encode(query_1()); ?>');
                    break;
                case 2:
                    data = JSON.parse('<?php echo json_encode(query_2()); ?>');
                    break;
                case 3:
                    data = JSON.parse('<?php echo json_encode(query_3()); ?>');
                    break;
                case 4:
                    data = JSON.parse('<?php echo json_encode(query_4()); ?>');
                    break;
                case 5:
                    data = JSON.parse('<?php echo json_encode(query_5()); ?>');
                    break;
                case 6:
                    data = JSON.parse('<?php echo json_encode(query_6()); ?>');
                    break;
                case 7:
                    data = JSON.parse('<?php echo json_encode(query_7()); ?>');
                    break;
                case 8:
                    data = JSON.parse('<?php echo json_encode(query_8()); ?>');
                    break;
            }
            let table = document.createElement('table');
            let headerRow = table.insertRow();
            for (let key in data[0]) {
                let headerCell = headerRow.insertCell();
                headerCell.textContent = key;
                headerCell.style.fontWeight = 'bold';
                headerCell.style.backgroundColor = '#a3a3a3';
                headerCell.style.padding = '10px';
                headerCell.style.textAlign = 'center';
                headerCell.style.border = '1px solid #000';
            }
            for (let i = 0; i < data.length; i++) {
                let row = table.insertRow();
                for (let key in data[i]) {
                    let cell = row.insertCell();
                    cell.textContent = data[i][key];
                    cell.style.padding = '8px';
                    cell.style.textAlign = 'center';
                    cell.style.border = '1px solid #000';
                    cell.style.backgroundColor = '#dedcdc';

                }
            }
            table.style.borderCollapse = 'collapse';
            table.style.width = '100%';
            table.style.marginTop = '10px';
            table.style.border = '1px solid #000';
            let resultDiv = document.getElementById('resultDiv');
            resultDiv.innerHTML = '';
            resultDiv.appendChild(table);
        }
        function goback(){
            window.location.href = "/comany_management";
        } 
    </script>
</body>

</html>