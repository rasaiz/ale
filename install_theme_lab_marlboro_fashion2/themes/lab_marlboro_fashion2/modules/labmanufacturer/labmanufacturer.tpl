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
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<!-- Block manufacturers module -->
<div id="lablogo" class="manufacturer-logo laberthemes">
	<div class="title_block">
		<h4>
			<span>{l s='Manufacturers' mod='blockmanufacturer'}</span>
		</h4>
	</div>
	<div class="listmanufacturer">
{if $manufacturers}
	<div class="lab-manufacturer-logo wow fadeInUp " data-wow-delay="200ms">
	{foreach from=$manufacturers item=manufacturer name=myLoop}
		{if $smarty.foreach.myLoop.iteration <= $text_list_nb}
		
			{if $smarty.foreach.myLoop.index % 1 == 0 || $smarty.foreach.myLoop.first }
				<div class="item-inner">
			{/if}
					<div class="item-i {if $smarty.foreach.manufacturer_list.last}last_item{elseif $smarty.foreach.manufacturer_list.first}first_item{/if}">
						<a href="{$link->getmanufacturerLink($manufacturer.id_manufacturer, $manufacturer.link_rewrite)|escape:'html'}" title="{l s='More about %s' sprintf=[$manufacturer.name] mod='blockmanufacturer'}">
							<img src="{$img_manu_dir}{$manufacturer.image|escape:'html':'UTF-8'}.jpg" alt="{$manufacturer.name|escape:'html':'UTF-8'}" />
						</a>
					</div>
			{if $smarty.foreach.myLoop.iteration % 1 == 0 || $smarty.foreach.myLoop.last  }
				</div>
			{/if}
		{/if}
	{/foreach}
	</div>
	<!-- <div class="labnextprev">
		<a class="prevmanu"><i class="icon-angle-left"></i></a>
		<a class="nextmanu"><i class="icon-angle-right"></i></a>
		
	</div> -->
{else}
	<p>{l s='No manufacturer' mod='blockmanufacturer'}</p>
{/if}
	</div>
</div>
{foreach from=$languages key=k item=language name="languages"}
	{if $language.iso_code == $lang_iso}
		{assign var='rtl' value=$language.is_rtl}
	{/if}
{/foreach}	
<script>
    $(document).ready(function() {
    var owl = $(".lab-manufacturer-logo");
	owl.owlCarousel({
		autoPlay : true,
		slideSpeed : 2000,
		paginationSpeed : 2000,
		rewindSpeed : 2000,
		items :5,
		itemsDesktop : [1199,4],
		itemsDesktopSmall : [991,3],
		itemsTablet: [767,3],
		itemsMobile : [480,1],
	});
		$(".nextmanu").click(function(){
		owl.trigger('owl.next');
		})
		$(".prevmanu").click(function(){
		owl.trigger('owl.prev');
		})   
    });
</script>
<!-- /Block manufacturers module -->
