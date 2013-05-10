<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:t="http://www.tivo.com/developer/calypso-protocol-1.6/"
                exclude-result-prefixes="t"
                xmlns="http://www.w3.org/1999/xhtml"
                version="1.0"
>
  <xsl:output omit-xml-declaration="yes" method="text"/>

  <xsl:param name="ShowTitle"/>

  <xsl:template match="t:TiVoContainer">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="t:Item">
    <xsl:if test="t:Details/t:Title/text() = $ShowTitle">
      <xsl:value-of select="t:Details/t:ProgramId"/><xsl:text> </xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="text()"/>

</xsl:stylesheet>
