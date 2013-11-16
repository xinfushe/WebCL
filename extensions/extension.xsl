<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="rev_utils.xsl" />
<xsl:import href="standards.xsl" />

<xsl:output method="xml" media-type="text/html" omit-xml-declaration="yes" />

<xsl:template match="ratified">
  <xsl:call-template name="ext_page">
    <xsl:with-param name="spec_type" select="'Khronos Ratified Extension Specification'" />
    <xsl:with-param name="css" select="concat($basepath,'/resources/Khronos-Final.css')" />
    <xsl:with-param name="spec_status" select="'complete'" />
  </xsl:call-template>
</xsl:template>

<xsl:template match="extension">
  <xsl:call-template name="ext_page">
    <xsl:with-param name="spec_type" select="'Extension Specification'" />
    <xsl:with-param name="css" select="concat($basepath,'/resources/Khronos-Final.css')" />
    <xsl:with-param name="spec_status" select="'community approved'" />
  </xsl:call-template>
</xsl:template>

<xsl:template match="draft">
  <xsl:call-template name="ext_page">
    <xsl:with-param name="spec_type" select="'Extension Draft Specification'" />
    <xsl:with-param name="css" select="concat($basepath,'/resources/Khronos-WD.css')" />
    <xsl:with-param name="spec_status" select="'draft'" />
  </xsl:call-template>
</xsl:template>

<xsl:template match="proposal">
  <xsl:call-template name="ext_page">
    <xsl:with-param name="spec_type" select="'Extension Proposed Specification'" />
    <xsl:with-param name="css" select="concat($basepath,'/resources/Khronos-Proposal.css')" />
    <xsl:with-param name="spec_status" select="'proposal'" />
  </xsl:call-template>
</xsl:template>

<xsl:template name="ext_page">
  <xsl:param name="spec_type" />
  <xsl:param name="css" />
  <xsl:param name="spec_status" />
  <xsl:variable name="title">
    <xsl:text>WebCL </xsl:text>
    <xsl:value-of select="name" />
    <xsl:text> </xsl:text><xsl:value-of select="$spec_type" />
  </xsl:variable>
  <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html>
</xsl:text>
  <xsl:comment>AUTOGENERATED FILE - DO NOT EDIT - SEE Makefile</xsl:comment>
  <html lang="en" xml:lang="en">
    <xsl:attribute name="xmlns1">http://www.w3.org/1999/xhtml</xsl:attribute>
    <head>
      <meta charset="UTF-8" />
      <title><xsl:value-of select="$title" /></title>
      <link rel="alternate" type="text/xml" href="extension.xml" />
      <link rel="stylesheet" type="text/css" href="{$css}" />
    </head>
    <body>
      <xsl:call-template name="logo" />

      <h1><xsl:value-of select="$title" /></h1>
      
      <xsl:if test="$spec_status='proposal'">
      <p><strong>DO NOT IMPLEMENT!!!</strong></p>
      </xsl:if>

      <h2 class="no-toc">Name</h2>
      <p> <xsl:value-of select="name" /> </p>

      <h2 class="no-toc">Contact</h2>
      <p> <xsl:copy-of select="contact/node()" /> </p>

      <h2 class="no-toc">Contributors</h2>
      <xsl:for-each select="contributors/contributor">
        <p> <xsl:copy-of select="node()" /> </p>
      </xsl:for-each>

      <xsl:if test="status">
        <h2 class="no-toc">Status</h2>
        <p> <xsl:copy-of select="status/node()" /> </p>
      </xsl:if>

      <h2 class="no-toc">Version</h2>
      <p> Last modified date: <xsl:call-template name="last_mod" /> <br />
          Revision: <xsl:call-template name="last_rev" />
      </p>

      <h2 class="no-toc">Number</h2>
      <p> WebCL extension #<xsl:value-of select="number" /> </p>

      <h2 class="no-toc">Dependencies</h2>
      <xsl:apply-templates select="depends" mode="depends" />

      <h2 class="no-toc">Overview</h2>
      <xsl:apply-templates select="overview" mode="overview" />

      <xsl:if test="aliases">
        <h2 class="no-toc">Alias Name Strings (for draft extensions)</h2>
        <ul><xsl:for-each select="aliases/alias">
          <li> <xsl:copy-of select="node()" /> </li>
        </xsl:for-each></ul>
      </xsl:if>

      <h2 class="no-toc">IDL</h2>
<pre class="idl">
<xsl:value-of select="idl" />
</pre>

      <xsl:if test="ipstatus">
        <h2 class="no-toc">IP Status</h2>
        <xsl:copy-of select="ipstatus/node()" />
      </xsl:if>

      <xsl:if test="newfun">
        <h2 class="no-toc">New Functions</h2>
        <xsl:apply-templates select="newfun" mode="newfun" />
      </xsl:if>

      <xsl:if test="newtypes">
        <h2 class="no-toc">New Types</h2>
        <xsl:apply-templates select="newtypes" mode="newfun" />
      </xsl:if>

      <xsl:if test="newtok">
        <h2 class="no-toc">New Tokens</h2>
        <xsl:apply-templates select="newtok" mode="newfun" />
      </xsl:if>

      <xsl:if test="additions">
        <h2 class="no-toc">Additions to the WebCL Specification</h2>
        <xsl:copy-of select="additions/node()" />
      </xsl:if>

      <xsl:if test="errors">
        <h2 class="no-toc">Errors</h2>
        <xsl:for-each select="errors/error">
          <div><xsl:copy-of select="node()" /></div>
        </xsl:for-each>
      </xsl:if>

      <xsl:if test="newstate">
        <h2 class="no-toc">New State</h2>
        <xsl:copy-of select="newstate/node()" />
      </xsl:if>

      <xsl:if test="newimplstate">
        <h2 class="no-toc">New Implementation-Dependent State</h2>
        <xsl:copy-of select="newimplstate/node()" />
      </xsl:if>

      <xsl:if test="samplecode">
        <h2 class="no-toc">Sample Code</h2>
        <xsl:copy-of select="samplecode/node()" />
      </xsl:if>

      <xsl:if test="tests">
        <h2 class="no-toc">Conformance Tests</h2>
        <xsl:copy-of select="tests/node()" />
      </xsl:if>

      <xsl:if test="security">
        <h2 class="no-toc">Security Considerations</h2>
        <xsl:copy-of select="security/node()" />
      </xsl:if>

      <xsl:if test="issues">
        <h2 class="no-toc">Issues</h2>
        <xsl:copy-of select="issues/node()" />
      </xsl:if>

      <h2 class="no-toc">Revision History</h2>
      <xsl:apply-templates select="history/revision">
        <xsl:sort select="@date" />
      </xsl:apply-templates>

    </body>
  </html>
</xsl:template>
  
<xsl:template name="logo">
  <xsl:comment>begin-logo</xsl:comment>
  <div class="left">
    <a href="http://webcl.org/"><img alt="WebCL" height="72" src="{concat($basepath,'/specs/latest/1.0/resources/WebCL_logo.png')}" width="156" /></a>
  </div>
  <div class="right">
    <a href="http://khronos.org/"><img alt="Khronos" height="60" src="{concat($basepath,'/specs/latest/1.0/resources/KhronosGroup-3D.png')}" width="220" /></a>
  </div>
  <div style="clear: both;">&#160;</div>
  <br/>
  <xsl:comment>end-logo</xsl:comment>
</xsl:template>

<xsl:template match="api" mode="depends">
  <p> Written against the <xsl:apply-templates select="."/> specification. </p>
</xsl:template>

<xsl:template match="ext" mode="depends">
  <xsl:choose>
	<xsl:when test="@require='true'">
	  <p> Implementations must also support the <xsl:apply-templates select="."/> extension. </p>
	</xsl:when>
	<xsl:otherwise>
	  <p> Written against the <xsl:apply-templates select="."/> specification. </p>
	</xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="glsl" mode="depends">
  <p> Written against the <xsl:apply-templates select="."/> specification. </p>
</xsl:template>

<xsl:template match="rfc" mode="depends">
  <p> Written against IETF <xsl:apply-templates select="."/>. </p>
</xsl:template>

<xsl:template match="overview" mode="overview">
  <xsl:apply-templates select="node()" mode="overview" />
</xsl:template>
<xsl:template match="mirrors" mode="overview">
  <p> This extension exposes the
  <a href="{@href}"><xsl:value-of select="@name"/></a> functionality to WebCL.
  </p>
  <xsl:choose>
    <xsl:when test="count(addendum)=0">
      <p>There are no WebCL-specific behavioral changes.</p>
    </xsl:when>
    <xsl:otherwise>
      <p>The following WebCL-specific behavioral changes apply:</p>
    <ul>
      <xsl:for-each select="addendum">
        <li><xsl:copy-of select="node()" /></li>
      </xsl:for-each>
    </ul>
    </xsl:otherwise>
  </xsl:choose>
  <xsl:choose>
    <xsl:when test="count(child::*[local-name()!='addendum'])!=0">
      <xsl:copy-of select="child::node()[local-name()!='addendum']" />
    </xsl:when>
    <xsl:otherwise>
      <p>
        Consult the above extension for documentation, issues and new functions and enumerants.
      </p>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="features" mode="overview">
  <p> When this extension is enabled: </p>
  <ul>
    <xsl:for-each select="feature">
      <li><xsl:copy-of select="node()" /></li>
    </xsl:for-each>
    <xsl:for-each select="glsl">
      <li>
        <xsl:text>When a </xsl:text>
        <xsl:if test="count(stage)>0">
          <xsl:for-each select="stage">
            <xsl:choose>
              <xsl:when test="last()=1 or position()=last()">
                <em><xsl:value-of select="@type"/></em><xsl:text> </xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <em><xsl:value-of select="@type"/></em><xsl:text> or </xsl:text>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
        </xsl:if>
        <xsl:text>shader enables, requires, or warns </xsl:text>
        <code><xsl:value-of select="@extname" /></code>
        <xsl:if test="alias">
          <xsl:for-each select="alias">
            <xsl:choose>
              <xsl:when test="position()=1">
                <xsl:text> (or </xsl:text>
                <code><xsl:value-of select="@extname" /></code>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text> or </xsl:text>
                <code><xsl:value-of select="@extname" /></code>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
          <xsl:text>)</xsl:text>
        </xsl:if>
        <xsl:text> with an </xsl:text>
        <code>#extension</code>
        <xsl:text> directive:</xsl:text>
        <ul>
          <xsl:for-each select="macro">
            <li>
              The macro <code><xsl:value-of select="@name" /></code>
              is defined as <code><xsl:value-of select="@value" /></code>.
            </li>
          </xsl:for-each>
          <xsl:for-each select="type">
            <li>
              <code><xsl:value-of select="@name"/></code> is a built-in type.
            </li>
          </xsl:for-each>
          <xsl:for-each select="function">
            <li>
              <code><xsl:call-template name="fun_sig"/></code> is a built-in
              function.
            </li>
          </xsl:for-each>
          <xsl:for-each select="output">
            <li>
                <code><xsl:call-template name="shader_output"/></code> is a built-in output.
            </li>
          </xsl:for-each>
        </ul>
      </li>
      <li>
		The GLSL macro <code><xsl:value-of select="@extname"/></code>
		<xsl:if test="alias">
          <xsl:for-each select="alias">
            <xsl:choose>
              <xsl:when test="position()=1">
                <xsl:text> (or </xsl:text>
                <code><xsl:value-of select="@extname" /></code>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text> or </xsl:text>
                <code><xsl:value-of select="@extname" /></code>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
          <xsl:text>)</xsl:text>
        </xsl:if>
        is defined as <code>1</code>.
      </li>
    </xsl:for-each>
  </ul>
</xsl:template>

<xsl:template match="api|ext|glsl|rfc" mode="overview">
  <xsl:apply-templates select="." />
</xsl:template>
<xsl:template match="node()" mode="overview">
  <xsl:copy>
    <xsl:copy-of select="@*" />
    <xsl:apply-templates select="node()" mode="overview" />
  </xsl:copy>
</xsl:template>

<xsl:template match="newfun|newtypes|newtok" mode="newfun">
  <xsl:copy-of select="p" />
  <xsl:if test="count(*[local-name()!='p']) != 0">
    <dl class="methods">
      <xsl:apply-templates select="*[local-name()!='p']" mode="newfun" />
    </dl>
  </xsl:if>
</xsl:template>
<xsl:template match="type/name" mode="newfun">
  <em><xsl:value-of select="."/></em>
</xsl:template>
<xsl:template match="typedef" mode="newfun">
  <dt class="idl-code">
    <xsl:text>typedef </xsl:text>
    <xsl:apply-templates select="type/node()" mode="newfun" />
  </dt>
  <dd>
    <xsl:apply-templates select="node()[local-name()!='type']" mode="newfun" />
  </dd>
</xsl:template>
<xsl:template match="function" mode="newfun">
  <dt class="idl-code"><xsl:call-template name="fun_sig"/></dt>
  <dd>
    <xsl:apply-templates select="node()" mode="newfun" />
  </dd>
</xsl:template>
<xsl:template match="param" mode="newfun" />
<xsl:template match="node()" mode="newfun">
  <xsl:copy>
    <xsl:copy-of select="@*" />
    <xsl:apply-templates select="node()" mode="newfun" />
  </xsl:copy>
</xsl:template>

<xsl:template name="fun_sig">
  <xsl:value-of select="@type"/><xsl:text> </xsl:text>
  <xsl:value-of select="@name"/><xsl:text>(</xsl:text>
  <xsl:for-each select="param">
    <xsl:value-of select="@type"/>
    <xsl:if test="@name">
      <xsl:text> </xsl:text>
      <xsl:value-of select="@name"/>
    </xsl:if>
    <xsl:if test="not(position()=last())">, </xsl:if>
  </xsl:for-each>
  <xsl:text>)</xsl:text>
</xsl:template>

<xsl:template name="shader_output">
  <xsl:value-of select="@type"/><xsl:text> </xsl:text>
  <xsl:value-of select="@name"/>
</xsl:template>

<xsl:template match="revision">
  <p>Revision <xsl:value-of select="position()"/>, <xsl:value-of select="@date"/></p>
  <ul>
    <xsl:for-each select="change">
      <li><xsl:copy-of select="node()"/></li>
    </xsl:for-each>
  </ul>
</xsl:template>

</xsl:stylesheet>
