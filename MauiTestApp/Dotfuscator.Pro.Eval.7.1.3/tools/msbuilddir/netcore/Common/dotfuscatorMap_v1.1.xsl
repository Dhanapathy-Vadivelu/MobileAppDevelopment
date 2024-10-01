<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="dotfuscatorMap">
		<HTML>
      <HEAD>
         <TITLE>Dotfuscator Mapping Report</TITLE>
            <STYLE>
               body 
               {
               margin: 0px 0px 0px 0px;
               padding: 0px 0px 0px 0px;
               background: #ffffff; 
               color: #000000;
               font-family: Verdana, Arial, Helvetica, sans-serif;
               font-size: 70%;
               width: 100%;
               }
               
               div#nstext 
               {
               padding: 5px 10px 0px 22px; 
               }
               
               h1, h2, h3, h4
               {
               font-family: Verdana, Arial, Helvetica, sans-serif;
               margin-bottom: .4em; 
               margin-top: 1em;
               font-weight: bold;
               }
               h1
               {
               font-size: 150%;
               margin-top: 0em;
               }
               h2
               {
               font-size: 130%;
               }
               h3
               {
               font-size: 115%;
               }
               h4
               {
               font-size: 100%;
               }
               .dtH1, .dtH2, .dtH3, .dtH4
               {
               margin-left: -18px;
               }
               
               p
               {
               margin: .5em 0em .5em 0em;
               }
               
               ul p, ol p, dl p
               {
               margin-left: 0em;
               }
               ul p.label, ol p.label
               {
               margin-top: .5em;
               }
               
               a:link
               {
               color: #0000ff;
               }
               a:visited
               {
               color: #0000ff;
               }
               a:hover
               {
               color: #3366ff;
               }
               
               div.tablediv
               {
               width: 100%; 
               margin-top: -.4em;
               }

               table.dtTABLE
               {
               width: 100%; 
               margin-top: .6em;
               margin-bottom: .3em;
               border-width: 1px 1px 0px 0px;
               border-style: solid;
               border-color: #999999;
               background-color: #999999; 
               font-size: 100%; 
               }
               table.dtTABLE th, table.dtTABLE td
               { 
               border-style: solid; /* Creates the cell border and color */
               border-width: 0px 0px 1px 1px;
               border-style: solid;
               border-color: #999999;
               padding: 4px 6px;
               text-align: left;
               }
               table.dtTABLE th	
               { 
               background: #cccccc; 
               vertical-align: bottom;
               }
               table.dtTABLE td	
               {
               background: #ffffff;
               vertical-align: top;
               }
               
            </STYLE>
         </HEAD>        
    
			<BODY topmargin="0" id="bodyID" class="dtBODY"> 	
            <DIV id="nstext" valign="bottom">											
   				<H1 class="dtH1"><xsl:value-of select="header/product"/> Mapping Report</H1>
   				
   				<xsl:apply-templates select="header"/>				
   				<xsl:apply-templates select="mapping" mode="modulelist"/>								
   				<xsl:apply-templates select="mapping" mode="moduledetails"/>
   				<xsl:apply-templates select="mapping" mode="typedetails"/>	
   				<xsl:apply-templates select="statistics"/>			
            </DIV>
			</BODY>
		</HTML>
	</xsl:template>

	<xsl:template name="maintoc">
      <H2 class="dtH2">Contents</H2>
		<p/><A href="#productdetails">Product Details</A>
		<p/><A href="#mapping">Mapping</A>
		<p/><A href="#statistics">Statistics</A>
	</xsl:template>

	<xsl:template match="header">							
		<P><xsl:call-template name="maintoc"/></P>			
		<P>		
      <A name="productdetails"><H2 class="dtH2">Product Details</H2></A>
		<div class="tablediv"><table cellspacing="0" class="dtTABLE">				
			<tr>
			<td><b>Product:</b></td><td><xsl:value-of select="product"/></td>		
			</tr>
			<tr>
			<td><b>Version:</b></td><td><xsl:value-of select="product/@version"/></td>		
			</tr>
			<tr>
			<td><b>Time Stamp:</b></td><td><xsl:value-of select="timestamp"/></td>		
			</tr>
			<tr>
			<td><b>User:</b></td><td><xsl:value-of select="product/@user"/></td>		
			</tr>
			<tr>
			<td><b>Serial Number:</b></td><td><xsl:value-of select="product/@serial"/></td>		
			</tr>
		</table></div>		
		</P>
	</xsl:template>


	<xsl:template match="mapping" mode="modulelist">		

		<A name="mapping"><H2 class="dtH2">Mapping</H2></A>

		<P/><H3 class="dtH2">Modules</H3>
		<xsl:for-each select="module">			
			<xsl:sort order="ascending" select="name"/>	
			<P/><A><xsl:attribute name="href">#<xsl:value-of select="name"/></xsl:attribute>
			<xsl:value-of select="name"/>
			</A>
	   </xsl:for-each>				
	</xsl:template>
	
	
	<xsl:template match="mapping" mode="moduledetails">							
		<xsl:for-each select="module">		
			<xsl:sort order="ascending" select="name"/>			
			
			<P/><H3 class="dtH3"><A>
				<xsl:attribute name="name"><xsl:value-of select="name"/></xsl:attribute>
				Module Details (<xsl:value-of select="name"/>)</A></H3>

																
				
				<P/><a><xsl:attribute name="href">#Orig<xsl:number from="/"></xsl:number></xsl:attribute>Types by Name</a>
				<P/><a><xsl:attribute name="href">#Dot<xsl:number from="/"></xsl:number></xsl:attribute>Types by New Name</a>
				
				<xsl:if test="count(./methodlist/method)>0">
					<P/><a><xsl:attribute name="href">#OrigGlMe<xsl:number from="/"></xsl:number></xsl:attribute>Global Methods by Name</a>
					<P/><a><xsl:attribute name="href">#DotGlMe<xsl:number from="/"></xsl:number></xsl:attribute>Global Methods by New Name</a>
				</xsl:if>
				<xsl:if test="count(./fieldlist/field)>0">
					<P/><a><xsl:attribute name="href">#OrigGlFd<xsl:number from="/"></xsl:number></xsl:attribute>Global Fields by Name</a>				
					<P/><a><xsl:attribute name="href">#DotGlFd<xsl:number from="/"></xsl:number></xsl:attribute>Global Fields by New Name</a>
				</xsl:if>
				<P/>

				<div class="tablediv"><table cellspacing="0" class="dtTABLE">								
					<tr><th colspan="2" align="center">					
						<a><xsl:attribute name="name">Orig<xsl:number from="/"></xsl:number></xsl:attribute><xsl:value-of select="name"/> Types by Name</a>
					</th></tr>											
					<tr><th>Type</th><th>New Name</th></tr>
					<xsl:for-each select="type">
					<xsl:sort order="ascending" select="name"/>
					<tr>
					<td align="left"><A><xsl:attribute name="href">#OT<xsl:number from="/"/><xsl:value-of select="../name"/></xsl:attribute><xsl:value-of select="name"/><xsl:apply-templates select="." mode="origtypearity"/></A>					</td>
						<td align="left"><xsl:value-of select="newname"/><xsl:apply-templates select="." mode="dottypearity"/></td>
					</tr>					
					</xsl:for-each>								
				</table></div>															
				
				<P/>
				
				<div class="tablediv"><table cellspacing="0" class="dtTABLE">								
					<tr><th colspan="2" align="center">					
						<a><xsl:attribute name="name">Dot<xsl:number from="/"></xsl:number></xsl:attribute><xsl:value-of select="name"/> Types by New Name</a>
					</th></tr>											
					<tr><th>New Name</th><th>Original Type Name</th></tr>
					<xsl:for-each select="type">
					<xsl:sort order="ascending" select="newname"/>
					<tr>
					<td align="left"><xsl:value-of select="newname"/><xsl:apply-templates select="." mode="dottypearity"/></td>
					<td align="left"><A><xsl:attribute name="href">#OT<xsl:number from="/"/><xsl:value-of select="../name"/></xsl:attribute><xsl:value-of select="name"/><xsl:apply-templates select="." mode="origtypearity"/></A></td>																										
					</tr>					
					</xsl:for-each>								
				</table></div>										
				<P/>
				
				<xsl:if test="count(./methodlist/method)>0">
					<div class="tablediv"><table cellspacing="0" class="dtTABLE">								
						<tr><th colspan="4" align="center">					
							<a><xsl:attribute name="name">OrigGlMe<xsl:number from="/"></xsl:number></xsl:attribute><xsl:value-of select="name"/> Global Methods by Name</a>
						</th></tr>											
						<tr>
							<th colspan="4" align="center">Methods by Name</th>
						</tr>									
						<tr>					
						<th>Name</th>
						<th>Signature</th>
						<th>New Name</th>
						</tr>
						<xsl:for-each select="./methodlist/*">
							<xsl:sort order="ascending" select="./name"/>					
							<xsl:apply-templates select="." mode="name"/>
						</xsl:for-each>					
					</table></div>								
					<P/>				
								
					<div class="tablediv"><table cellspacing="0" class="dtTABLE">								
						<tr><th colspan="4" align="center">					
							<a><xsl:attribute name="name">DotGlMe<xsl:number from="/"></xsl:number></xsl:attribute><xsl:value-of select="name"/> Global Methods by New Name</a>
						</th></tr>											
						<tr>
							<th colspan="4" align="center">Methods by New Name</th>
						</tr>									
						<tr>					
						<th>New Name</th>
						<th>Name</th>
						<th>Signature</th>					
						</tr>
						<xsl:for-each select="./methodlist/*">
							<xsl:sort order="ascending" select="./newname"/>					
							<xsl:apply-templates select="." mode="newname"/>
						</xsl:for-each>					
					</table></div>								
					<P/>				
				</xsl:if>
				
				<xsl:if test="count(./fieldlist/field)>0">
				<div class="tablediv"><table cellspacing="0" class="dtTABLE">								
					<tr><th colspan="4" align="center">					
						<a><xsl:attribute name="name">OrigGlFd<xsl:number from="/"></xsl:number></xsl:attribute><xsl:value-of select="name"/> Global Fields by Name</a>
					</th></tr>											
					<tr>
						<th colspan="4" align="center">Fields by Name</th>
					</tr>									
					<tr>					
					<th>Name</th>
					<th>Signature</th>
					<th>New Name</th>
					</tr>
					<xsl:for-each select="./fieldlist/*">
						<xsl:sort order="ascending" select="./name"/>					
						<xsl:apply-templates select="." mode="name"/>
					</xsl:for-each>					
				</table></div>				
							
				<P/>
				
				<div class="tablediv"><table cellspacing="0" class="dtTABLE">								
					<tr><th colspan="4" align="center">					
						<a><xsl:attribute name="name">DotGlFd<xsl:number from="/"></xsl:number></xsl:attribute><xsl:value-of select="name"/> Global Fields by New Name</a>
					</th></tr>											
					<tr>
						<th colspan="4" align="center">Fields by New Name</th>
					</tr>									
					<tr>			
					<th>New Name</th>		
					<th>Name</th>
					<th>Signature</th>					
					</tr>
					<xsl:for-each select="./fieldlist/*">
						<xsl:sort order="ascending" select="./newname"/>					
						<xsl:apply-templates select="." mode="newname"/>
					</xsl:for-each>					
				</table></div>		
			</xsl:if>
					
		</xsl:for-each>		
	</xsl:template>
		
		

	<xsl:template match="mapping" mode="typedetails">									
		<xsl:for-each select="module">					
			<xsl:for-each select="type">
			<xsl:sort order="ascending" select="name"/>								
			
         <P/>								
			
			<H3 class="dtH3"><A><xsl:attribute name="name">OT<xsl:number from="/"/><xsl:value-of select="./../name"/></xsl:attribute>Type Details for <xsl:value-of select="name"/> <xsl:apply-templates select="." mode="origtypearity"/></A></H3>

			<div class="tablediv"><table cellspacing="0" class="dtTABLE">
   			
   			<tr>
   			<td>New Name:</td>
   			<td><xsl:value-of select="newname"/></td>		
   			</tr>			
   			
   			<tr>
   			<td>Module:</td>
   			<td><A><xsl:attribute name="href">#<xsl:value-of select="./../name"/></xsl:attribute><xsl:value-of select="./../name"/></A></td>		
   			</tr>			
			</table></div>	
			<P/>

			<xsl:if test="count(./methodlist/method)>0 or count(./fieldlist/field)>0">         

				<A><xsl:attribute name="href">#OM<xsl:number from="/"/><xsl:value-of select="./../name"/></xsl:attribute>View Members by Name</A>
				<P/><A><xsl:attribute name="href">#DM<xsl:number from="/"/><xsl:value-of select="./../name"/></xsl:attribute>View Members by New Name</A>
			
				<P>		
				<H4 class="dtH4"><A><xsl:attribute name="name">OM<xsl:number from="/"/><xsl:value-of select="./../name"/></xsl:attribute>Members by Name</A></H4>								
				<xsl:apply-templates select="fieldlist" mode="name"/>
				<xsl:apply-templates select="methodlist" mode="name"/>		
				</P>		
				
				<P>		
				<H4 class="dtH4"><A><xsl:attribute name="name">DM<xsl:number from="/"/><xsl:value-of select="./../name"/></xsl:attribute>Members by New Name</A></H4>								
				<xsl:apply-templates select="fieldlist" mode="newname"/>
				<xsl:apply-templates select="methodlist" mode="newname"/>		
				</P>	
			
			</xsl:if>         

			
		</xsl:for-each>							
		</xsl:for-each>		
	</xsl:template>
	
	
	<xsl:template match="methodlist" mode="name">	
		<xsl:if test="count(method)>0">
		<P>
		<div class="tablediv"><table cellspacing="0" class="dtTABLE">
			<tr>
				<th colspan="4" align="center">Methods by Name</th>
			</tr>									
			<tr>					
			<th>Name</th>
			<th>Signature</th>
			<th>New Name</th>
			</tr>
			<xsl:for-each select="./*">
			<xsl:sort order="ascending" select="./name"/>					
			<xsl:apply-templates select="." mode="name"/>
			</xsl:for-each>		
		</table></div>
		</P>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="fieldlist" mode="name">	
		<xsl:if test="count(field)>0">
		<P>
		<div class="tablediv"><table cellspacing="0" class="dtTABLE">
			<tr>
				<th colspan="4" align="center">Fields by Name</th>
			</tr>									
			<tr>					
			<th>Name</th>
			<th>Signature</th>
			<th>New Name</th>
			</tr>
			<xsl:for-each select="./*">
			<xsl:sort order="ascending" select="./name"/>					
			<xsl:apply-templates select="." mode="name"/>
			</xsl:for-each>		
		</table></div>
		</P>
		</xsl:if>
	</xsl:template>

	<xsl:template match="methodlist" mode="newname">	
		<xsl:if test="count(method)>0">
		<P>
		<div class="tablediv"><table cellspacing="0" class="dtTABLE">
			<tr>
				<th colspan="4" align="center">Methods by New Name</th>
			</tr>									
			<tr>			
			<th>New Name</th>		
			<th>Name</th>
			<th>Signature</th>			
			</tr>
			<xsl:for-each select="./*">
			<xsl:sort order="ascending" select="./newname"/>					
			<xsl:apply-templates select="." mode="newname"/>
			</xsl:for-each>		
		</table></div>
		</P>
		</xsl:if>
	</xsl:template>	
	
	<xsl:template match="fieldlist" mode="newname">	
		<xsl:if test="count(field)>0">
		<P>
		<div class="tablediv"><table cellspacing="0" class="dtTABLE">
			<tr>
				<th colspan="4" align="center">Fields by New Name</th>
			</tr>									
			<tr>			
			<th>New Name</th>		
			<th>Name</th>
			<th>Signature</th>			
			</tr>
			<xsl:for-each select="./*">
			<xsl:sort order="ascending" select="./newname"/>					
			<xsl:apply-templates select="." mode="newname"/>
			</xsl:for-each>		
		</table></div>
		</P>
		</xsl:if>
	</xsl:template>	


	<xsl:template match="method |field" mode="name">
		<tr>										
			<td>
				<xsl:value-of select="name"/><xsl:apply-templates select="./arity" mode="arity"/>
			</td>
			<td>
				<xsl:value-of select="signature"/>
			</td>
			<td>
				<xsl:value-of select="newname"/>
			</td>
		</tr>									
	</xsl:template>	
	
	<xsl:template match="method |field" mode="newname">
		<tr>			
			<td>
				<xsl:value-of select="newname"/>
			</td>						
			<td>
				<xsl:value-of select="name"/><xsl:apply-templates select="./arity" mode="arity"/>
			</td>			
			<td>
				<xsl:value-of select="signature"/>
			</td>			
		</tr>									
	</xsl:template>	
		

	<xsl:template match="type" mode="origtypearity">
		<xsl:if test="./genericparameter">												    
		&lt;																	
			 <xsl:for-each select="./genericparameter">				
				<xsl:value-of select="name"/>												
				<xsl:variable name="i" select="@sequence"/>
				<xsl:variable name="limit" select="./../arity"/>
				<xsl:if test="($i) &lt; ($limit -1 )">
					,  		
				</xsl:if>
			</xsl:for-each>												
		&gt;								
		</xsl:if>
	</xsl:template>				
	
	<xsl:template match="type" mode="dottypearity">
		<xsl:if test="./genericparameter">												    
		&lt;																	
			 <xsl:for-each select="./genericparameter">				
				<xsl:value-of select="newname"/>												
				<xsl:variable name="i" select="@sequence"/>
				<xsl:variable name="limit" select="./../arity"/>
				<xsl:if test="($i) &lt; ($limit -1 )">
					,  		
				</xsl:if>
			</xsl:for-each>												
		&gt;								
		</xsl:if>
	</xsl:template>		
		
			
<xsl:template match="arity" mode="arity">		
	&lt;													
		<xsl:call-template name="loop">		
			<xsl:with-param name="i" select="0"/>			
			<xsl:with-param name="x" select="(.) - 1"/>
		</xsl:call-template>
	&gt;													
</xsl:template>	
	
<xsl:template name="loop">
	<xsl:param name="i"/>
	<xsl:param name="x"/>	
	!<xsl:value-of select="$i"/>
	<xsl:if test="number($x  - $i) &gt; 0">         
	, 
	</xsl:if>
	<xsl:if test="($i) &lt; ($x)">         
		<xsl:call-template name="loop">
			<xsl:with-param name="i" select="$i +1"/>
			<xsl:with-param name="x" select="$x"/>
		</xsl:call-template>
	</xsl:if>
</xsl:template>


<xsl:template match="statistics">
	<P>
		<A name="statistics"><H2 class="dtH2">Statistics</H2></A></P><P>
		<div class="tablediv"><table cellspacing="0" class="dtTABLE">
			<xsl:for-each select="statisticline">
				<tr>   
					<td>
						<xsl:value-of select="description"/>
					</td>
					<xsl:for-each select="statistic">
						<td>
							<xsl:value-of select="text()"/>
						</td>
					</xsl:for-each>  
				</tr>
			</xsl:for-each>
		</table></div>
		</P>
	</xsl:template>


</xsl:stylesheet> 