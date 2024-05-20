xquery version "3.1";
<tienda>
{    
    for $pedido in doc("tienda.xml")//tienda/pedidos/pedido
    let $cliente := /tienda/clientes/cliente[@cod = $pedido/@cod_cli]
        return
        <pedido id="{$pedido/@id}">
        <nombre_cliente>{$cliente/nombre/text()}</nombre_cliente>
        <producto>{$pedido/producto/text()}</producto>
        </pedido>

}        
</tienda>