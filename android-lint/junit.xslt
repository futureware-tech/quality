<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="xml" indent="yes"/>

	<xsl:template match="/issues">
		<testsuites name="lint">
			<testsuite name="issues">
				<xsl:apply-templates select="issue"/>
			</testsuite>
		</testsuites>
	</xsl:template>
	<xsl:template match="issue">
		<testcase name="{@id}">
			<failure
					message="{location/@file}:{location/@line}: {@summary}"
					type="{@severity}">
				<xsl:text>&#xa;</xsl:text>

				<xsl:value-of select="@message" />
				<xsl:text>&#xa;</xsl:text>

				<xsl:value-of select="@explanation" />
				<xsl:text>&#xa;</xsl:text>
				<xsl:value-of select="@url" />
				Category: <xsl:value-of select="@category" />
				File: <xsl:value-of select="location/@file" />
				Line: <xsl:value-of select="location/@line" />

				<xsl:text>&#xa;</xsl:text>
			</failure>
		</testcase>
	</xsl:template>

</xsl:stylesheet>
