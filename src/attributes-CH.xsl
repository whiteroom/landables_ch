<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
    <xsl:output omit-xml-declaration="no" indent="yes"/>
    <xsl:strip-space elements="*"/>
   
    <!--   <xsl:strip-space elements="*"/>-->
    
    <!-- Identity transform -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>
    
    
    <!-- <xsl:template match="//Long-Lat" /> -->
    
    <xsl:template match="//Identifier[@icao]" mode="icaoPass">
        <xsl:variable name="file" select="concat('file:///Aerodromes/', @icao, '.pdf')" />

        <xsl:element name="Appr">
            <xsl:attribute name="href"><xsl:value-of select="$file" /></xsl:attribute>
        </xsl:element>
    </xsl:template>
   


    <xsl:template match="//Runway">
        <xsl:copy>
            <xsl:apply-templates select="Heading" />
            <xsl:apply-templates select="../../Identifier[@icao]" mode="icaoPass" />
        </xsl:copy>
    </xsl:template>
    

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