<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html"/>
    
    <xsl:template match="/testgroup">
        <html>
            <head>
            <style type="text/css">
                h2 { margin-top:1cm; }            
                h1 { margin-top:0.5cm; }            
            </style>
                <title><xsl:value-of select="@id"/> - Reference Documentation</title>
            </head>
            <body>
                <h1><xsl:value-of select="@id"/> - <xsl:value-of select="name"/></h1>

		<h2>Description</h2>
                <p><xsl:apply-templates select="description"/></p>

		<h2>Reference</h2>
                <p><xsl:apply-templates select="reference"/></p>


                <h2>Table of test cases</h2>
                <ul>
                    <xsl:apply-templates select="testcase" mode="index"/>
                </ul>

                <xsl:apply-templates select="testcase" mode="full"/>
                
                <xsl:if test="setup">
                    <h2>Test setup</h2>
                    <p><xsl:apply-templates select="setup"/></p>
		</xsl:if>
		
                <xsl:if test="teardown">
	            <h2>Test teardown</h2>
                    <p><xsl:apply-templates select="teardown"/></p>
		</xsl:if>

            </body>
        </html>
    </xsl:template>
    

    
    <xsl:template match="testcase" mode="index">
        <li><a><xsl:attribute name="href">#<xsl:value-of select="@id"/></xsl:attribute><xsl:value-of select="name"/></a></li>
    </xsl:template>

    
        
    <xsl:template match="testcase" mode="full">

        <h2><xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute><xsl:value-of select="@id"/> - <xsl:value-of select="name"/></h2>

	<h3>Description</h3>
        <xsl:apply-templates select="description"/>

        <h3>Requirement</h3>
        <xsl:apply-templates select="requirement"/>

        <h3>Reference</h3>
        <xsl:apply-templates select="reference"/>
        
        <h3>Script</h3>
        <xsl:apply-templates select="Script"/>
    </xsl:template>


    
    <xsl:template match="description" name="description">
        <xsl:apply-templates/>
    </xsl:template>


    
    <xsl:template match="reference" name="reference">
        <xsl:apply-templates/>
    </xsl:template>



    <xsl:template match="requirement" name="requirement">
        <xsl:apply-templates/>
    </xsl:template>



    <xsl:template match="p">
        <xsl:apply-templates/>
    </xsl:template>



    <xsl:template match="a">
        <a><xsl:attribute name="href"><xsl:value-of select="@href" /></xsl:attribute><xsl:value-of select="."/></a>
    </xsl:template>


    
    <xsl:template match="b">
        <b><xsl:apply-templates/></b>
    </xsl:template>



    <xsl:template match="Script">
        <pre><xsl:value-of select="."/></pre>
    </xsl:template>

</xsl:stylesheet>
