{**
* 2007-2015 PrestaShop
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
*  @author    PrestaShop SA <contact@prestashop.com>
*  @copyright 2007-2015 PrestaShop SA
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
{foreach from=$group_cat_result item=group_cat name=group_cat_result}
	{assign var='id' value=$group_cat.id_labgroupcategory}
	{assign var='show_sub' value=$group_cat.show_sub}
	{assign var='use_slider' value=$group_cat.use_slider}
	{assign var='type_display' value=$group_cat.type_display}

{/foreach}
{$number_line = 1}
{$id_lang = Context::getContext()->language->id}
{foreach from=$group_cat_result item=group_cat name=group_cat_result}
{if $group_cat.use_slider !=1}
	{assign var='nbItemsPerLine' value=4}
	{assign var='nbItemsPerLineTablet' value=3}
	{assign var='nbItemsPerLineMobile' value=2}
{/if}
{if $group_cat.id_labgroupcategory == $id}
<div class="type-tab lablistproducts laberthemes clearfix ">
	<p class="group_cat">{$group_cat.group_cat}</p>
<div class="lab_tab">	
	<ul id="lab-prod-cat-tabs" class="nav nav-tabs clearfix">
		{foreach from=$group_cat_info item=cat_info name=g_cat_info}
			
			<li class="{if $smarty.foreach.g_cat_info.first} active{/if}"><a data-toggle="tab" href="#labProdCat-{$id}{$smarty.foreach.g_cat_info.index|intval}" class="tab_li">
				{if $cat_info.cat_icon !=''}
				<div class="icon_cat">
					<img src="{$icon_path|escape:'html':'UTF-8'}{$cat_info.cat_icon|escape:'html':'UTF-8'}" alt=""/>
				</div>
				{/if}
				 {$cat_info.cat_name|escape:'html':'UTF-8'}</a>
			</li>
		{/foreach}
	</ul>
</div>
<div class="tab-content">
	{foreach from=$group_cat_info item=cat_info name=g_cat_info}
	<div id="labProdCat-{$id}{$smarty.foreach.g_cat_info.index|intval}" class="tab-pane {if $smarty.foreach.g_cat_info.first} active{/if}">
		{if $cat_info.show_img == 1 && isset($cat_info.id_image) && $cat_info.id_image > 0}
		<div class="cat-img">
			<a href="{$link->getCategoryLink($cat_info.id_cat, $cat_info.link_rewrite)|escape:'html':'UTF-8'}" title="{$cat_info.cat_name|escape:'html':'UTF-8'}">
				<img src="{$link->getCatImageLink($cat_info.link_rewrite, $cat_info.id_image, 'medium_default')|escape:'html':'UTF-8'}"/>
			</a>
		</div>
		{/if}
		{if $show_sub}
		<div class="sub-cat">
			<ul class="sub-cat-ul">
				{foreach from = $cat_info.sub_cat item=sub_cat name=sub_cat_info}
					<li><a href="{$link->getCategoryLink($sub_cat.id_category, $sub_cat.link_rewrite)|escape:'html':'UTF-8'}" title="{$sub_cat.name|escape:'html':'UTF-8'}">{$sub_cat.name|escape:'html':'UTF-8'}</a></li>
				{/foreach}
			</ul>
		</div>
		{/if}
		{if $cat_info.cat_banner !=''}
		<div class="cat-banner">
			{if $cat_info.cat_banner!='' }
				<a href="{$link->getCategoryLink($cat_info.id_cat, $cat_info.link_rewrite)|escape:'html':'UTF-8'}" title="{$cat_info.cat_name|escape:'html':'UTF-8'}">
				<img src="{$banner_path|escape:'html':'UTF-8'}{$cat_info.cat_banner|escape:'html':'UTF-8'}" alt=""/>
				</a>
			{/if}
		</div>
		{/if}
		<div class="product_list">
			<div class="productCate-{$type_display|escape:'html':'UTF-8'}-{$id}{$smarty.foreach.g_cat_info.iteration}{$cat_info.id_cat|intval} {if $use_slider != 1}row{/if}">
				{if isset($cat_info.product_list) && count($cat_info.product_list) > 0}
				{foreach from=$cat_info.product_list item=product name=product_list}
					{if $use_slider != 1}
						
						<div class="item-inner col-lg-3 col-md-3 col-sm-4 col-xs-12  
						{if $smarty.foreach.product_list.iteration % $nbItemsPerLine == 0} last-in-line
						{elseif $smarty.foreach.product_list.iteration % $nbItemsPerLine == 1} first-in-line{/if}
						
						{if $smarty.foreach.product_list.iteration % $nbItemsPerLineTablet == 0} last-item-of-tablet-line
						{elseif $smarty.foreach.product_list.iteration % $nbItemsPerLineTablet == 1} first-item-of-tablet-line{/if}
						
						{if $smarty.foreach.product_list.iteration % $nbItemsPerLineMobile == 0} last-item-of-mobile-line
						{elseif $smarty.foreach.product_list.iteration % $nbItemsPerLineMobile == 1} first-item-of-mobile-line{/if}
						
						">
					{else}
							{if $smarty.foreach.product_list.iteration % $number_line == 1 || $number_line == 1}
							<div class="item-inner  ajax_block_product">
							{/if}
						{/if}
							<div class="item">
								<div class="left-block">
									<div class="product-image-container">
										{capture name='rotatorImg'}{hook h='rotatorImg' product=$product}{/capture}
										{if $smarty.capture.rotatorImg}
											{$smarty.capture.rotatorImg}
										{else}
											<a class = "product_image" href="{$product.link|escape:'html'}" title="{$product.name|escape:html:'UTF-8'}">
												<img class="img-responsive" src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'large_default')|escape:'html'}" alt="{$product.name|escape:html:'UTF-8'}" />							
											</a>
										{/if}
										
										{if isset($product.new) && $product.new == 1}
											<span class="new-label">{l s='New' mod='labproductcategory'}</span>
										{/if}
										{if isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction) && $product.specific_prices.reduction > 0}
											<span class="sale-label">{l s='Sale' mod='labproductcategory'}</span>
										{/if}
										
										<div class="actions">
											<ul class="add-to-links">	
												{if $lab_EnableW == 1}
												<li class="lab-Wishlist">
													<a onclick="WishlistCart('wishlist_block_list', 'add', '{$product.id_product|intval}', $('#idCombination').val(), 1,'tabproduct'); return false;" class="add-wishlist wishlist_button" href="#"
													data-id-product="{$product.id_product|intval}"
													title="{l s='Add to Wishlist' mod='labproductcategory'}">
													<i class="icons-heart"></i></a>
												</li>
												{/if}
												
												
												{if $lab_EnableC == 1}
													{if isset($comparator_max_item) && $comparator_max_item}
														<li class="lab-compare">	
															<a class="add_to_compare" 
																href="{$product.link|escape:'html':'UTF-8'}" 
																data-product-name="{$product.name|escape:'htmlall':'UTF-8'}"
																data-product-cover="{$link->getImageLink($product.link_rewrite, $product.id_image, 'cart_default')|escape:'html'}"
																data-id-product="{$product.id_product}"
																title="{l s='Add to Compare' mod='labproductcategory'}">
																<i class="icons-shuffle"></i>
															</a>
														</li>
													{/if}
												{/if}
												{if $lab_EnableQv == 1}
													<li class="lab-quick-view">
														<a class="quick-view" href="{$product.link|escape:'html':'UTF-8'}"
															data-id-product="{$product.id_product|intval}"
															title="{l s='Quick view' mod='labproductcategory'}">
															<i class="icons-magnifier-add"></i>
														</a>
													</li>
												{/if}
											</ul>
											
										</div>
									</div>
								</div>
								<div class="right-block">
									<h5 class="product-name"><a href="{$product.link|escape:'html':'UTF-8'}" title="{$product.legend|escape:html:'UTF-8'}">{$product.name|escape:'html':'UTF-8'}</a></h5>
									
									{if (!$PS_CATALOG_MODE && ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
										<div class="content_price" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
											{if isset($product.show_price) && $product.show_price && !isset($restricted_country_mode)}
												<span itemprop="price" class="price product-price">
													{if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}
												</span>
												<meta itemprop="priceCurrency" content="{$currency->iso_code|escape:'html':'UTF-8'}" />
												{if isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction) && $product.specific_prices.reduction > 0}
													{hook h="displayProductPriceBlock" product=$product type="old_price"}
													<span class="old-price product-price">
														{displayWtPrice p=$product.price_without_reduction}
													</span>
													<!-- {if $product.specific_prices.reduction_type == 'percentage'}
														<span class="price-percent-reduction">-{$product.specific_prices.reduction|escape:'html':'UTF-8' * 100}%</span>
													{/if} -->
												{/if}
												{hook h="displayProductPriceBlock" product=$product type="price"}
												{hook h="displayProductPriceBlock" product=$product type="unit_price"}
											{/if}
										</div>
									{/if}
									{capture name='displayProductListReviews'}{hook h='displayProductListReviews' product=$product}{/capture}
									{if $smarty.capture.displayProductListReviews}
										<div class="hook-reviews">
										{hook h='displayProductListReviews' product=$product}
										</div>
									{/if}
									<div class="lab-cart">
											{if ($product.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $product.available_for_order && !isset($restricted_country_mode) && $product.minimal_quantity <= 1 && $product.customizable != 2 && !$PS_CATALOG_MODE}
												{if ($product.allow_oosp || $product.quantity > 0)}
													{if isset($static_token)}
														<a class="button ajax_add_to_cart_button btn btn-default" href="{$link->getPageLink('cart',false, NULL, "add=1&amp;id_product={$product.id_product|intval}&amp;token={$static_token}", false)|escape:'html':'UTF-8'}"
														data-id-product="{$product.id_product|intval}"
														title="{l s='Add to cart' mod='labproductcategory'}" >
															<i class="icons-handbag"></i>
															<span>{l s='Add to cart' mod='labproductcategory'}</span>
														</a>
													{else}
														<a class="button ajax_add_to_cart_button btn btn-default" href="{$link->getPageLink('cart',false, NULL, "add=1&amp;id_product={$product.id_product|intval}&amp;token={$static_token}", false)|escape:'html':'UTF-8'}"
														data-id-product="{$product.id_product|intval}"
														title="{l s='Add to cart' mod='labproductcategory'}">
															<i class="icons-handbag"></i>
															<span>{l s='Add to cart' mod='labproductcategory'}</span>
														</a>
													{/if}						
												{else}
													<span class="button ajax_add_to_cart_button btn btn-default disabled">
														<i class="icons-handbag"></i>
														<span>{l s='Add to cart' mod='labproductcategory'}</span>
													</span>
												{/if}
											{/if}
										</div>
								</div>
							</div>
					{if $use_slider != 1}
						</div>
					{else}
						{if $smarty.foreach.product_list.iteration % $number_line == 0 ||$smarty.foreach.product_list.last || $number_line == 1}
						</div>
						{/if}
					{/if}
				{/foreach}
				{else}
					<div class="item product-box ajax_block_product">
						<p class="alert alert-warning">{l s='No product at this time' mod='labproductcategory'}</p>
					</div>
				{/if}
			</div>
			{if count($cat_info.manufacture)>0}
			<div class="manu-list">
				<ul>
					{foreach from=$cat_info.manufacture item=manu_item name=manufacture}
						<li><a href="#">{$manu_item->name|escape:'html':'UTF-8'}</a></li>
					{/foreach}
				</ul>
			</div>
			{/if}
			{if $use_slider == 1}
			
			<div class="lab_boxnp">
				<a class="prev prev{$type_display|escape:'html':'UTF-8'}{$id}{$smarty.foreach.g_cat_info.iteration}{$cat_info.id_cat|intval}"><i class="icon icon-angle-left"></i></a>
				<a class="next next{$type_display|escape:'html':'UTF-8'}{$id}{$smarty.foreach.g_cat_info.iteration}{$cat_info.id_cat|intval}"><i class="icon icon-angle-right"></i></a>
			</div> 
			{/if}
			
		</div>
		{if $use_slider == 1}
			<script type="text/javascript">
				$(document).ready(function() {
					var owl = $(".productCate-{$type_display|escape:'html':'UTF-8'}-{$id}{$smarty.foreach.g_cat_info.iteration}{$cat_info.id_cat|intval}");
					owl.owlCarousel({
						items : 4,
						itemsDesktop : [1199,3],
						itemsDesktopSmall : [991,3],
						itemsTablet: [767,2],
						itemsMobile : [480,1],
						autoPlay :  false,
						stopOnHover: false,
						pagination : false,
						addClassActive : true,
					});
					$(".next{$type_display|escape:'html':'UTF-8'}{$id}{$smarty.foreach.g_cat_info.iteration}{$cat_info.id_cat|intval}").click(function(){
					owl.trigger('owl.next');
					})
					$(".prev{$type_display|escape:'html':'UTF-8'}{$id}{$smarty.foreach.g_cat_info.iteration}{$cat_info.id_cat|intval}").click(function(){
					owl.trigger('owl.prev');
					})  
				});
			</script>
		{/if}
	</div>
{/foreach}
</div>
</div>
{/if}
{/foreach}