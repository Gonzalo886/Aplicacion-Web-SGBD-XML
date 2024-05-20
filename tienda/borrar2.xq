xquery version "3.1";
let $id := request:get-parameter("cod", "0")
return
    update delete doc("tienda.xml")//cliente[@cod=$cod]

