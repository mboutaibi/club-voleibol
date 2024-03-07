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
        <xsl:variable name="entrenador" select="/club_voleibol/equipo[entrenador/nombre = 'Arie Selinger']/entrenador"/>
        <html lang="es">
            <head>
                <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
                <meta name="description" content="Página principal" />
                <title>Equipo entrenado por <xsl:value-of select="$entrenador/nombre"/></title>
            </head>
            <body>
                <header>
                    <img src="../img/logotipo.png" alt="Reservas" />
                    <a href="tienda.xml">Tienda</a>
                    <a href="equipos.xml">Equipos</a>
                    <a href="partidos.xml">Partidos</a>
                </header>
                <main>
                    <h1>
                        <a href="{$entrenador/url}">
                           <xsl:value-of select="$entrenador/nombre"/>
                        </a>
                    </h1>
                    <xsl:apply-templates select="$entrenador/../nombre"/>
                </main>
                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="nombre">
        <article class="equipos">
            <h4><xsl:value-of select="."/></h4>
            <xsl:apply-templates select="../jugadores/jugador[@titular='si']"/>
        </article>
    </xsl:template>

    <xsl:template match="jugador">
        <p><xsl:value-of select="@camiseta"/> - <xsl:value-of select="nombre"/></p>
    </xsl:template>

</xsl:stylesheet>


