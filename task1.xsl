<?xml version="1.0" encoding="WINDOWS-1251" ?>
<xsl:stylesheet version = "1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>

    <xsl:template match="/">
        <ul>
            <xsl:apply-templates/>
        </ul>
    </xsl:template>

    <xsl:template match="task[@id > 1]">
        <li> task
            <ul>
                <li>
                    name : <xsl:value-of select="@id"/>
                </li>
                <li>
                    desc : <xsl:value-of select="@desc"/>
                </li>
                <li>
                    <xsl:apply-templates/>
                </li>
            </ul>
        </li>
    </xsl:template>

    <xsl:template match="cart|cost|amount">
        &lt;<xsl:value-of select="name()"/>&gt;
            <xsl:apply-templates/>
        &lt;/<xsl:value-of select="name()"/>&gt;
    </xsl:template>
    <xsl:template match="purchase|customer|product">
        &lt;<xsl:value-of select="name()"/> id=<xsl:value-of select="@id"/>&gt;
        <xsl:apply-templates/>
        &lt;/<xsl:value-of select="name()"/>&gt;
    </xsl:template>
</xsl:stylesheet>