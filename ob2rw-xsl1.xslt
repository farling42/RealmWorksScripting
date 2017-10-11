<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" version="1.0" indent="yes"/>

<xsl:variable name="obstart">&lt;p&gt;</xsl:variable>
<xsl:variable name="obfinish">&lt;/p&gt;</xsl:variable>
<xsl:variable name="textstart">&lt;p class=&quot;RWDefault&quot;&gt;&lt;span class=&quot;RWSnippet&quot;&gt;</xsl:variable>
<xsl:variable name="textfinish">&lt;/span&gt;&lt;/p&gt;</xsl:variable>
<xsl:variable name="imgstart">img src="//</xsl:variable>
<xsl:variable name="imgafter">img src="http://</xsl:variable>

<xsl:template name="replace">
	<!-- This macro is required because Microsoft only supports XSLT 1.0, so we can't use replace() function -->
	<xsl:param name="text" />
	<xsl:param name="replace" />
	<xsl:param name="by" />
	<xsl:choose>
	  <xsl:when test="contains($text, $replace)">
		<xsl:value-of select="substring-before($text,$replace)" />
		<xsl:value-of select="$by" />
		<xsl:call-template name="replace">
		  <xsl:with-param name="text"
		  select="substring-after($text,$replace)" />
		  <xsl:with-param name="replace" select="$replace" />
		  <xsl:with-param name="by" select="$by" />
		</xsl:call-template>
	  </xsl:when>
	  <xsl:otherwise>
		<xsl:value-of select="$text" />
	  </xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="content">
	<xsl:call-template name="replace">
		<xsl:with-param name="text">
			<xsl:call-template name="replace">
				<xsl:with-param name="text">
					<xsl:call-template name="replace">
						<xsl:with-param name="text" select="text()" />
						<xsl:with-param name="replace" select="$obfinish" />
						<xsl:with-param name="by" select="$textfinish" />
					</xsl:call-template>
				</xsl:with-param>
				<xsl:with-param name="replace" select="$obstart" />
				<xsl:with-param name="by" select="$textstart" />
			</xsl:call-template>
		</xsl:with-param>
		<xsl:with-param name="replace" select="$imgstart" />
		<xsl:with-param name="by" select="$imgafter" />
	</xsl:call-template>
</xsl:template>


<xsl:template match="/">
	<export format_version="2" game_system_id="3" is_structure_only="false" 
		xmlns="urn:lonewolfdevel.com:realm-works-export"
		xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
		<definition>
			<details>
				<xsl:attribute name="original_uuid">B8409DB6-FE6C-A317-A7EF-6B935B3A6BA9</xsl:attribute>
				<xsl:attribute name="name"><xsl:value-of select="campaign/title"/></xsl:attribute>
				<xsl:attribute name="import_tag_id">Tag_1</xsl:attribute>
				<summary>Automatic conversion from Obsidian Portal XML backup</summary>
			</details>
			<content_summary>
				<xsl:attribute name="max_domain_count">1</xsl:attribute>
				<xsl:attribute name="max_category_count">5</xsl:attribute>
				<xsl:variable name="set" select="/campaign/blog/entry | /campaign/wiki/page | /campaign/characters/character | /campaign/items/item | /campaign/forum/topic"/>
				<xsl:attribute name="topic_count"><xsl:value-of select="count($set)"/></xsl:attribute>
				<xsl:attribute name="plot_count">0</xsl:attribute>
			</content_summary>
		</definition>
		<structure>
			<domain_global domain_id="Domain_1" name="Import">
				<!-- this "Import" domain is required in order to establish the "Tag_1" required for import_tag_id of details -->
				<xsl:attribute name="global_uuid">0008287B-91C6-5D3A-00D0-6A935C3C6BA9</xsl:attribute>
				<tag tag_id="Tag_1" match_priority="Normal" signature="622704">
					<xsl:attribute name="original_uuid">12345678-FE6C-A317-A7EF-6B935B3A6BA9</xsl:attribute>
					<xsl:attribute name="name"><xsl:value-of select="campaign/title"/></xsl:attribute>
				</tag>
			</domain_global>

			<!-- One structure for each type of item exported: Blog, Wikipage, Character, Item, Topic -->
			<category category_id="cat_blog" name="Obsidian Portal Adventure Log" abbrev="Obsidian P" role="Topic" family_id="7" asset_name="Open Book" asset_uuid="B600287B-91C6-5D3A-00D0-6A935C3C6BA9" original_uuid="5A8092B6-FE6C-A317-A7EF-6B935B3A6BA9" signature="623677">
				<description />
				<summary />
				<partition partition_id="p_blog_over" name="Overview" original_uuid="5B8092B6-FE6C-A317-A7EF-6B935B3A6BA9" signature="622706">
					<description />
					<purpose />
				</partition>
				<partition partition_id="p_blog_public" name="Public" original_uuid="5C8092B6-FE6C-A317-A7EF-6B935B3A6BA9" signature="622707">
					<description />
					<purpose />
				</partition>
				<partition partition_id="p_blog_gm" name="GM Only" original_uuid="5D8092B6-FE6C-A317-A7EF-6B935B3A6BA9" signature="622708">
					<description />
					<purpose />
				</partition>
			</category>
			<category category_id="cat_person" name="Obsidian Portal Character" abbrev="Obsidian P" role="Topic" family_id="1" asset_name="Individual" asset_uuid="F7AD297B-91C6-5D3A-00D0-6A935D3C6BA9" original_uuid="5E8092B6-FE6C-A317-A7EF-6B935B3A6BA9" signature="623678">
				<description />
				<summary />
				<partition partition_id="p_person_over" name="Overview" original_uuid="5F8092B6-FE6C-A317-A7EF-6B935B3A6BA9" signature="622710">
					<description />
					<purpose />
				</partition>
				<partition partition_id="p_person_public" name="Public" original_uuid="608092B6-FE6C-A317-A7EF-6B935B3A6BA9" signature="622711">
					<description />
					<purpose />
				</partition>
				<partition partition_id="p_person_gm" name="GM Only" original_uuid="618092B6-FE6C-A317-A7EF-6B935B3A6BA9" signature="622712">
					<description />
					<purpose />
				</partition>
			</category>
			<category category_id="cat_item" name="Obsidian Portal Item" abbrev="Obsidian P" role="Topic" family_id="4" asset_name="Named Object" asset_uuid="FAAD297B-91C6-5D3A-00D0-6A935D3C6BA9" original_uuid="648092B6-FE6C-A317-A7EF-6B935B3A6BA9" signature="623679">
				<description />
				<summary />
				<partition partition_id="p_item_over" name="Overview" original_uuid="658092B6-FE6C-A317-A7EF-6B935B3A6BA9" signature="622716">
					<description />
					<purpose />
				</partition>
				<partition partition_id="p_item_public" name="Public" original_uuid="668092B6-FE6C-A317-A7EF-6B935B3A6BA9" signature="622717">
					<description />
					<purpose />
				</partition>
				<partition partition_id="p_item_gm" name="GM only" original_uuid="678092B6-FE6C-A317-A7EF-6B935B3A6BA9" signature="622718">
					<description />
					<purpose />
				</partition>
			</category>
			<category category_id="cat_forum" name="Obsidian Portal Forum Thread" abbrev="Obsidian P" role="Topic" family_id="7" asset_name="Further Information" asset_uuid="4701287B-91C6-5D3A-00D0-6A935C3C6BA9" original_uuid="688092B6-FE6C-A317-A7EF-6B935B3A6BA9" signature="623680">
				<description />
				<summary />
				<partition partition_id="p_forum_over" name="Overview" original_uuid="698092B6-FE6C-A317-A7EF-6B935B3A6BA9" signature="622720">
					<description />
					<purpose />
				</partition>
				<partition partition_id="p_forum_public" name="Public" original_uuid="6A8092B6-FE6C-A317-A7EF-6B935B3A6BA9" signature="622721">
					<description />
					<purpose />
				</partition>
				<partition partition_id="p_forum_gm" name="GM Only" original_uuid="6B8092B6-FE6C-A317-A7EF-6B935B3A6BA9" signature="622722">
					<description />
					<purpose />
				</partition>
			</category>
			<category category_id="cat_wiki" name="Obsidian Portal Wiki" abbrev="Obsidian P" role="Topic" family_id="7" asset_name="Deity" asset_uuid="0DAE297B-91C6-5D3A-00D0-6A935D3C6BA9" original_uuid="6C8092B6-FE6C-A317-A7EF-6B935B3A6BA9" signature="623681">
				<description />
				<summary />
				<partition partition_id="p_wiki_over" name="Overview" original_uuid="6D8092B6-FE6C-A317-A7EF-6B935B3A6BA9" signature="622724">
					<description />
					<purpose />
				</partition>
				<partition partition_id="p_wiki_public" name="Public" original_uuid="6E8092B6-FE6C-A317-A7EF-6B935B3A6BA9" signature="622725">
					<description />
					<purpose />
				</partition>
				<partition partition_id="p_wiki_gm" name="GM Only" original_uuid="6F8092B6-FE6C-A317-A7EF-6B935B3A6BA9" signature="622726">
					<description />
					<purpose />
				</partition>
			</category>
		</structure>
		<contents>
			<xsl:apply-templates select="campaign/blog/entry"/>
			<xsl:apply-templates select="campaign/wiki/page"/>
			<xsl:apply-templates select="campaign/characters/character"/>
			<xsl:apply-templates select="campaign/items/item"/>
			<xsl:apply-templates select="campaign/forum/topic"/>
		</contents>
	</export>
</xsl:template>

<xsl:template match="campaign/blog/entry">
	<!-- Convert OB blog entry into the appropriate RW topic -->
	<topic category_id="cat_blog" xmlns="urn:lonewolfdevel.com:realm-works-export">
		<xsl:attribute name="topic_id">blog-<xsl:number value="position()"/></xsl:attribute>
		<xsl:attribute name="public_name"><xsl:value-of select="name"/></xsl:attribute>
		<section partition_id="p_blog_public">
			<xsl:for-each select="content[@format='html' and text() != '']">
				<snippet type="Multi_Line">
					<contents>
						<xsl:call-template name="content"/>
					</contents>
				</snippet>
			</xsl:for-each>
		</section>
		<tag_assign tag_id="Tag_1" />
	</topic>
</xsl:template>

<xsl:template match="campaign/wiki/page">
	<!-- Convert OB wiki page into the appropriate RW topic -->
	<topic category_id="cat_wiki" xmlns="urn:lonewolfdevel.com:realm-works-export">
		<xsl:attribute name="topic_id">wikipage-<xsl:number value="position()"/></xsl:attribute>
		<xsl:attribute name="public_name">
			<xsl:value-of select="title"/>
		</xsl:attribute>
		<section partition_id="p_wiki_public">
			<xsl:for-each select="content[@format='html' and text() != '']">
				<snippet type="Multi_Line">
					<contents>
						<xsl:call-template name="content"/>
					</contents>
				</snippet>
			</xsl:for-each>
		</section>
		<tag_assign tag_id="Tag_1" />
	</topic>
</xsl:template>

<xsl:template match="campaign/characters/character">
	<!-- Convert OB character into the appropriate RW topic -->
	<topic category_id="cat_person" xmlns="urn:lonewolfdevel.com:realm-works-export">
		<xsl:attribute name="topic_id">character-<xsl:number value="position()"/></xsl:attribute>
		<xsl:attribute name="public_name">
			<xsl:value-of select="title"/>
		</xsl:attribute>
		<section partition_id="p_person_public">
			<xsl:for-each select="content[@format='html' and text() != '']">
				<snippet type="Multi_Line">
					<contents>
						<xsl:call-template name="content"/>
					</contents>
				</snippet>
			</xsl:for-each>
		</section>
		<tag_assign tag_id="Tag_1"/>
	</topic>
</xsl:template>

<xsl:template match="campaign/items/item">
	<!-- Convert OB item into the appropriate RW topic -->
	<topic category_id="cat_item" xmlns="urn:lonewolfdevel.com:realm-works-export">
		<xsl:attribute name="topic_id">item-<xsl:number value="position()"/></xsl:attribute>
		<xsl:attribute name="public_name">
			<xsl:value-of select="title"/>
		</xsl:attribute>
		<section partition_id="p_item_public">
			<snippet type="Multi_Line">
				<contents>
					<xsl:value-of select="category"/>
				</contents>
			</snippet>
		</section>
		
		<section partition_id="p_item_public">
			<xsl:for-each select="content[@format='html' and text() != '']">
				<snippet type="Multi_Line">
					<contents>
						<xsl:call-template name="content"/>
					</contents>
				</snippet>
			</xsl:for-each>
		</section>
		<tag_assign tag_id="Tag_1" />
	</topic>
</xsl:template>

<xsl:template match="campaign/forum/topic">
	<!-- Convert OB forum thread into the appropriate RW topic -->
	<topic category_id="cat_forum" xmlns="urn:lonewolfdevel.com:realm-works-export">
		<xsl:attribute name="topic_id">forum-<xsl:number value="position()"/></xsl:attribute>
		<xsl:attribute name="public_name">
			<xsl:value-of select="title"/>
		</xsl:attribute>

		<xsl:for-each select="post">
			<xsl:sort select="position()" data-type="number" order="descending"/>
			<xsl:variable name="published"><xsl:value-of select="published"/></xsl:variable>
			<section>
				<xsl:attribute name="name">
					<xsl:value-of select="author"/> on <xsl:value-of select="substring($published,1,10)"/> at <xsl:value-of select="substring($published,12,8)"/>
				</xsl:attribute>
				<!-- RW reports that gregorian field is missing from game_date, even though it is present!
				<snippet type="Date_Game">
					<xsl:attribute name="label"><xsl:value-of select="author"/></xsl:attribute>
					<game_date>
						<xsl:attribute name="gregorian">
							<xsl:value-of select="substring($published,1,10)"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="substring($published,12,8)"/>
						</xsl:attribute>
					</game_date>
				</snippet> -->
				<xsl:for-each select="content[@format='html' and text() != '']">
					<snippet type="Multi_Line">
						<contents>
							<xsl:call-template name="content"/>
						</contents>
					</snippet>
				</xsl:for-each>
			</section>
		</xsl:for-each>
		<tag_assign tag_id="Tag_1"/>
	</topic>
</xsl:template>

</xsl:stylesheet>