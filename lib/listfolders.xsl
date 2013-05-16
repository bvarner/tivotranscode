<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:t="http://www.tivo.com/developer/calypso-protocol-1.6/"
                exclude-result-prefixes="t"
                xmlns="http://www.w3.org/1999/xhtml"
                version="1.0"
>
  <xsl:output omit-xml-declaration="yes" method="text"/>

  <xsl:template match="t:TiVoContainer">
    <xsl:for-each select="t:Item/t:Links/t:Content">
      <xsl:if test="t:ContentType='x-tivo-container/folder'">
        <xsl:if test="not(../../t:Details/t:Title='HD Recordings')">
        <xsl:if test="not(../../t:Details/t:Title='TiVo Suggestions')">
<xsl:value-of select="../../t:Details/t:Title/text()"/>|<xsl:value-of select="t:Url/text()"/>
<xsl:text>&#xA;</xsl:text>
        </xsl:if>
        </xsl:if>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>
