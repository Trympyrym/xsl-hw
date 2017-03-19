<?xml version="1.0" encoding="WINDOWS-1251" ?>
<xsl:stylesheet version = "1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0"/>

    <xsl:key name="purchases-by-customer" match="//task[@id=3]//purchase" use="customer/@id"/>
    <xsl:template match="/">
        <homework>
            <xsl:apply-templates/>
        </homework>
    </xsl:template>

    <xsl:template match="task">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="task[@id = 2]">
    </xsl:template>
    <xsl:template match="task[@id = 1]">
    </xsl:template>

    <xsl:template match="cart">
        <cart>
            <xsl:apply-templates select="purchase[generate-id(.) = generate-id(key('purchases-by-customer',customer/@id))]"/>
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
        <customer>
            <xsl:attribute name="id">
                <xsl:value-of select="customer/@id"/>
            </xsl:attribute>
            <xsl:attribute name="total-purchases-amount">
                <xsl:value-of select="sum(key('purchases-by-customer',customer/@id)//amount)"/>
            </xsl:attribute>
            <xsl:for-each select="key('purchases-by-customer',customer/@id)">
                <xsl:sort select=".//cost" data-type="number"/>
                <purchase>
                    <xsl:attribute name="id">
                        <xsl:value-of select="@id"/>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </purchase>
            </xsl:for-each>
        </customer>
    </xsl:template>
    <xsl:template match="customer">
        <xsl:apply-templates/>
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