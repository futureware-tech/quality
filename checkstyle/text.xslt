<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="text" omit-xml-declaration="yes"/>

	<xsl:template match="/checkstyle">
		<xsl:text>Checkstyle errors: </xsl:text>
		<xsl:number level="any" value="count(descendant::error)"/>
		<xsl:text>&#xa;</xsl:text>

		<xsl:for-each select="file/error">
			<xsl:value-of select="../@name"/>
			<xsl:text>:</xsl:text>
			<xsl:value-of select="@line"/>
			<xsl:text>: </xsl:text>
			<xsl:value-of select="@source"/>
			<xsl:text>: </xsl:text>
			<xsl:value-of select="@message"/>
			<xsl:text>&#xa;</xsl:text>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
