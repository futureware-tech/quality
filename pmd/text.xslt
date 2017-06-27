<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="text" omit-xml-declaration="yes"/>

	<xsl:template match="/pmd">
		<xsl:text>PMD errors: </xsl:text>
		<xsl:number level="any" value="count(descendant::violation)"/>
		<xsl:text>&#xa;</xsl:text>

		<xsl:for-each select="file/violation">
			<xsl:value-of select="../@name"/>
			<xsl:text>:</xsl:text>
			<xsl:value-of select="@beginline"/>
			<xsl:text>: </xsl:text>
			<xsl:value-of select="@rule"/>
			<xsl:text>: </xsl:text>
			<xsl:value-of select="normalize-space(text())"/>
			<xsl:text> (PMD)&#xa;</xsl:text>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
