{*
* 2007-2014 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2014 PrestaShop SA
*  @version  Release: $Revision$
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*} 
{if $page_name =='index'}
    <!-- Module labslideshow -->
    {if isset($labslideshow_slides)}
	<div class="lab-nivoSlideshow">
		<div class="lab-loading"></div>
        <div id="lab-slideshow" class="slides">
                {foreach from=$labslideshow_slides item=slide}
                    {if $slide.active}
                                <img 
									data-thumb="{$link->getMediaLink("`$smarty.const._MODULE_DIR_`labslideshow/images/`$slide.image|escape:'htmlall':'UTF-8'`")}"  
									src="{$link->getMediaLink("`$smarty.const._MODULE_DIR_`labslideshow/images/`$slide.image|escape:'htmlall':'UTF-8'`")}"
                                     alt="{$slide.legend|escape:'htmlall':'UTF-8'}"
									 title="#htmlcaption{$slide.id_slide}" />
                    {/if}
                {/foreach}
        </div>
		
		{foreach from=$labslideshow_slides item=slide}
        {if $slide.active}
			{if $labslideshow.LAB_TITLE =='true'}
				<div id="htmlcaption{$slide.id_slide}" class=" nivo-html-caption nivo-caption">
					<div class="lab_description active {$slide.margin} {$slide.style}">
					
					
					<div class="title">
						<h4>{$slide.title|escape:'html':'UTF-8'}</h4>
					</div>
					{if $slide.legend}
					<!-- <div class="lab_caption">
						{$slide.legend|escape:'html':'UTF-8'}
					</div>
					{/if} -->
					{if $slide.description}
					<div class="description">
						{$slide.description}
					</div>
					{/if}
					{if $slide.url}
					<div class="readmore">
						<a href="{$slide.url}">{l s='Show Now' mod='labslideshow'}</a>
					</div>
					{/if}
					</div>
				</div>
			{/if}
		{/if}
        {/foreach}
	</div>
	<!-- {var_dump($labslideshow)} -->
<script type="text/javascript">
    $(window).load(function() {
		$(document).off('mouseenter').on('mouseenter', '.lab-nivoSlideshow', function(e){
			$('.lab-nivoSlideshow .timeline').addClass('lab_hover');
		});

		$(document).off('mouseleave').on('mouseleave', '.lab-nivoSlideshow', function(e){
			$('.lab-nivoSlideshow .timeline').removeClass('lab_hover');
		});
        $('#lab-slideshow').nivoSlider({
			effect: 'random',
			slices: 15,
			boxCols: 8,
			boxRows: 4,
			animSpeed: '{if $labslideshow.LAB_SPEED !=''}{$labslideshow.LAB_SPEED}{else}600{/if}',
			pauseTime: '{if $labslideshow.LAB_PAUSE !=''}{$labslideshow.LAB_PAUSE}{else}5000{/if}',
			startSlide: 0,
			directionNav: {if $labslideshow.LAB_E_N_P =='true'}true{else}false{/if},
			controlNav: {if $labslideshow.LAB_E_CONTROL =='true'} true {else} false {/if},
			controlNavThumbs: false,
			pauseOnHover: true,
			manualAdvance: false,
			prevText: '<i class="icon"></i>',
			nextText: '<i class="icon"></i>',
                        afterLoad: function(){
                         $('.lab-loading').css("display","none");
                        },     
						beforeChange: function(){ 
                            $('.nivo-caption .lab_description').removeClass("active").css("opacity","0");
                        },
                        afterChange: function(){ 
                            $('.nivo-caption .lab_description').addClass("active" ).css("opacity","1");
                        }
 		});
		$(document).ready(function() {
			$(".nivo-caption .title h4").lettering('words');
		});
		
    });
    </script>
	
    {/if}
    <!-- /Module labslideshow -->
{/if}