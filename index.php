<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Data Entry Form</title>
    <link rel="stylesheet" href="styles.css">
</head>

<body>
    <?php include 'db.php'; ?>
    <div class="container">
        <form id="dynamicForm" method="post" action="db.php">
            <label for="selectTable">Select Table:</label>
            <select name="selectTable" id="selectTable" onChange="loadFormFields(this.value)">
                <option value="" disabled selected>Select a table</option>
                <?php
                $tables = getTableNames();
                echo "<script>console.log(" . json_encode($tables) . ");</script>";
                foreach ($tables as $table) {
                    echo "<option value=\"$table\">$table</option>";
                }
                ?>
            </select>
            <div id="formfields"></div>
        </form>
        <button class="pageButton" onclick="goToResultsPage()"> Go To Results Page => </button>
    </div>

    <script>
        function loadFormFields(currtable) {
            let tabledetails;
            switch (currtable) {
                case "employee":
                    tabledetails = JSON.parse('<?php echo json_encode(getTableByName("employee")); ?>');
                    break;
                case "department":
                    tabledetails = JSON.parse('<?php echo json_encode(getTableByName("department")); ?>');
                    break;
                case "dependent":
                    tabledetails = JSON.parse('<?php echo json_encode(getTableByName("dependent")); ?>');
                    break;
                case "project":
                    tabledetails = JSON.parse('<?php echo json_encode(getTableByName("project")); ?>');
                    break;
                case "works_on":
                    tabledetails = JSON.parse('<?php echo json_encode(getTableByName("works_on")); ?>');
                    break;
                case "dept_locations":
                    tabledetails = JSON.parse('<?php echo json_encode(getTableByName("dept_locations")); ?>');
                    break;
                default:
                    tabledetails = null;
            }
            if (tabledetails) {
                console.log(tabledetails);
                createFormFields(tabledetails);
            }
        }

        function createFormFields(fields) {
            const dynamicForm = document.getElementById('formfields');
            dynamicForm.innerHTML = '';
            fields.forEach((field, index) => {
                const label = document.createElement('label');
                label.textContent = field.name + ':';
                let input;
                const fieldType = field.type.toLowerCase().split('(')[0];
                switch (fieldType) {
                    case 'varchar':
                    case 'char':
                        input = document.createElement('input');
                        input.type = 'text';
                        break;
                    case 'int':
                        input = document.createElement('input');
                        input.type = 'number';
                        break;
                    case 'date':
                        input = document.createElement('input');
                        input.type = 'date';
                        break;
                    default:
                        input = document.createElement('input');
                        input.type = 'text';
                }
                if (field.name.toLowerCase() === 'sex') {
                    const radioMale = document.createElement('input');
                    radioMale.type = 'radio';
                    radioMale.name = 'sex';
                    radioMale.value = 'M';

                    const radioFemale = document.createElement('input');
                    radioFemale.type = 'radio';
                    radioFemale.name = 'sex';
                    radioFemale.value = 'F';

                    dynamicForm.appendChild(label);
                    dynamicForm.appendChild(radioMale);
                    dynamicForm.appendChild(document.createTextNode('M'));
                    const br = document.createElement('br');
                    dynamicForm.appendChild(br);
                    dynamicForm.appendChild(radioFemale);
                    dynamicForm.appendChild(document.createTextNode('F'));
                } else {
                    input.name = field.name;
                    input.required = !field.null;
                    dynamicForm.appendChild(label);
                    dynamicForm.appendChild(input);
                }

                const br = document.createElement('br');
                dynamicForm.appendChild(br);
            });

            const submitButton = document.createElement('input');
            submitButton.type = 'submit';
            submitButton.value = 'Submit';
            submitButton.style.backgroundColor = 'rgb(53, 144, 255)';
            submitButton.style.color = 'white';
            submitButton.style.border = 'none';

            dynamicForm.appendChild(submitButton);
        }

        function goToResultsPage() {
            window.location.href = "results.php";
        }
    </script>

</body>

</html>