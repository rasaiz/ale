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
		<div id="htmlcaption{$slide.id_slide}" class=" nivo-html-caption nivo-caption">
			<div class="timeline" style=" 
								position:absolute;
								top:0;
								left:0;
								background-color: rgba(49, 56, 72, 0.298);
								height:5px;
								-webkit-animation: myfirst {$labslideshow.LAB_PAUSE}ms ease-in-out;
								-moz-animation: myfirst {$labslideshow.LAB_PAUSE}ms ease-in-out;
								-ms-animation: myfirst {$labslideshow.LAB_PAUSE}ms ease-in-out;
								animation: myfirst {$labslideshow.LAB_PAUSE}ms ease-in-out;
							
							">
			</div>
			<div class="lab_description {$slide.margin}">
			{if $labslideshow.LAB_TITLE =='true'}
			<div class="title animated a1">
				{$slide.title}
			</div>
			{/if}
			<div class="description animated a2">
				{$slide.description}
			</div>
			{if $slide.url}
			<div class="readmore animated a3">
				<a href="{$slide.url}">{l s='Readmore' mod='labslideshow_slides'}</a>
			</div>
			{/if}
			</div>
		</div>
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
			prevText: '<i class="icon-double-angle-left"></i>',
			nextText: '<i class="icon-double-angle-right"></i>',
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
    });
    </script>
    {/if}
    <!-- /Module labslideshow -->
{/if}