<?xml version="1.0" encoding="UTF-8" ?>

<!--
    Document   : stylesheet.xsl
    Created on : 31. Mai 2004, 13:10
    Author     : Heintze
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
       <xsl:element name="conanolex">
        <xsl:apply-templates/>
       </xsl:element>
    </xsl:template>
    
    <xsl:template match="eintrag">
        <xsl:element name="entry">
            <xsl:attribute name="id">
                <xsl:number/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="orth">
               <xsl:copy-of select="."/>
    </xsl:template>

    
    <xsl:template match="syn">
        <xsl:element name="syn">
            <xsl:choose>
                <xsl:when test="kat/text()='subj'">
                    <xsl:attribute name="type">subordinating</xsl:attribute>
                </xsl:when>
                <xsl:when test="kat/text()='postp'">
                    <xsl:attribute name="type">subordinating</xsl:attribute>
                </xsl:when>
                <xsl:when test="kat/text()='konj'">
                    <xsl:attribute name="type">coordinating</xsl:attribute>
                </xsl:when>
                <xsl:when test="kat/text()='praep'">
                    <xsl:attribute name="type">praepositional</xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="type">adverbial</xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:for-each select="sem">
                <xsl:element name="sem">
                    <xsl:element name="coh-relation">
                        <xsl:if test="relation/@nucleus">
                        <xsl:attribute name="nucleus">
                            <xsl:value-of select="relation/@nucleus"/>
                        </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="relation"/>
                    </xsl:element>
                    <xsl:for-each select="beispiel">
                        <xsl:element name="example">
                            <xsl:value-of select="."/>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>

    </xsl:stylesheet> 
