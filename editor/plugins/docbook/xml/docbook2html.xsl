<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="html" encoding="UTF-8" indent="no"/>

    <xsl:template match="/">
        <xsl:apply-templates select="article"/>
    </xsl:template>

    <xsl:template match="article">
        <style type="text/css" media="all">
            @import "{css}";
        </style>
        <body>
            <div id="{@id}" title="docbookArticle">
                <xsl:apply-templates select="section"/>
            </div>
        </body>
    </xsl:template>

    <xsl:template match="section">
        <xsl:variable name="secdepth">
            <xsl:value-of select="count(ancestor::*)" />
        </xsl:variable>
        <div id="{@id}" title="docbookSection" class="section">
            <xsl:choose>
                <xsl:when test="$secdepth = 1">
                    <h2 title="docbookSectionTitle">
                        <xsl:value-of select="title" />
                    </h2>
                </xsl:when>

                <xsl:when test="$secdepth = 2">
                    <h3 title="docbookSectionTitle">
                        <xsl:value-of select="title" />
                    </h3>
                </xsl:when>

                <xsl:when test="$secdepth = 3">
                    <h4 title="docbookSectionTitle">
                        <xsl:value-of select="title" />
                    </h4>
                </xsl:when>

                <xsl:when test="$secdepth = 4">
                    <h5 title="docbookSectionTitle">
                        <xsl:value-of select="title" />
                    </h5>
                </xsl:when>

                <!-- Following should never execute. Here as a fail safe. -->
                <xsl:otherwise>
                    <h2 title="docbookSectionTitle">
                        <xsl:value-of select="title" />
                    </h2>
                </xsl:otherwise>
            </xsl:choose>

            <xsl:apply-templates />
        </div>
    </xsl:template>

    <!-- Bad hack. Need to remove later. -->
    <xsl:template match="title">
    </xsl:template>

    <xsl:template match="para">
        <p title="docbookPara">
            <xsl:apply-templates />
        </p>
    </xsl:template>

    <xsl:template match="itemizedlist">
        <ul title="docbookItemizedList" class="itemizedlist">
            <xsl:apply-templates />
        </ul>
    </xsl:template>

    <xsl:template match="listitem">
        <li title="docbookListItem">
            <xsl:apply-templates />
        </li>
    </xsl:template>

    <xsl:template match="procedure">
        <ol title="docbookProcedure" class="procedure">
            <xsl:apply-templates />
        </ol>
    </xsl:template>

    <xsl:template match="step">
        <li title="docbookStep">
            <xsl:apply-templates />
        </li>
    </xsl:template>

    <xsl:template match="screen">
        <pre title="docbookScreen" class="screen">
            <xsl:apply-templates />
        </pre>
    </xsl:template>



    <!-- ********************** -->
    <!-- Inline tags below this -->
    <!-- ********************** -->

    <xsl:template match="sgmltag">
        <code title="docbookSGMLTag" class="sgmltag-{@class}">
            <xsl:value-of select="." />
        </code>
    </xsl:template>

    <xsl:template match="filename">
        <code title="docbookFileName" class="filename">
            <xsl:value-of select="." />
        </code>
    </xsl:template>

    <xsl:template match="command">
        <code title="docbookCommand" class="command">
            <xsl:value-of select="." />
        </code>
    </xsl:template>

    <xsl:template match="option">
        <code title="docbookOption" class="option">
            <xsl:value-of select="." />
        </code>
    </xsl:template>

    <xsl:template match="userinput">
        <code title="docbookUserInput" class="userinput">
            <xsl:value-of select="." />
        </code>
    </xsl:template>

    <xsl:template match="computeroutput">
        <code title="docbookComputerOutput" class="computeroutput">
            <xsl:value-of select="." />
        </code>
    </xsl:template>


    <!-- ******************** -->
    <!-- Meta tags below this -->
    <!-- ******************** -->

    <!-- Do nothing for now -->
    <xsl:template match="indexterm">
    </xsl:template>

</xsl:stylesheet>
