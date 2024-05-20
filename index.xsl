<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/tienda">
    <html lang="es">
      <head>
        <title>Pedidos</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
      </head>
      <body>
        <div class="container-fluid">
          <h1>Pedidos</h1>
          <table class="table table-striped fs-3">
            <tr>
              <th>ID Pedido</th>
              <th>Cliente</th>
              <th>Productos</th>
            </tr>
            <xsl:apply-templates select="pedido"/>
          </table>
          <a class='btn btn-primary' href='clitable.php'>Tabla Clientes</a>
          <a class='btn btn-primary' href='anadir2.html'>Nuevo Pedido</a>
        </div>
      </body>
    </html>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  </xsl:template>

  <xsl:template match="pedido">
    <tr>
      <td><xsl:value-of select="@id"/></td>
      <td><a href='cliente.php?cod_cli={@cod_cli}'><xsl:value-of select="nombre_cliente"/></a></td>
      <td>
        <ul>
          <xsl:apply-templates select="producto"/>
        </ul>
      </td>
      <td><a class='btn btn-danger' href='?id={@id}'>Borrar</a></td>
    </tr>
  </xsl:template>

  <xsl:template match="producto">
    <li><xsl:value-of select="."/></li>
  </xsl:template>
</xsl:stylesheet>
