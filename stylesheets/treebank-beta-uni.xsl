<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="1.0">
   <xsl:output media-type="text/xml" omit-xml-declaration="no" method="xml" indent="yes"/>
   <xsl:preserve-space elements="*"/>
    <xsl:include href="beta2unicode.xsl"/>    
            
    <xsl:template match="@*|node()">
                    <xsl:copy>
                        <xsl:apply-templates select="@*"></xsl:apply-templates>
                        <xsl:apply-templates select="node()"></xsl:apply-templates>
                    </xsl:copy>
    </xsl:template>
    
    <xsl:template match="@span|@lemma|@form">
        <xsl:choose>
            <xsl:when test="ancestor::treebank[@xml:lang='grc' or @xml:lang='greek']">
                <xsl:attribute name="{local-name(.)}">
                    <xsl:call-template name="beta-to-uni">
                        <xsl:with-param name="a_in" select="."/>                    
                    </xsl:call-template>              
                </xsl:attribute>    
            </xsl:when>
            <xsl:otherwise><xsl:copy/></xsl:otherwise>
        </xsl:choose>
                   
    </xsl:template>
    
</xsl:stylesheet>
