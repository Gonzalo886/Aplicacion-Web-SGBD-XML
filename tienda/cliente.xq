xquery version "3.1";
<tienda>
{    
    let $cod := request:get-parameter("cod_cli", "0")
    let $c := doc("tienda.xml")//tienda/clientes/cliente[@cod = $cod]
    return $c
}        
</tienda>