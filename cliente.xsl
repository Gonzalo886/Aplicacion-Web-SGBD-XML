<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/tienda/cliente">
    <html lang="es">
      <head>
        <title>Clientes</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
      </head>
      <body>
        <div class="container-fluid">
          <h1><xsl:value-of select="nombre"/></h1>
          <table class="table fs-3">
            <tr><th>Código</th><td><xsl:value-of select="@cod"/></td></tr>
            <tr><th>Nombre</th><td><xsl:value-of select="nombre"/></td></tr>
            <tr><th>Teléfono</th><td><xsl:value-of select="telefono"/></td></tr>
            <tr><th>Dirección</th><td><xsl:value-of select="direccion"/></td></tr>
          </table>
        </div>
      </body>
    </html>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  </xsl:template>
</xsl:stylesheet>
