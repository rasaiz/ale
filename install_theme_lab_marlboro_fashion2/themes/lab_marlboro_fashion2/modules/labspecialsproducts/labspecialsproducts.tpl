	{if isset($products) AND $products}
<div id="special_products" class="products_block">
	<!-- <h4 class="title_block">
		
			<span><i class="icon icon-bookmark"></i>{l s='Special' mod='labspecialsproducts'}</span>
	</h4> -->
	<span class="sale"><i class="icon pe-7s-scissors"></i>{l s='Sale' mod='labspecialsproducts'}</span>
	<div class="block_content">
		<div id="pos-special-products" class="product_list3">
			{foreach from=$products item=product name=myLoop}
				{if $smarty.foreach.myLoop.index % 1 == 0 || $smarty.foreach.myLoop.first }
					<div class="item-inner">
					{/if}
						<div class="item">
							<!--<div class="left-block">
								 <div class="product-image-container">
									{if Hook::exec('rotatorImg')}
										{hook h ='rotatorImg' product=$product}
									{else}
										<a class = "product_image" href="{$product.link|escape:'html'}" title="{$product.name|escape:html:'UTF-8'}">
											<img class="img-responsive" src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'home_default')|escape:'html'}" alt="{$product.name|escape:html:'UTF-8'}" />							
										</a>
									{/if}
									{if isset($product.new) && $product.new == 1}
									
										<span class="new-label">{l s='New' mod='labspecialsproducts'}</span>
									
									{/if}
									
									
								</div> 
								
							</div>-->
							
							
							<div class="right-block  col-lg-6 col-md-6 col-sm-9 col-xs-12">
								<h5 class="h5product-name">
									<a class="product-name" href="{$product.link|escape:'html'}" title="{$product.name|truncate:35:'...'|escape:'htmlall':'UTF-8'}">{$product.name|truncate:25:'...'|escape:'htmlall':'UTF-8'}</a></h5>
								
								{if (!$PS_CATALOG_MODE && $PS_STOCK_MANAGEMENT && ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
									{if isset($product.available_for_order) && $product.available_for_order && !isset($restricted_country_mode)}
										<span class="availability">
											{if ($product.allow_oosp || $product.quantity > 0)}
												<span class="{if $product.quantity <= 0 && isset($product.allow_oosp) && !$product.allow_oosp} label-danger{elseif $product.quantity <= 0} label-warning{else} label-success{/if}">
													{if $product.quantity <= 0}{if $product.allow_oosp}{if isset($product.available_later) && $product.available_later}{$product.available_later}{else}{l s='In Stock'}{/if}{else}{l s='Out of stock'}{/if}{else}{if isset($product.available_now) && $product.available_now}{$product.available_now}{else}{l s='In Stock'}{/if}{/if}
												</span>
											{elseif (isset($product.quantity_all_versions) && $product.quantity_all_versions > 0)}
												<span class="label-warning">
													{l s='Product available with different options'}
												</span>
											{else}
												<span class="label-danger">
													{l s='Out of stock'}
												</span>
											{/if}
										</span>
									{/if}
								{/if}	
								
								{if $product.show_price AND !isset($restricted_country_mode) AND !$PS_CATALOG_MODE}
									<div class="lab-price">
										<span class="price">{if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}</span>
										<meta itemprop="priceCurrency" content="{$priceDisplay}" />
										{if isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction) && $product.specific_prices.reduction > 0}
											<span class="old-price product-price">
												{displayWtPrice p=$product.price_without_reduction}
											</span>
										{/if}
										{if $product.specific_prices.reduction_type == 'percentage'}
											<span class="price-percent-reduction">-{$product.specific_prices.reduction|escape:'html':'UTF-8' * 100}%</span>
										{/if} 
									</div>
								{/if}
								<div class="countdown" >
									{hook h='timecountdown' product=$product }  
									<span class="future_date_{$product.id_category_default}_{$product.id_product} id_countdown">  </span>
								</div>
								<!-- <div class="actions">
											<ul class="add-to-links">	
												<li class="lab-cart">
													{if ($product.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $product.available_for_order && !isset($restricted_country_mode) && $product.minimal_quantity <= 1 && $product.customizable != 2 && !$PS_CATALOG_MODE}
														{if ($product.allow_oosp || $product.quantity > 0)}
															{if isset($static_token)}
																<a class="button ajax_add_to_cart_button btn btn-default" href="{$link->getPageLink('cart',false, NULL, "add=1&amp;id_product={$product.id_product|intval}&amp;token={$static_token}", false)|escape:'html':'UTF-8'}"
																data-id-product="{$product.id_product|intval}"
																title="{l s='Add to cart' mod='labspecialsproducts'}" >
																	<i class="pe-7s-cart"></i>
																	
																</a>
															{else}
																<a class="button ajax_add_to_cart_button btn btn-default" href="{$link->getPageLink('cart',false, NULL, "add=1&amp;id_product={$product.id_product|intval}&amp;token={$static_token}", false)|escape:'html':'UTF-8'}"
																data-id-product="{$product.id_product|intval}"
																title="{l s='Add to cart' mod='labspecialsproducts'}">
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
												{if isset($quick_view) && $quick_view}
													<li class="lab-quick-view">
														<a class="quick-view" href="{$product.link|escape:'html':'UTF-8'}"
															data-id-product="{$product.id_product|intval}"
															title="{l s='Quick view' mod='labspecialsproducts'}">
															<i class="pe-7s-search"></i>
														</a>
													</li>
												{/if}
												{if isset($comparator_max_item) && $comparator_max_item}
													<li class="lab-compare">	
														<a class="add_to_compare" 
															href="{$product.link|escape:'html':'UTF-8'}" 
															data-product-name="{$product.name|escape:'htmlall':'UTF-8'}"
															data-product-cover="{$link->getImageLink($product.link_rewrite, $product.id_image, 'cart_default')|escape:'html'}"
															data-id-product="{$product.id_product}"
															title="{l s='Add to Compare' mod='labspecialsproducts'}">
															<i class="pe-7s-refresh-2"></i>
														</a>
													</li>
												{/if}
												<li class="lab-Wishlist">
													<a onclick="WishlistCart('wishlist_block_list', 'add', '{$product.id_product|intval}', $('#idCombination').val(), 1,'tabproduct'); return false;" class="add-wishlist wishlist_button" href="#"
													data-id-product="{$product.id_product|intval}"
													title="{l s='Add to Wishlist' mod='labspecialsproducts'}">
													<i class="pe-7s-like"></i></a>
												</li>
											</ul>
											
										</div> -->
							</div>
						</div>
					{if $smarty.foreach.myLoop.iteration % 1 == 0 || $smarty.foreach.myLoop.last  }
						</div>
					{/if}
			{/foreach}
		</div>
<!-- 	<div class="lab_boxnp lab_boxnp2">
		<a class="prevspecial"><i class="icon-angle-left"></i></a>
		<a class="nextspecial"><i class="icon-angle-right"></i></a>
	</div> -->
	</div>
	
	
</div>	
<script>
    $(document).ready(function() {
    var owl = $("#pos-special-products");
	owl.owlCarousel({
		autoPlay : false,
		items :1,
		itemsDesktop : [1200,1],
		itemsDesktopSmall : [991,1],
		itemsTablet: [767,1],
		itemsMobile : [480,1],
		pagination : true,
	});
	$(".nextspecial").click(function(){
		owl.trigger('owl.next');
		})
		$(".prevspecial").click(function(){
		owl.trigger('owl.prev');
		})   
    });
	
</script>

	{/if}