<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/tienda">
    <html lang="es">
      <head>
        <title>Clientes</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
      </head>
      <body>
        <div class="container-fluid">
          <h1>Clientes</h1>
          <table class="table table-striped fs-3">
            <tr>
              <th>Código Cliente</th>
              <th>Cliente</th>
              <th>Telefono</th>
              <th>Dirección</th>
            </tr>
            <xsl:apply-templates select="cliente"/>
          </table>
          <a class='btn btn-primary' href='index.php'>Tabla Pedidos</a>
          <a class='btn btn-primary' href='anadir.html'>Nuevo Cliente</a>
        </div>
      </body>
    </html>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  </xsl:template>

  <xsl:template match="cliente">
    <tr>
      <td><xsl:value-of select="@cod"/></td>
      <td><a href='cliente.php?cod_cli={@cod}'><xsl:value-of select="nombre"/></a></td>
      <td><xsl:value-of select="telefono"/></td>
      <td><xsl:value-of select="direccion"/></td>
      <td><a class='btn btn-danger' href='?cod={@cod}'>Borrar</a></td>
    </tr>
  </xsl:template>

</xsl:stylesheet>
