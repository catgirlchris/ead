<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<body>
				<h1>Resultados del aspirante con DNI 87654321B</h1>
                <h2>Nombre: <xsl:value-of select="/pruebas_aptitud/aspirantes/aspirante[@dni='87654321B']/@nombre" /></h2>
				<table>
                   <tr>
                        <th>Prueba</th>
                        <th>Valor</th>
                        <th>Fecha-Hora de realizacion</th>
                        <th>Observaciones</th>
                   </tr>
                   <xsl:for-each select="/pruebas_aptitud/resultados/resultado[@aspirante_dni='87654321B']">
						<tr>
							<td>
								<xsl:value-of select="@prueba_id" />
							</td>
							<td>
								<xsl:value-of select="@valor" />
							</td>	
							<td>
								<xsl:value-of select="@realiza" />
							</td>	
							<td>
								<xsl:value-of select="observaciones" />
							</td>	
						</tr>
					</xsl:for-each>
                </table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>