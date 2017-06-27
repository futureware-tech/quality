<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="text" omit-xml-declaration="yes"/>

	<xsl:template match="/BugCollection">
		<xsl:text>FindBugs errors: </xsl:text>
		<xsl:number level="any" value="count(descendant::BugInstance)"/>
		<xsl:text>&#xa;</xsl:text>

		<xsl:for-each select="BugInstance/SourceLine">
			<xsl:variable name="sourcepath" select="@sourcepath"/>
			<xsl:variable name="fullpath">
				<xsl:for-each select="/BugCollection/Project/SrcDir">
					<xsl:if test="substring(text(), string-length(text()) - string-length($sourcepath) + 1) = $sourcepath">
						<xsl:value-of select="text()"/>
					</xsl:if>
				</xsl:for-each>
			</xsl:variable>

			<xsl:if test="$fullpath = ''">
				<xsl:value-of select="$sourcepath"/>
			</xsl:if>
			<xsl:if test="$fullpath != ''">
				<xsl:value-of select="$fullpath"/>
			</xsl:if>
			<xsl:text>:</xsl:text>
			<xsl:value-of select="@start"/>
			<xsl:text>: </xsl:text>
			<xsl:value-of select="ancestor::BugInstance[1]/LongMessage/text()"/>
			<!-- TODO(dotdoom): add BugInstance to identify the issue. -->
			<xsl:text> (FindBugs)&#xa;</xsl:text>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
