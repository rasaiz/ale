<div class="labpopupnewsletter" style="{if $lab_array.LAB_WIDTH}width:{$lab_array.LAB_WIDTH}px;{/if}{if $lab_array.LAB_HEIGHT}height:{$lab_array.LAB_HEIGHT}px;{/if}{if $lab_array.LAB_BG == 1}background-image: url({$link->getMediaLink("`$module_dir`$popup_bg")});{/if}">
	{if $lab_array.LAB_NEWSLETTER == 1}
	<div id="newsletter_block_popup" class="block">
		<div class="block_content">
		{if isset($msg) && $msg}
			<p class="{if $nw_error}warning_inline{else}success_inline{/if}">{$msg}</p>
		{/if}
			<form action="{$link->getPageLink('index')|escape:'html'}" method="post">
                            {if $lab_array.LAB_TITLE != ""}<div class="popup_title"><h2>{$lab_array.LAB_TITLE}</h2></div>{/if}
                            {if $lab_array.LAB_TEXT != ""}<div class="popup_text">{$lab_array.LAB_TEXT}</div>{/if}
                            <div class="send-response"></div>
                            <input class="inputNew" id="newsletter-input-popup" type="text" name="email" value="{l s='YOUR E-MAIL' mod='labpopupnewsletter'}" />
                            <div class="send-reqest button_unique main_color_hover">{l s='Subscribe' mod='labpopupnewsletter'}</div>
			</form>
		</div>
                <div class="newsletter_block_popup-bottom">
                    <input id="newsletter_popup_dont_show_again" type="checkbox">
                    <label for="newsletter_popup_dont_show_again">{l s='Don\'t show this popup again' mod='labpopupnewsletter'}</label>
                </div>
	</div>
	{/if}
</div>
{if $lab_array.LAB_NEWSLETTER == 1}
<script type="text/javascript">
    var placeholder2 = "{l s='YOUR E-MAIL' mod='labpopupnewsletter' js=1}";
    {literal}
        $(document).ready(function() {
            $('#newsletter_block_popup').on({
                focus: function() {
                    if ($(this).val() == placeholder2) {
                        $(this).val('');
                    }
                },
                blur: function() {
                    if ($(this).val() == '') {
                        $(this).val(placeholder2);
                    }
                }
            });
        });
    {/literal}
</script>
{/if}
{strip}
{addJsDef lab_width=$lab_array.LAB_WIDTH}
{addJsDef lab_height=$lab_array.LAB_HEIGHT}
{addJsDef lab_newsletter=$lab_array.LAB_NEWSLETTER}
{addJsDef lab_bg=$lab_array.LAB_BG}
{addJsDef lab_path=$lab_array.LAB_PATH}
{/strip}