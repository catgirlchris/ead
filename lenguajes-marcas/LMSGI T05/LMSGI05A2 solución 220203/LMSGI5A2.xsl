<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<title>LMSGI05 - Actividad 2</title>
			</head>
			<body>
				<h3>Listado de entradas del socio nº 3</h3>
				<p>Nombre: <xsl:value-of select="/ca/socios/socio[@id='S003']/@nombre" /></p>
				<table border="1">
					<tr>
						<th>Fecha</th>
						<th>Producto</th>
						<th>Cantidad</th>
					</tr>					
					<xsl:for-each select="/ca/entradas/entrada[@socio='S003']">
						<tr>
							<td><xsl:value-of select="@fecha"/></td>
							<td><xsl:value-of select="@producto"/></td>
							<td><xsl:value-of select="@cantidad"/></td>
						</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>