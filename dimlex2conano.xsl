<?xml version="1.0" encoding="UTF-8" ?>

<!--
    Document   : stylesheet.xsl
    Created on : 31. Mai 2004, 13:10
    Author     : Heintze / edited by Scheffler
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output indent="yes" method="xml" encoding="utf-8" omit-xml-declaration="no" doctype-system="ConAnoLex.dtd" />
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="/">
       <xsl:processing-instruction name="relations">
	 <xsl:text>relSet="Martin1992"</xsl:text>
       </xsl:processing-instruction>
       <xsl:text>
</xsl:text>
       <xsl:element name="conanolex">
        <xsl:apply-templates/>
       </xsl:element>
    </xsl:template>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    

    <xsl:template match="entry">
        <xsl:element name="entry">
            <xsl:attribute name="id">
                <xsl:number/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="//ambiguity|//focuspart|//non_conn_reading"></xsl:template>
    

    <xsl:template match="orth">
               <xsl:copy-of select="."/>
    </xsl:template>

    
    <xsl:template match="syn">
        <xsl:element name="syn">
            <xsl:choose>
                <xsl:when test="cat/text()='subj'">
                    <xsl:attribute name="type">subordinating</xsl:attribute>
                </xsl:when>
                <xsl:when test="cat/text()='postp'">
                    <xsl:attribute name="type">subordinating</xsl:attribute>
                </xsl:when>
                <xsl:when test="cat/text()='konj'">
                    <xsl:attribute name="type">coordinating</xsl:attribute>
                </xsl:when>
                <xsl:when test="cat/text()='praep'">
                    <xsl:attribute name="type">praepositional</xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="type">adverbial</xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:for-each select="sem">
                <xsl:element name="sem">
                    <xsl:element name="coh-relation">
                        <xsl:value-of select="pdtb3_relation/@sense"/>
                    </xsl:element>
                    <xsl:for-each select="example">
                        <xsl:element name="example">
                            <xsl:value-of select="."/>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>

    <xsl:template match="dimlex|orths">
      <xsl:apply-templates/>
    </xsl:template>

</xsl:stylesheet> 
