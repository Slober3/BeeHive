<?php
include './includes/config.php';

// What can we get from this api?
// Filter on Time,IP,ID(,Input)
// Count records
// http://YOURSITE.COM/api/api.php/{input}/{all}/
// http://YOURSITE.COM/api/api.php/{input}/{last}/{int}		(number max 100)
// http://YOURSITE.COM/api/api.php/{input}/{recordCount}
// Retrieve Data from url

$request = explode('/', trim($_SERVER['PATH_INFO'], '/'));

// Retrieve the databse,command and the specification

$databaseSelect = preg_replace('/[^a-z0-9_]+/i', '', array_shift($request));
$command = preg_replace('/[^a-z0-9_]+/i', '', array_shift($request));
$specification = array_shift($request);

// check is databse exists

switch ($databaseSelect)
	{
case 'input':
	$databaseSelect = "beehive";
	break;
	
default:
	$databaseSelect = "beehive";
	break;
	}

// connect to the database

$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

// What command was used?

switch ($command)
	{
case 'all':
	$stmt = $conn->prepare("select * from  $databaseSelect");
	break;

case 'last':
	filter_var($specification, FILTER_VALIDATE_INT, array(
		"options" => array(
			"min_range" => 1,
			"max_range" => 100
		)
	)) ? $specification = intval($specification) : $specification = 30;
	$stmt = $conn->prepare("SELECT * FROM ( SELECT * FROM  $databaseSelect ORDER BY id DESC LIMIT :intlim ) sub ORDER BY id ASC");
	$stmt->bindParam(':intlim', $specification, PDO::PARAM_INT);
	break;
	
case 'recordCount':
	$stmt = $conn->prepare("select COUNT(*) FROM  $databaseSelect");
	break;

default:
	$stmt = $conn->prepare("select * from  $databaseSelect");
	break;
	}

// Excecute SQL statement

$stmt->execute();
$results = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Convert to json and print

$json = json_encode($results);
print htmlspecialchars($json, ENT_NOQUOTES);

// Close connection

$conn = null;
?>