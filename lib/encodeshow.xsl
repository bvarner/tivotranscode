<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:t="http://www.tivo.com/developer/calypso-protocol-1.6/"
                exclude-result-prefixes="t"
                xmlns="http://www.w3.org/1999/xhtml"
                version="1.0"
>
  <xsl:output omit-xml-declaration="yes" method="text"/>

  <xsl:param name="ShowTitle"/>
  <xsl:param name="ProgramId"/>
  <xsl:param name="MAK"/>
  <xsl:param name="PROCESSEDLIST"/>

  <xsl:template match="t:TiVoContainer">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="t:Item">
    <xsl:if test="t:Details/t:Title/text() = $ShowTitle">
      <xsl:if test="t:Details/t:ProgramId/text() = $ProgramId">
echo "Processing <xsl:value-of select="$ShowTitle"/>:<xsl:value-of select="$ProgramId"/>"
curl --cookie sid=abc -s --digest -k -u tivo:<xsl:value-of select="$MAK"/> -c cookies.txt "<xsl:value-of select="t:Links/t:Content/t:Url"/>&amp;Format=video/x-tivo-mpeg" | tivodecode -m <xsl:value-of select="$MAK"/> -o <xsl:value-of select="$ProgramId"/>.tivo - 

# Two pass encode, high quality, predictable file size.
HandBrakeCLI -i <xsl:value-of select="$ProgramId"/>.tivo -o <xsl:value-of select="$ProgramId"/>.m4v -f mp4 -O -e x264 --x264-profile high -b 1100 --two-pass -r 29.97 -a 1 -E faac -B 160 -6 stereo -R Auto --gain 5.0 --detelecine --decomb --strict-anamorphic

# Constant quality single pass, big file, high quality.
# HandBrakeCLI -i <xsl:value-of select="$ProgramId"/>.tivo -o <xsl:value-of select="$ProgramId"/>.m4v -O -e x264 -q 23.5 -r 29.97 -a 1 -E faac -B 160 -6 stereo -R Auto --gain 5.0  -f mp4 --decomb --custom-anamorphic --keep-display-aspect --crop 0:0:0:0 -m -x ref=2:bframes=2:subme=6:mixed-refs=0:weightb=0:8x8dct=0:trellis=0

echo "<xsl:value-of select="$ShowTitle"/>:<xsl:value-of select="$ProgramId"/>" >> <xsl:value-of select="$PROCESSEDLIST"/>
rm <xsl:value-of select="$ProgramId"/>.tivo

mv <xsl:value-of select="$ProgramId"/>.m4v "<xsl:value-of select="t:Details/t:Title"/>-<xsl:value-of select="t:Details/t:EpisodeNumber"/>-<xsl:value-of select="t:Details/t:EpisodeTitle"/>.m4v"

      </xsl:if>
    </xsl:if>
  </xsl:template>

  <xsl:template match="text()"/>
</xsl:stylesheet>

