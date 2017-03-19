<?xml version="1.0" encoding="WINDOWS-1251" ?>
<xsl:stylesheet version = "1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0"/>

    <xsl:template match="/">
        <homework>
            <xsl:apply-templates/>
        </homework>
    </xsl:template>

    <xsl:template match="task">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="task[@id = 3]">
    </xsl:template>
    <xsl:template match="task[@id = 1]">
    </xsl:template>

    <xsl:template match="cart">
        <cart>
            <xsl:apply-templates>
                <xsl:sort select=".//cost" order="descending" data-type="number"/>
            </xsl:apply-templates>
        </cart>
    </xsl:template>
    <xsl:template match="cost">
        <cost>
            <xsl:apply-templates/>
        </cost>
    </xsl:template>
    <xsl:template match="amount">
        <amount>
            <xsl:apply-templates/>
        </amount>
    </xsl:template>
    <xsl:template match="purchase">
        <purchase>
            <xsl:attribute name="id">
                <xsl:value-of select="@id"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </purchase>
    </xsl:template>
    <xsl:template match="customer">
        <customer>
            <xsl:attribute name="id">
                <xsl:value-of select="@id"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </customer>
    </xsl:template>
    <xsl:template match="product">
        <product>
            <xsl:attribute name="id">
                <xsl:value-of select="@id"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </product>
    </xsl:template>
</xsl:stylesheet>