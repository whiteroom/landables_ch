<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" /> </xsl:copy>
    </xsl:template>
    
   <!-- <xsl:template match="//Long-Lat" /> -->

    
    <xsl:template match="//Frequency[@mode]">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
            <xsl:value-of select="concat(' ', @mode)" />
        </xsl:copy>
    </xsl:template>

    
    
    <xsl:template match="//glider[@value='true']">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
            <xsl:text>G</xsl:text>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//glider[not(@value='true')]" />
    
    
    
    <xsl:template match="//para[@value='true']">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
            <xsl:text>P</xsl:text>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="//para[not(@value='true')]" />
    
    <xsl:template match="@value" />

</xsl:stylesheet>