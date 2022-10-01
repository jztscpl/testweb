<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:call-template name="tokenize">
    <xsl:with-param name="text" select="rss/channel/item"/>
</xsl:call-template>
<xsl:template name="tokenize">
    <xsl:param name="text"/>
    <xsl:param name="separator" select="'Learn'"/>
    <xsl:param name="pos" select="1" ></xsl:param>
    <xsl:choose>
        <xsl:when test="not(contains($text, $separator))">
            <xsl:element name="Address{$pos}">
                <xsl:value-of select="normalize-space($text)"/>
            </xsl:element>
        </xsl:when>
        <xsl:otherwise>
            <xsl:element name="Address{$pos}">
                <xsl:value-of select="normalize-space(substring-before($text, $separator))"/>
            </xsl:element>
            <xsl:call-template name="tokenize">
                <xsl:with-param name="text" select="substring-after($text, $separator)"/>
                <xsl:with-param name="pos" select="$pos + 1" />
            </xsl:call-template>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template> 
<xsl:template match="/">
<html>
  <body>
    <h2>TSCPL Class Orientations</h2>
    <table class="AllClasses" border="1">
      <tr bgcolor="#9acd32">
        <th>Class Title</th>
        <th>Description</th>
      </tr>
      
      <xsl:for-each select="rss/channel/item[title='Intro to Cricut' or title='Intro to 3D Printing' or title='Intro to Audio &amp; Video Recording']">
      
            <xsl:sort select="title"/>
      <tr>
        <td><xsl:value-of select="title"/></td>
        <td><xsl:value-of select="description"/></td>
      </tr>
      </xsl:for-each>
    </table>
    
    <table class="3dprint" border="2">
      <tr bgcolor="blue">
      <th>Class Title</th>
      <th>Description</th>
      </tr>
      <xsl:for-each select="rss/channel/item[title='Intro to 3D Printing']">
      <xsl:sort select="title"/>
      <tr>
        <td><xsl:value-of select="title"/></td>
        <td><xsl:value-of select="description"/></td>
      </tr>
      </xsl:for-each>
    </table>

    <table class="IntroAV" border="2">
      <tr bgcolor="blue">
      <th>Class Title</th>
      <th>Description</th>
      </tr>
      <xsl:for-each select="rss/channel/item[title='Intro to Audio &amp; Video Recording']">
      <xsl:sort select="title"/>
      <tr>
        <td><xsl:value-of select="title"/></td>
        <td><xsl:value-of select="description"/></td>
      </tr>
      </xsl:for-each>
    </table>
    <table class="Cricut" border="2">
      <tr bgcolor="blue">
      <th>Class Title</th>
      <th>Description</th>
      </tr>
      <xsl:for-each select="rss/channel/item[title='Intro to Cricut']">
      <xsl:sort select="title"/>
      <tr>
        <td><xsl:value-of select="title"/></td>
        <td><xsl:value-of select="description"/></td>
      </tr>
      </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>

