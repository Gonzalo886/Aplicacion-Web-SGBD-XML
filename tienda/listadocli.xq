xquery version "3.1";
<tienda>
{    
    for $cliente in doc("tienda.xml")//tienda/clientes/cliente
        return
        $cliente

}        
</tienda>