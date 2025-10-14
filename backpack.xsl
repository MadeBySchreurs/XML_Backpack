<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" version="5.0"/>

<xsl:template match="/">
  <html>
    <head>
      <title>Backpack Inventory</title>
      <link rel="stylesheet" type="text/css" href="backpack.css"/>
    </head>
    <body>
      <h1>Backpack Inventory</h1>
      <ul id="inventory-tree">
        <xsl:apply-templates select="item"/> 
      </ul>
      <script src="backpack.js"/>
    </body>
  </html>
</xsl:template>

<xsl:template match="item">
  <li>
    <p>
      <xsl:if test="item">
        <span class="toggler"></span> 
      </xsl:if>
      
      <xsl:value-of select="@name"/>
      
      <span class="weight-info">
        <xsl:choose>
          
          <xsl:when test="@weight and not(item)">
            - Weight: <xsl:value-of select="@weight"/>
          </xsl:when>

          <xsl:when test="item">
            <xsl:variable name="calculatedTotalWeight" select="sum(descendant::item/@weight)"/>
            - Total weight: <xsl:value-of select="$calculatedTotalWeight"/>gr
          </xsl:when>
          
          <xsl:otherwise>
            <xsl:if test="@totalWeight">
                - Total weight: <xsl:value-of select="@totalWeight"/>
            </xsl:if>
          </xsl:otherwise>
          
        </xsl:choose>
      </span>
      </p>

    <xsl:if test="item">
      <ul class="nested">
        <xsl:apply-templates select="item"/>
      </ul>
    </xsl:if>
  </li>
</xsl:template>

</xsl:stylesheet>