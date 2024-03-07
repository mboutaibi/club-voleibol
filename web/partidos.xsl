<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!--
Módulo: Transformación de datos XML
Tarea: LMSGI04 Tarea evaluativa 2. XSLT. (60%)
Autor: [MOHAMED BOUTAIBI ARABI]
Fecha: [01/03/2024]
-->

    <xsl:output encoding="utf-8" method="html" doctype-system="about:legacy-doctype"/>
    
    <!-- Plantilla para coincidir con el documento raíz -->
    <xsl:template match="/">

        <!-- Inicio del documento HTML -->
        <html lang="es">
            <head>
                <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
                <meta name="description" content="Página principal" />
                <title>Partidos</title>
            </head>
            <body>
                <!-- Encabezado -->
                <header>
                    <img src="../img/logotipo.png" alt="Reservas" />
                    <a href="tienda.xml">Tienda</a>
                    <a href="equipos.xml">Equipos</a>
                    <a href="partidos.xml">Partidos</a>
                </header>
                <!-- Contenido principal -->
                <main>
                    <h1>PARTIDOS</h1>
                    <!-- Tabla de partidos -->
                    <table>
                        <tr>
                            <th>PARTIDO</th>
                            <th>FECHA</th>
                            <th>RESULTADO</th>
                        </tr>
                        <!-- Iterar sobre cada partido -->
                        <xsl:for-each select="/club_voleibol/partido">
                        <xsl:sort select="fecha" order="descending"/>
                            <tr>
                                <!-- Mostrar el nombre de los equipos -->
                                <td>
                                    <xsl:value-of select="concat(equipos/local, ' - ', equipos/visitante)" />
                                </td>
                                <!-- Mostrar la fecha del partido -->
                                <td>
                                    <xsl:value-of select="fecha" />
                                </td>
                                <!-- Mostrar el resultado y aplicar clase "azul" si gana el visitante -->
                                <td>
                                    <xsl:variable name="localScore" select="equipos/local/@puntuacion"/>
                                    <xsl:variable name="visitorScore" select="equipos/visitante/@puntuacion"/>
                                    <xsl:choose>
                                        <xsl:when test="$visitorScore &gt; $localScore">
                                            <span class="azul"><xsl:value-of select="concat($localScore, ' - ', $visitorScore)" /></span>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="concat($localScore, ' - ', $visitorScore)" />
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </main>
                <!-- Pie de página -->
                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
