<?php
    require_once("config.php");

// Define credentials
$username = "admin";
$password = ""; // Replace <password> with the actual password

if (isset($_GET['cod'])){
    $cod=$_GET['cod'];
    $contents = REST_PATH . "/db/tienda/borrar2.xq?cod=$cod";
   
    $auth     = base64_encode("$username:$password");
    $options = [
      'http' => [
          'header' => ['Authorization: Basic ' . $auth, 'Content-type: application/xml\r\n'],
          'method' => 'GET',
      ],
     ];
  
     $context = stream_context_create($options);
     $result = file_get_contents($contents, false, $context);
  
  }

// Fetch XML content
$contents = REST_PATH . "/db/tienda/listadocli.xq";

// Create a stream context with HTTP basic authentication
$context = stream_context_create([
    'http' => [
        'header' => "Authorization: Basic " . base64_encode("$username:$password")
    ]
]);

// Make the request with authentication headers
$result = file_get_contents($contents, false, $context);


// Load the XML source
$xml = new DOMDocument;
$xml->loadXML($result);

$xsl = new DOMDocument;
$xsl->load('clitable.xsl');

// Configure the transformer
$proc = new XSLTProcessor;
$proc->importStyleSheet($xsl); // attach the xsl rules

echo $proc->transformToXML($xml);

?>
