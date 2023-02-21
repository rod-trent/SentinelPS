//This PowerShell script retrieves the What's New page from Docs and converts it to Markdown so it can be imported into a Microsoft Sentinel Workbook.


# Install MarkdownPrince module if not already installed
Install-Module -Name MarkdownPrince -AllowClobber -Force

$Webcontent = Invoke-WebRequest -Uri 'https://learn.microsoft.com/en-us/azure/sentinel/whats-new'
$Webcontent.Content | Out-File -FilePath C:\Scripts\WhatsNew.html

$RulesBefore = @(
    '(?ms)<div id="logo" class="clearfix">(.*?)<\/div>'
    '(?ms)<a class="pTitle clearfix" href="https://learn.microsoft.com/en-us/azure/sentinel/whats-new">(.*?)<\/a>'
    '(?ms)<ul class="meta">(.*?)<\/ul>'
    '(?ms)<title>(.*?)<\/title>'
    '(?ms)<div class="left clearfix">(.*?)<\/div>'
    '(?ms)<div class="right clearfix">(.*?)<\/div>'
    '(?ms)<div id="icl_lang_sel_widget-3" class="widget sidebox widget_icl_lang_sel_widget">(.*?)<\/div>'
    '(?ms)<div id="pageTitle" class="clearfix">(.*?)<\/div>'
    '(?ms)<nav id="menu" class="cartfalse">(.*?)<\/nav>'
    '(?ms)<nav id="breadcrumb" itemprop="breadcrumb">(.*?)<\/nav>'
    '(?ms)<div class="wpml-ls-statics-footer wpml-ls wpml-ls-legacy-list-horizontal">(.*?)<\/div>'
    '(?ms)<div id="oldie">(.*?)<\/div>'
    '(?ms)<footer id="footer1" class="clearfix">(.*?)<\/footer>'
    '(?ms)<footer id="footer2" class="clearfix">(.*?)<\/footer>'
    '(?ms)<pre class="hidden">(.*?)</pre>'
    # remove tags
    '(?ms)<span class="meta-holder">(.*)<\/span>'
    # we shouldn't have to play with script at all but seems to be a bug in reversemarkdown library
    "(?ms)<script type='text/javascript' id='wp-util-js-extra'>(.*)<\/script>"
    '(?ms)<script id="wp-util-js-extra">(.*)<\/script>'
)
$RulesAfter = @(
    '<br>'
)

$Splat = @{
    #Content                  = $BlogContent.Content
    Path                     = "C:\Scripts\WhatsNew.html"
    DestinationPath          = "C:\Scripts\WhatsNew.md"
    UnknownTags              = 'Bypass'
    GithubFlavored           = $true
    RemoveComments           = $true
    SmartHrefHandling        = $true
    RulesBefore              = $RulesBefore
    RulesAfter               = $RulesAfter
    DefaultCodeBlockLanguage = 'powershell'
    Format                   = $false
}
ConvertFrom-HTMLToMarkdown @Splat
