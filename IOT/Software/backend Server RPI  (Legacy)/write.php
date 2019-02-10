<?
set_time_limit(0);
include './includes/config.php';


/*
DO NOT EDIT ANYTHING BEYOND THIS POINT UNLESS YOU KNOW WHAT YOU'RE DOING!!!
*/


if ($api_key==$_POST["apikey"]){
if (isset($servername)) {

try {
    $dbh = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    // set the PDO error mode to exception
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

if (!isset($_POST["input"])) {
$stmt = $dbh->prepare("INSERT INTO beehive (temp, gas, airpress, lv) VALUES (:temp, :gas, :airpress, :lv)");
$stmt->bindParam(':temp', $_POST["temp"]);
$stmt->bindParam(':gas', $_POST["gas"]);
$stmt->bindParam(':airpress', $_POST["airpress"]);
$stmt->bindParam(':lv', $_POST["lv"]);
    // use exec() because no results are returned
    $stmt->execute();
}

    echo "New record created successfully";
    }
catch(PDOException $e)
    {
    echo $stmt . "<br>" . $e->getMessage();
    }

$dbh = null;
}
}
else{
echo 'Wrong key.';
}
?>