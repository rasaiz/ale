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
{foreach from=$group_prod_fliter item=product_hook name=product_hook}
	{assign var='id' value=$product_hook.id_labproductfilter}
	{assign var='use_slider' value=$product_hook.use_slider}
{/foreach}
{$number_line = 1}
{$id_lang = Context::getContext()->language->id}
{foreach from = $product_hook.product_group item = product_group name = product_group}
	<div class="{$product_group.class|escape:'html':'UTF-8'}  {$product_hook.type_display} clearfix">
		<!-- <p class="title_block">
			<span>{$product_group.title|escape:'html':'UTF-8'}</span>
		</p> -->
		
	<div class="out-prod-filter">
			{if isset($product_group.product_list) && count($product_group.product_list) > 0}
			<div class="LabProducts">
				<div class="owlProductFilter-{$id}-{$product_group.class|escape:'html':'UTF-8'} {if $use_slider != 1}row{/if}">
				{foreach from=$product_group.product_list item=product name=product_list}
					{if isset($product.id_product)}
						
							{if $smarty.foreach.product_list.iteration % $number_line == 1 || $number_line == 1}
							<div class="item-inner  ajax_block_product">
							{/if}
						
						<div class="item">
							<div class="row">
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="left-block  ">
									<div class="product-image-container">
										{capture name='rotatorImg'}{hook h='rotatorImg' product=$product}{/capture}
										{if $smarty.capture.rotatorImg}
											{$smarty.capture.rotatorImg}
										{else}
											<a class = "product_image" href="{$product.link|escape:'html'}" title="{$product.name|escape:html:'UTF-8'}">
												<img class="img-responsive" src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'large_default')|escape:'html'}" alt="{$product.name|escape:html:'UTF-8'}" />							
											</a>
										{/if}
										
										<!-- {if isset($product.new) && $product.new == 1}
											<span class="new-label">{l s='New' mod='labproductcategory'}</span>
										{/if}
										{if isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction) && $product.specific_prices.reduction > 0}
											<span class="sale-label">{l s='Sale' mod='labproductcategory'}</span>
										{/if} -->
										
										
									</div>
								</div>
								</div>
								
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="right-block  ">
									{if $lab_EnableQv == 1}
										<div class="lab-quick-view">
											<a class="quick-view" href="{$product.link|escape:'html':'UTF-8'}"
												data-id-product="{$product.id_product|intval}"
												title="{l s='Quick view' mod='labproductcategory'}">
												{l s='Quick view' mod='labproductcategory'}
											</a>
										</div>
									{/if}
									<h5 class="product-name"><a href="{$product.link|escape:'html':'UTF-8'}" title="{$product.legend|escape:html:'UTF-8'}">{$product.name|escape:'html':'UTF-8'}</a></h5>
									<div class="description_short">
										{$product.description_short|truncate:100:'...'}
									</div>
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
										<ul class="add-to-links media-body">	
											<li class="lab-cart pull-left">
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
											</li>
											<!-- {if $lab_EnableW == 1}
												<li class="lab-Wishlist pull-left">
													<a onclick="WishlistCart('wishlist_block_list', 'add', '{$product.id_product|intval}', $('#idCombination').val(), 1,'tabproduct'); return false;" class="add-wishlist wishlist_button" href="#"
													data-id-product="{$product.id_product|intval}"
													title="{l s='Add to Wishlist' mod='labproductcategory'}">
													<i class="icons-heart"></i></a>
												</li>
											{/if}
											{if $lab_EnableC == 1}
												{if isset($comparator_max_item) && $comparator_max_item}
													<li class="lab-compare pull-left">	
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
											{/if} -->
											
										</ul>
										
									</div>
									{assign var='prices' value=$product.specific_prices.reduction|escape:'html':'UTF-8' * 100}
									<p class="reduction">
										{l s='( Blaze HR Jasper Save up to' mod='labproductcategory'}
										<span>{l s='%1$d%% off ' mod='labproductcategory' sprintf=[$prices]}</span>
										{l s='on the day )' mod='labproductcategory'}
									</p>
									{if isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction) && $product.specific_prices.reduction > 0}
										<div class="countdown" >
											{hook h='timecountdown' product=$product }  
											<span class="future_date_{$product.id_category_default}_{$product.id_product} id_countdown">  </span>
										</div>
									{/if}
								</div>
								</div>
							</div>
							</div>
						
							{if $smarty.foreach.product_list.iteration % $number_line == 0 ||$smarty.foreach.product_list.last|| $number_line == 1}
							</div>
							{/if}
						
					{/if}
				{/foreach}
			</div>
			{else}
				<div class="item product-box ajax_block_product">
					<p class="alert alert-warning">{l s='No product at this time' mod='labproductfilter'}</p>
				</div>	
			{/if}
			<!-- {if $use_slider == 1}
			<div class="lab_boxnp">
				<a class="prev prev{$product_group.class|escape:'html':'UTF-8'}{$id}"><i class="icon icon-angle-left"></i></a>
				<a class="next next{$product_group.class|escape:'html':'UTF-8'}{$id}"><i class="icon icon-angle-right"></i></a>
			</div> 
			{/if} -->
	  </div>

{if $use_slider == 1}
	<script type="text/javascript">
		$(document).ready(function() {
			var owl = $(".owlProductFilter-{$id}-{$product_group.class|escape:'html':'UTF-8'}");
			owl.owlCarousel({
				items : 1,
				itemsDesktop : [1199,1],
				itemsDesktopSmall : [991,1],
				itemsTablet: [767,1],
				itemsMobile : [480,1],
				autoPlay :  6000,
				slideSpeed : 2000,
				paginationSpeed : 2000,
				rewindSpeed : 2000,
				stopOnHover: false,
				pagination : false,
				addClassActive : true,
			});
			$(".next{$product_group.class|escape:'html':'UTF-8'}{$id}").click(function(){
			owl.trigger('owl.next');
			})
			$(".prev{$product_group.class|escape:'html':'UTF-8'}{$id}").click(function(){
			owl.trigger('owl.prev');
			})  
		});
	</script>
{/if}
</div>
</div>
{/foreach}
