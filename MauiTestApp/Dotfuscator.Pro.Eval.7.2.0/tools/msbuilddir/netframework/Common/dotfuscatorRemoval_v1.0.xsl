<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="dotfuscatorRemoval">
		<HTML>
         <HEAD>
            <TITLE>Dotfuscator Removal Report</TITLE>
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
               <H1 class="dtH1"><xsl:value-of select="header/product"/> Removal Report</H1>
   				
   				<xsl:apply-templates select="header"/>			
   				<xsl:apply-templates select="detail" mode="modulelist"/>								
   				<xsl:apply-templates select="detail" mode="moduledetails"/>
   				<xsl:apply-templates select="detail" mode="typedetails"/>	
   				<xsl:apply-templates select="statistics"/>		
	         </DIV>
			</BODY>
		</HTML>
	</xsl:template>


   <xsl:template name="maintoc">
      <H2 class="dtH2">Contents</H2>
      <p/><A href="#productdetails">Product Details</A>
      <p/><A href="#removal">Removal Information</A>
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
		</table></div>		
		</P>
	</xsl:template>


	<xsl:template match="detail" mode="modulelist">		

		<A name="removal"><H2 class="dtH2">Removal Information</H2></A>

		<P/><H3 class="dtH3">Modules</H3>

		<P><font color="RED">Note: Pruned items are shown in red.</font></P>
			<xsl:for-each select="module">			
			<xsl:sort order="ascending" select="name"/>	
			<P/>
			<A>
			<xsl:choose>
				<xsl:when test="@pruned='true'">
					<xsl:attribute name="style">color:RED</xsl:attribute> 
				</xsl:when>
			</xsl:choose>
					
			<xsl:attribute name="href">#<xsl:value-of select="name"/></xsl:attribute>									
				<xsl:value-of select="name"/>
			</A>			

		</xsl:for-each>				

	</xsl:template>
	
	
	<xsl:template match="detail" mode="moduledetails">							
		<xsl:for-each select="module">		
			<xsl:sort order="ascending" select="name"/>			
			<H3 class="dtH3"><A>
				<xsl:attribute name="name"><xsl:value-of select="name"/></xsl:attribute>
				Module Details (<xsl:value-of select="name"/>)</A></H3>
				<P>	
				<xsl:apply-templates select="fieldlist" mode="name"/>
				<xsl:apply-templates select="methodlist" mode="name"/>	
				<xsl:apply-templates select="propertylist" mode="name"/>
				<xsl:apply-templates select="resourcelist" mode="name"/>
				</P>

				<P>	
				<div class="tablediv"><table cellspacing="0" class="dtTABLE">													
					<tr>
   				<th>Types</th>
   				</tr>									

					<xsl:for-each select="type">
					<xsl:sort order="ascending" select="name"/>
					<tr>					
					<td>
   					<A>
   					<xsl:choose>
   					<xsl:when test="@pruned='true'">
   					<xsl:attribute name="style">color:RED</xsl:attribute> 
   					</xsl:when>
   					</xsl:choose>			
   			
   					<xsl:attribute name="href">#OT<xsl:number from="/"/><xsl:value-of select="../name"/></xsl:attribute><xsl:value-of select="name"/>
   					</A>
               </td>																				
					</tr>					
					</xsl:for-each>								
				</table></div>																						

			</P>
		</xsl:for-each>		
	</xsl:template>
		
		

	<xsl:template match="detail" mode="typedetails">									
		<xsl:for-each select="module">					
			<xsl:for-each select="type">
			<xsl:sort order="ascending" select="name"/>		
						
            <P/>								
            
            <H3 class="dtH3"><A><xsl:attribute name="name">OT<xsl:number from="/"/><xsl:value-of select="./../name"/></xsl:attribute>Type Details for <xsl:value-of select="name"/></A></H3>
            
         <div class="tablediv"><table cellspacing="0" class="dtTABLE">			
			<tr>
			<td>Name:</td>
			<td>
			<xsl:choose>
				<xsl:when test="@pruned='true'">
				<xsl:attribute name="style">color:RED</xsl:attribute> 
				</xsl:when>
			</xsl:choose>				
			<xsl:value-of select="name"/></td>		
			</tr>						
			
			<tr>
			<td>Module:</td>
			<td>			
			<A>
			
			<xsl:choose>
				<xsl:when test="./../@pruned='true'">
				<xsl:attribute name="style">color:RED</xsl:attribute> 
				</xsl:when>
			</xsl:choose>			
			
			<xsl:attribute name="href">#<xsl:value-of select="./../name"/></xsl:attribute><xsl:value-of select="./../name"/>
			</A>
			</td>		
			</tr>			
		
		</table></div>			
		
		<P>		
		<xsl:apply-templates select="fieldlist" mode="name"/>
		<xsl:apply-templates select="methodlist" mode="name"/>	
		<xsl:apply-templates select="propertylist" mode="name"/>
		</P>		
		

		</xsl:for-each>							
		</xsl:for-each>		
	</xsl:template>
	
	
	<xsl:template match="methodlist" mode="name">	
		<xsl:if test="count(method)>0">
		<P>
		<div class="tablediv"><table cellspacing="0" class="dtTABLE">
			<tr>
				<th colspan="4" align="center">Methods</th>
			</tr>									
			<tr>					
			<th>Name</th>
			<th>Signature</th>			
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
				<th colspan="4" align="center">Fields</th>
			</tr>									
			<tr>					
			<th>Name</th>
			<th>Signature</th>
			</tr>
			<xsl:for-each select="./*">
			<xsl:sort order="ascending" select="./name"/>					
			<xsl:apply-templates select="." mode="name"/>
			</xsl:for-each>		
		</table></div>
		</P>
		</xsl:if>
	</xsl:template>

	<xsl:template match="propertylist" mode="name">	
		<xsl:if test="count(property)>0">
		<P>
		<div class="tablediv"><table cellspacing="0" class="dtTABLE">
			<tr>
				<th colspan="4" align="center">Properties</th>
			</tr>									
			<xsl:for-each select="./*">
			<xsl:sort order="ascending" select="./name"/>					
			<tr>					
			<xsl:choose>
				<xsl:when test="@pruned='true'">
				<xsl:attribute name="style">color:RED</xsl:attribute> 
				</xsl:when>
			</xsl:choose>				
			<td>			
				<xsl:value-of select="name"/>
			</td>			
			</tr>					
			</xsl:for-each>		
		</table></div>
		</P>
		</xsl:if>
	</xsl:template>

	<xsl:template match="resourcelist" mode="name">	
		<xsl:if test="count(resource)>0">
		<P>
		<div class="tablediv"><table cellspacing="0" class="dtTABLE">
			<tr>
				<th colspan="4" align="center">Resources</th>
			</tr>									
			<xsl:for-each select="./*">
			<xsl:sort order="ascending" select="./name"/>					
			<tr>					
			<xsl:choose>
				<xsl:when test="@pruned='true'">
				<xsl:attribute name="style">color:RED</xsl:attribute> 
				</xsl:when>
			</xsl:choose>				
			<td>			
				<xsl:value-of select="name"/>
			</td>			
			</tr>					
			</xsl:for-each>		
		</table></div>
		</P>
		</xsl:if>
	</xsl:template>


	<xsl:template match="method |field" mode="name">		
		<tr>					
			<xsl:choose>
				<xsl:when test="@pruned='true'">
				<xsl:attribute name="style">color:RED</xsl:attribute> 
				</xsl:when>
			</xsl:choose>				
			<td>			
				<xsl:value-of select="name"/>
			</td>
			<td>
				<xsl:value-of select="signature"/>
			</td>				
		</tr>						
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