<center>
<?php
$hostname = 'localhost';
$username = 'root';
$password = '';
$database = 'site_demo';

$conn = mysqli_connect($hostname, $username, $password, $database);

if (isset($_POST['submit'])) {
    $name = $_POST['name'];
    $phone = $_POST['phone'];
    $content = $_POST['content'];
    $type = $_POST['type'];

    $query = "INSERT INTO users_info (name, phone, content, type) VALUES ('$name', '$phone', '$content', '$type')";
    $result = mysqli_query($conn, $query);

    if ($result) {
        echo "Information added successfully!";
    } else {
        echo "Error: " . mysqli_error($conn);
    }
}

if (isset($_POST['update'])) {
    $id = $_POST['id'];
    $name = $_POST['name'];
    $phone = $_POST['phone'];
    $content = $_POST['content'];
    $type = $_POST['type'];

    $query = "UPDATE users_info SET name = '$name', phone = '$phone', content = '$content', type = '$type' WHERE id = $id";
    $result = mysqli_query($conn, $query);

    if ($result) {
        echo "Information updated successfully!";
    } else {
        echo "Error: " . mysqli_error($conn);
    }
}

if (isset($_GET['delete'])) {
    $id = $_GET['delete'];

    $query = "DELETE FROM users_info WHERE id = $id";
    $result = mysqli_query($conn, $query);

    if ($result) {
        echo "Information deleted successfully!";
    } else {
        echo "Error: " . mysqli_error($conn);
    }
}

$query = "SELECT * FROM users_info";
$result = mysqli_query($conn, $query);

?>

<!DOCTYPE html>
<html>
<head>
    <title>Add, Edit, and Delete Information</title>
</head>
<body>
    <?php
    if (isset($_GET['edit'])) {
        $id = $_GET['edit'];

        $query = "SELECT * FROM users_info WHERE id = $id";
        $result = mysqli_query($conn, $query);

        if (mysqli_num_rows($result) > 0) {
            $row = mysqli_fetch_assoc($result);
            ?>
            <h2>Edit Information</h2>
            <form method="POST" action="">
                <input type="hidden" name="id" value="<?php echo $row['id']; ?>">
                <label for="name">Name:</label>
            <input type="text" name="name" value="<?php echo $row['name']; ?>" required><br><br>

            <label for="phone">phone:</label>
            <input type="phone" name="phone" value="<?php echo $row['phone']; ?>" required><br><br>

           <select name="type">
                <option value="suggestion">Suggestion</option>
                <option value="complain">Complain</option>
                </select><br><br>
                <textarea name="content" cols="30" rows="5" value="<?php echo $row['content']; ?>"><?php echo $row['content']; ?></textarea><br><br>

                <input type="submit" name="update" value="Update">
            </form>
            <?php
        }
    } else {
        ?>
        <h2>BootCamp Feedback Form</h2>
        <form method="POST" action="">
            <label for="name">Name:</label>
            <input type="text" name="name" required><br><br>

            <label for="phone">phone:</label>
            <input type="phone" name="phone" required><br><br>

           <select name="type">
                <option value="suggestion">Suggestion</option>
                <option value="complain">Complain</option>
                </select><br><br>
                <textarea name="content" cols="30" rows="5"></textarea><br><br>
            <input type="submit" name="submit" value="Submit">
        </form>
        <?php
    }
    ?>

        <table border='1'>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>phone</th>
            <th>Type</th>
            <th>Content</th>
        </tr>
        <?php
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                echo "<tr>";
                echo "<td>".$row['id']."</td>";
                echo "<td>".$row['name']."</td>";
                echo "<td>".$row['phone']."</td>";
                echo "<td>".$row['type']."</td>";
                echo "<td>".$row['content']."</td>";
                echo "<td><a href='?edit=".$row['id']."'>Edit</a></td>";
                echo "<td><a href='?delete=".$row['id']."'>Delete</a></td>";
                        
                     
                echo "</tr>";
            }
        } else {
            echo "No records found";
        }
        ?>
    </table>
    </center>
</body>
</html>