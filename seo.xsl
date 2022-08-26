<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

<!-- ///////////////////////////////////////////////////// //-->

  <xsl:template match="hdr/seo" mode="s" >

	<meta name="robots" content="noindex, nofollow" />

	<link rel="revision" href="{$base}" />
	<link rel="shortlink" href="{$base}" />
	<link rel="canonical" href="{$base}" />

	<link rel="icon" href="/favicon.ico" /> 
	<link rel="shortcut icon" href="/favicon.ico" />
	<link rel="icon" type="image/x-icon" href="/favicon.ico" />
	<link rel="icon" type="image/vnd.microsoft.icon" href="/favicon.ico" />
	
    <meta name="apple-touch-fullscreen" content="yes"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-title" content="{$me/ti}"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="#34adeb"/>
	<meta name="mobile-web-app-capable" content="yes"/>
	
	<link rel="icon" type="image/svg+xml" href="./usr/logo.svg" /> <!-- sizes="512x512"  //-->
	<link rel="apple-touch-icon" type="image/svg+xml" href="./usr/logo.svg" /> <!-- sizes="152x152"  //-->
	<link rel="apple-touch-startup-image" href="./usr/portrait.jpg" media="screen and (orientation:portrait)" />
	<link rel="apple-touch-startup-image" href="./usr/landscape.jpg"  media="screen and (orientation:landscape)" />
	
    <meta name="Generator" content="Zagata" />
	<!-- <meta name="viewport" content="ya-title=#84949b, ya-dock=fade" /> //-->
    <link rel="yandex-tableau-widget" href="{concat($base,'/yamanifest.json')}" />
	
	<link rel="manifest" href="manifest.json" />
	<meta name="theme-color" content="#043567" />
	<link rel="mask-icon" href="./usr/logo.svg" color="#34adeb" />
	
	<meta name="msapplication-TileColor" content="#043567" />
	<meta name="msapplication-TileImage" content="./usr/logo.bw.svg" />
	<meta name="msapplication-config" content="browserconfig.xml" /> 
	
	<meta property="og:url" content="{$base}" />
	<meta property="og:type" content="website" />
	<meta property="og:title" content="{$me/ti}" />
	<meta property="og:locale" content="{$vrs/lng}" />
	<meta property="og:description" content="{$me/de}" />
	<meta property="og:site_name" content="{$vrs/host}" />
	<meta property="og:image" content="{concat($base,'/usr/landscape.jpg')}" />
	
	<meta name="twitter:card" content="summary" />
	<meta name="twitter:text:title" content="{$me/ti}" />
	<meta name="twitter:text:title" content="{$me/de}" />
	<meta name="twitter:image" content="{concat($base,'/usr/landscape.jpg')}" />
	
	<script type="application/ld+json">{
    "@context": "https://schema.org",
    "@graph": [
        {
            "@type": "NewsMediaOrganization",
            "url": "<xsl:value-of select="$base" />",
            "sameAs": [
                "https://www.facebook.com/v.hurbatov"
            ],
            "name": "<xsl:value-of select="$me/ti" />",
            "logo": {
                "@type": "ImageObject",
                "url": "<xsl:value-of select="concat($base,'/usr/landscape.jpg')" />",
                "width": "190",
                "height": "44"
            }
        }
    ]
}</script>
	
	<link rel="alternate" type="application/rss+xml" title="{$me/ti}" href="{concat($base,'/rss')}"/>
	
  </xsl:template>

  <xsl:template match="page[./ca='manifest.json']" >
{
  "short_name": "<xsl:value-of select="$vrs/host" />",
  "name": "<xsl:value-of select="$me/ti" />",
  <xsl:if test="$me/de and string-length($me/de) &gt; 1" >"description": "<xsl:value-of select="$me/de" />",</xsl:if>
  "icons": [
    {
      "src": "./usr/logo.svg",
      "type": "image/svg+xml",
      "sizes": "any 48x48 72x72 96x96 128x128 192x192 256x256"
    }
  ],
  "start_url": "/", <!-- ?source=pwa //-->
  "background_color": "#043567",
  "display": "standalone",
  "scope": "/",
  "theme_color": "#043567",
  "shortcuts": [
	<xsl:for-each select="$mn[./li!='redaktors' and ./li!='']" >
    {
      "name": "<xsl:value-of select="./ti" />",
      "short_name": "<xsl:value-of select="./li" />",
      <xsl:if test="./de and string-length(./de) &gt; 1" >"description": "<xsl:value-of select="./de" />",</xsl:if>
      "url": "/<xsl:value-of select="./li" />" <!-- ?source=pwa //-->
      <!-- "icons": [{ "src": "/images/today.png", "sizes": "192x192" }] //-->
    }<xsl:if test="position() != last()" >,</xsl:if>
	</xsl:for-each>
  ]
}
  </xsl:template>

  <xsl:template match="page[./ca='yamanifest.json']" >
{
    "version": "2", "api_version": 3,
    "layout": {
        "logo": "<xsl:value-of select="concat($base,'/usr/logo.svg')" />", "color": "#84949b"
    },
	<!--
    "feed": {
        "url": "http://elzamer.ru/ru/yafeed.json", "format": "json",
        "notifiers": [ { "icon": "%BELL%", "name": "notifications" } ]
    }
	//-->
}
  </xsl:template>

  <xsl:template match="page[./ca='browserconfig.xml']" >
<xsl:processing-instruction name="xml">version="1.0" encoding="utf-8"</xsl:processing-instruction><![CDATA[
]]>
<browserconfig>
    <msapplication>
        <tile>
            <square150x150logo src="/logo.svg" />
            <TileColor>#043567</TileColor>
        </tile>
    </msapplication>
</browserconfig> 
  </xsl:template>
  
  <xsl:template match="page[./ca='rss']" >
<xsl:processing-instruction name="xml">version="1.0" encoding="utf-8"</xsl:processing-instruction><![CDATA[
]]>
	<rss xmlns:atom="http://www.w3.org/2005/Atom" xmlns:opensearch="http://a9.com/-/spec/opensearch/1.1/" xmlns="" version="2.0">
		<channel>
			<title><xsl:value-of select="$me/ti" /></title>
			<description><xsl:value-of select="$me/de" /></description>
			<xsl:for-each select="//i" >
			<xsl:sort select="./lbd" data-type="number" order="descending" />
				<xsl:if test="position() = 1" >
					<lastBuildDate><xsl:value-of select="./rsslbd" /></lastBuildDate>
				</xsl:if>
			</xsl:for-each>
			<language><xsl:value-of select="$vrs/lng" /></language>
			<link><xsl:value-of select="$base" /></link>
			<atom:link href="{concat($base,'/rss')}" rel="self" type="application/rss+xml"/>
			<image>
				<title><xsl:value-of select="$me/ti" /></title>
				<url><xsl:value-of select="concat($base,'/usr/landscape.jpg')" /></url>
				<link><xsl:value-of select="$base" /></link>
			</image>
			<xsl:for-each select="$cnt[string-length(./ti)&gt;0 and ./ca!='eml' and ./ca!='blk' and string-length(./de)&gt;1]" >
			<xsl:sort select="./lbd" data-type="number" order="descending" />
				<item>
					<title><xsl:value-of select="./ti" /></title>
					<description><xsl:value-of select="./de" /></description>
					<link><xsl:value-of select="concat($base,'/',$vrs/abc)" /></link>
					<guid><xsl:value-of select="concat($base,'/itm/',./id)" /></guid>
					<pubDate><xsl:value-of select="./rsslbd" /></pubDate>
					<!-- <author>victorwondermega@gmail.com (Victor Wondermega)</author> //-->
				</item>
			</xsl:for-each>
		</channel>
	</rss>
  </xsl:template>
  
  <xsl:template match="page[./ca='sitemap.xml']" >
<xsl:processing-instruction name="xml">version="1.0" encoding="utf-8"</xsl:processing-instruction><![CDATA[
]]>
    <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"> 
		<xsl:for-each select="$mn[./li!='redaktors']" >
        <url>
            <loc><xsl:value-of select="concat($base,'/',./li)" /></loc>
            <lastmod>2005-01-01</lastmod>
            <changefreq>monthly</changefreq>
            <priority>0.8</priority>
        </url>
        </xsl:for-each>
    </urlset>
  </xsl:template>

</xsl:stylesheet>