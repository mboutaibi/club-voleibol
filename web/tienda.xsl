<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!--
Módulo: Transformación de datos XML
Tarea: LMSGI04 Tarea evaluativa 2. XSLT. (60%)
Autor: [MOHAMED BOUTAIBI ARABI]
Fecha: [01/03/2024]
-->
    <xsl:output encoding="utf-8" method="html" doctype-system="about:legacy-doctype"/>
    
    <xsl:template match="/">
        <html lang="es">
            <head>
                <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
                <meta charset="utf-8"/>
                <meta name="description" content="Página principal" />
                <title>titulo de la web</title>
            </head>
            <body>
                <header>
                    <img src="../img/logotipo.png" alt="Reservas" />
                    <a href="tienda.xml">Tienda</a>
                    <a href="equipos.xml">Equipos</a>
                    <a href="partidos.xml">Partidos</a>
                </header>
                <main class="principal">
                    <xsl:apply-templates select="/club_voleibol/tienda/articulo"/>
                </main>
                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="articulo">
        <article>
            <section>
                <img class="articulo" src="../img/{@foto}"/>
            </section>
            <section>
                <h2><xsl:value-of select="concat(format-number(precio, '#.##'), ' €')" /></h2>
                <h3><xsl:value-of select="concat('Comentarios: ', count(comentarios))" /></h3>
                <ul>
                    <xsl:apply-templates select="comentarios"/>
                </ul>
            </section>
        </article>
    </xsl:template>
    
    <xsl:template match="comentarios">
        <li>
            <xsl:value-of select="concat(@fecha, ': ', .)" />
        </li>
    </xsl:template>

</xsl:stylesheet>
