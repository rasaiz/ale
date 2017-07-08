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

{$number_line = 2}
{foreach from=$group_cat_result item=group_cat name=group_cat_result}
	{assign var='id' value=$group_cat.id_labgroupcategory}
	{assign var='show_sub' value=$group_cat.show_sub}
	{assign var='use_slider' value=$group_cat.use_slider}
	{assign var='type_display' value=$group_cat.type_display}
{/foreach}
{$id_lang = Context::getContext()->language->id}
	<div class="block-content  type-colum">
		{foreach from=$group_cat_info item=cat_info name=g_cat_info}
		<div class="lab-prod-cat-{$cat_info.id_cat|intval} lab{$group_cat.type_display}  col-lg-4 col-md-4 col-sm-4 col-xs-12">
			<div class="cat-bar">
			  <div class="out-lab-prod">
				{if $cat_info.cat_icon!='' }
					<div class="icon_cat" style="background-color:{$cat_info.cat_color|escape:'html':'UTF-8'}">
					   <img src="{$icon_path|escape:'html':'UTF-8'}{$cat_info.cat_icon|escape:'html':'UTF-8'}" alt=""/>
					</div>
				{/if}
			    
				<p class="title_block"><a href="{$link->getCategoryLink($cat_info.id_cat, $cat_info.link_rewrite)|escape:'html':'UTF-8'}" title="{$cat_info.cat_name|escape:'html':'UTF-8'}"><span>{$cat_info.cat_name|escape:'html':'UTF-8'}</span></a></p>
			  </div>
			</div>
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
			{if $cat_info.cat_banner!='' }
			<div class="cat-banner">
				<a href="{$link->getCategoryLink($cat_info.id_cat, $cat_info.link_rewrite)|escape:'html':'UTF-8'}" title="{$cat_info.cat_name|escape:'html':'UTF-8'}">
					<img src="{$banner_path|escape:'html':'UTF-8'}{$cat_info.cat_banner|escape:'html':'UTF-8'}" alt=""/>
				</a>
			</div>
			{/if}
			<div class="product_list">
				<div class="productCate-{$type_display|escape:'html':'UTF-8'}-{$cat_info.id_cat|intval}{$smarty.foreach.g_cat_info.iteration}{$id}">
					{if isset($cat_info.product_list) && count($cat_info.product_list) > 0}
					{foreach from=$cat_info.product_list item=product name=product_list}
						{if $smarty.foreach.product_list.iteration % $number_line == 1 || $number_line == 1}
						<div class="item-inner ajax_block_product">
						{/if}
							<div class="item">
								<div class="product-container media-body">
									<div class="left-block pull-left">
										<a class="product_image" href="{$product.link|escape:'html':'UTF-8'}" title="{$product.legend|escape:html:'UTF-8'}"><img src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'medium_default')|escape:'html':'UTF-8'}" alt="{$product.legend|escape:html:'UTF-8'}" /></a>
										{if $lab_EnableQv == 1}
											<a class="quick-view" href="{$product.link|escape:'html':'UTF-8'}"
												data-id-product="{$product.id_product|intval}"
												title="{l s='Quick view' mod='labproductcategory'}">
												<i class="pe-7s-search"></i>
											</a>
										{/if}
									</div>
									<div class="right-block media-body">
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
										<div class="actions">
											<ul class="add-to-links">	
												<li class="lab-cart">
													{if ($product.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $product.available_for_order && !isset($restricted_country_mode) && $product.minimal_quantity <= 1 && $product.customizable != 2 && !$PS_CATALOG_MODE}
														{if ($product.allow_oosp || $product.quantity > 0)}
															{if isset($static_token)}
																<a class="button ajax_add_to_cart_button btn btn-default" href="{$link->getPageLink('cart',false, NULL, "add=1&amp;id_product={$product.id_product|intval}&amp;token={$static_token}", false)|escape:'html':'UTF-8'}"
																data-id-product="{$product.id_product|intval}"
																title="{l s='Add to cart' mod='labproductcategory'}" >
																	<i class="pe-7s-cart"></i>
																	
																</a>
															{else}
																<a class="button ajax_add_to_cart_button btn btn-default" href="{$link->getPageLink('cart',false, NULL, "add=1&amp;id_product={$product.id_product|intval}&amp;token={$static_token}", false)|escape:'html':'UTF-8'}"
																data-id-product="{$product.id_product|intval}"
																title="{l s='Add to cart' mod='labproductcategory'}">
																	<i class="pe-7s-cart"></i>
																	
																</a>
															{/if}						
														{else}
															<span class="button ajax_add_to_cart_button btn btn-default disabled">
																<i class="pe-7s-cart"></i>
																
															</span>
														{/if}
													{/if}
												</li>
												{if $lab_EnableW == 1}
												<li class="lab-Wishlist">
													<a onclick="WishlistCart('wishlist_block_list', 'add', '{$product.id_product|intval}', $('#idCombination').val(), 1,'tabproduct'); return false;" class="add-wishlist wishlist_button" href="#"
													data-id-product="{$product.id_product|intval}"
													title="{l s='Add to Wishlist' mod='labproductcategory'}">
													<i class="pe-7s-like"></i></a>
												</li>
												{/if}
											</ul>
											
										</div>
									</div>
									
								</div>
							</div>
						{if $smarty.foreach.product_list.iteration % $number_line == 0 || $smarty.foreach.product_list.last || $number_line == 1}
						</div>
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
				<div class="lab_boxnp2">
					<a class="prev{$type_display|escape:'html':'UTF-8'}{$cat_info.id_cat|intval}{$smarty.foreach.g_cat_info.iteration}{$id}"><i class="pe-7s-angle-left"></i></a>
					<a class="next{$type_display|escape:'html':'UTF-8'}{$cat_info.id_cat|intval}{$smarty.foreach.g_cat_info.iteration}{$id}"><i class="pe-7s-angle-right"></i></a>
				</div> 
				{/if}
			</div>
			{if $use_slider == 1}
			<script type="text/javascript">
				$(document).ready(function() {
					var owl = $(".productCate-{$type_display|escape:'html':'UTF-8'}-{$cat_info.id_cat|intval}{$smarty.foreach.g_cat_info.iteration}{$id}");
					owl.owlCarousel({
						items : 1,
						itemsDesktop : [1199,1],
						itemsDesktopSmall : [991,1],
						itemsTablet: [767,1],
						itemsMobile : [480,1],
						autoPlay :  false,
						stopOnHover: false,
						pagination : false,
					});
					$(".next{$type_display|escape:'html':'UTF-8'}{$cat_info.id_cat|intval}{$smarty.foreach.g_cat_info.iteration}{$id}").click(function(){
					owl.trigger('owl.next');
					})
					$(".prev{$type_display|escape:'html':'UTF-8'}{$cat_info.id_cat|intval}{$smarty.foreach.g_cat_info.iteration}{$id}").click(function(){
					owl.trigger('owl.prev');
					})  
				});
			</script>
			{/if}
		</div>
		{/foreach}
	</div>