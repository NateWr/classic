{**
 * plugins/generic/htmlArticleGalley/display.tpl
 *
 * Copyright (c) 2014-2019 Simon Fraser University
 * Copyright (c) 2003-2019 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Embedded viewing of a HTML galley.
 * @uses $boolEmbeddedCss bool is true if HTML galley has attached CSS file
 *}

<!DOCTYPE html>
<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
{capture assign="pageTitleTranslated"}{translate key="article.pageTitle" title=$galleyPublication->getLocalizedTitle()|escape}{/capture}
{include file="frontend/components/headerHead.tpl"}
<body class="pkp_page_{$requestedPage|escape} pkp_op_{$requestedOp|escape}">

{* Header wrapper *}
<header class="header_view">

	<a href="{url page="article" op="view" path=$article->getBestId()}" class="return">
		<span class="pkp_screen_reader">
			{translate key="article.return"}
		</span>
	</a>
	{if !$isLatestPublication}
	<div class="cmp_notification notice" role="alert">
		{translate key="submission.outdatedVersion"
			datePublished=$galleyPublication->getData('datePublished')|date_format:$dateFormatLong
			urlRecentVersion=$parentUrl
		}
	</div>
	{else}
	<a href="{url page="article" op="view" path=$article->getBestId()}" class="title">
		{$galleyPublication->getLocalizedTitle()|escape}
	</a>
	{/if}

</header>

<div id="htmlContainer" class="galley_view" style="overflow:visible;-webkit-overflow-scrolling:touch">
	<iframe id="htmlGalleyFrame" name="htmlFrame" src="{url page="article" op="download" path=$article->getBestId()|to_array:$galley->getBestGalleyId() inline=true}" allowfullscreen webkitallowfullscreen></iframe>
</div>
{call_hook name="Templates::Common::Footer::PageFooter"}

</body>
</html>
