<?php
require_once __DIR__ . '/partials/scripts/get-departments.php';
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Document</title>
</head>

<body>
    <main class="container">
        <h1 class="mb-4">Departments Archive</h1>

        <table class="table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Surname</th>
                    <th>Email</th>
                    <th>Website</th>
                    <th>Active</th>
                </tr>
            </thead>
            <tbody>
                <?php 
                if(!empty($departments)) :
                    foreach($departments as $department) : ?>
                    <tr>
                        <td>
                            <?php echo $department['id']?>
                        </td>
                        <td>
                            <?php echo $department['name']?>
                        </td>
                        <td>
                            <?php echo $department['surname']?>
                        </td>
                        <td>
                            <?php echo $department['email']?>
                        </td>
                        <td>
                            <?php echo $department['website']?>
                        </td>
                        <td>
                            <a href="./show.php?id=<?php echo $department['id']?>">
                                View
                            </a>
                        </td>
                    </tr>
                <?php endforeach;
                endif; ?>
            </tbody>
        </table>
    </main>

</body>

</html>