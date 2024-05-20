<?php

$cod_cli=$_GET['cod_cli'];

require_once("config.php");
// Define credentials
$username = "admin";
$password = ""; // Replace <password> with the actual password

// Fetch XML content
$contents = REST_PATH . "/db/tienda/cliente.xq?cod_cli=$cod_cli";

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
$xsl->load('cliente.xsl');

// Configure the transformer
$proc = new XSLTProcessor;
$proc->importStyleSheet($xsl); // attach the xsl rules

echo $proc->transformToXML($xml);
?>
