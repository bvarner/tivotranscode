<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:t="http://www.tivo.com/developer/calypso-protocol-1.6/"
                exclude-result-prefixes="t"
                xmlns="http://www.w3.org/1999/xhtml"
                version="1.0"
>
  <xsl:output omit-xml-declaration="yes" method="text"/>

  <xsl:param name="ProgramId"/>

  <xsl:template match="t:TiVoContainer">
    <xsl:for-each select="t:Item">
      <xsl:if test="t:Details/t:ProgramId/text() = $ProgramId">
<xsl:value-of select="t:Details/t:Title"/>/<xsl:value-of select="t:Details/t:EpisodeNumber"/>-<xsl:value-of select="t:Details/t:EpisodeTitle"/>.m4v
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
