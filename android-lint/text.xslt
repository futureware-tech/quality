<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="text" omit-xml-declaration="yes"/>

	<xsl:template match="/issues">
		<xsl:text>Android Lint errors: </xsl:text>
		<xsl:number level="any" value="count(descendant::issue)"/>
		<xsl:text>&#xa;</xsl:text>

		<xsl:for-each select="issue">
			<xsl:value-of select="location/@file"/>
			<xsl:text>:</xsl:text>
			<xsl:value-of select="location/@line"/>
			<xsl:text>: </xsl:text>
			<xsl:value-of select="@message"/>
			<xsl:text>&#xa;</xsl:text>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
