
<script type="text/javascript">

$(document).ready(function() {

	$(".tab_content").hide();
	$(".tab_content:first").show(); 

	$("ul.tabs li").click(function() {
		$("ul.tabs li").removeClass("active");
		$(this).addClass("active");
		$(".tab_content").hide();
		$(".tab_content").removeClass("animate1 {$tab_effect}");
		var activeTab = $(this).attr("rel"); 
		$("#"+activeTab) .addClass("animate1 {$tab_effect}");
		$("#"+activeTab).fadeIn(); 
	});
});

</script>
<div class="product-tabs-container-slider">
	<ul class="tabs"> 
	{$count=0}
	{foreach from=$productTabslider item=productTab name=posTabProduct}
		<li class="{$productTab.id} {if $smarty.foreach.posTabProduct.first}first_item{elseif $smarty.foreach.posTabProduct.last}last_item{else}{/if} item {if $count==0} active {/if}" rel="tab_{$productTab.id}"  >
			{$productTab.name}
		</li>
			{$count= $count+1}
	{/foreach}	
	</ul>

	<div class="tab_container"> 
	{foreach from=$productTabslider item=productTab name=posTabProduct}
		<div id="tab_{$productTab.id}" class="tab_content">
			<div class="row pos-content">
				<div class="productTabContent">
				{foreach from=$productTab.productInfo item=product name=myLoop}
					{if $smarty.foreach.myLoop.index % 1 == 0 || $smarty.foreach.myLoop.first }
					<div class="tabslider_item">
					{/if}
						<div class="item-product">
							<div class="products-inner">
								<a class = "bigpic_{$product.id_product}_tabproduct tabproduct-img product_image" href="{$product.link|escape:'html'}" title="{$product.name|escape:html:'UTF-8'}">
									<img class="replace-2x img-responsive" src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'home_default')|escape:'html'}" alt="{$product.legend|escape:'html':'UTF-8'}" />
															
								</a>
								{if isset($product.new) && $product.new == 1}
									<a class="new-box" href="{$product.link|escape:'html':'UTF-8'}">
										<span class="new-label">{l s='New' mod='postabproductslider'}</span>
									</a>
								{/if}
								{if isset($product.on_sale) && $product.on_sale && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}
									<a class="sale-box" href="{$product.link|escape:'html':'UTF-8'}">
										<span class="sale-label">{l s='Sale!' mod='postabproductslider'}</span>
									</a>
								{/if}
								
								<div class="actions">
															
									<div class="actions-inner">
										
										<ul class="add-to-links">
											
											<li class="cart">
												{if ($product.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $product.available_for_order && !isset($restricted_country_mode) && $product.minimal_quantity <= 1 && $product.customizable != 2 && !$PS_CATALOG_MODE}
												{if ($product.allow_oosp || $product.quantity > 0)}
												{if isset($static_token)}
													<a class="button ajax_add_to_cart_button btn btn-default" href="{$link->getPageLink('cart',false, NULL, "add=1&amp;id_product={$product.id_product|intval}&amp;token={$static_token}", false)|escape:'html':'UTF-8'}" rel="nofollow"  title="{l s='Add to cart' mod='postabproductslider'}" data-id-product="{$product.id_product|intval}">
														<span>{l s='Add to cart' mod='postabproductslider'}</span>
														
													</a>
												{else}
												<a class="button ajax_add_to_cart_button btn btn-default" href="{$link->getPageLink('cart',false, NULL, 'add=1&amp;id_product={$product.id_product|intval}', false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Add to cart' mod='postabproductslider'}" data-id-product="{$product.id_product|intval}">
													<span>{l s='Add to cart' mod='postabproductslider'}</span>
												</a>
												   {/if}      
												{else}
												<span class="button ajax_add_to_cart_button btn btn-default disabled" >
													<span>{l s='Add to cart' mod='postabproductslider'}</span>
												</span>
												{/if}
												{/if}
											</li>
											<li>
												<a class="addToWishlist wishlistProd_{$product.id_product|intval}" href="#" data-wishlist="{$product.id_product|intval}" title="{l s='Add to Wishlist' mod='postabproductslider'}" onclick="WishlistCart('wishlist_block_list', 'add', '{$product.id_product|intval}', false, 1); return false;">
													<span>{l s="Wishlist" mod='postabproductslider'}</span>
													
												</a>
											</li>
											<li>
											{if isset($comparator_max_item) && $comparator_max_item}
											  <a class="add_to_compare" href="{$product.link|escape:'html':'UTF-8'}" data-id-product="{$product.id_product}" title="{l s='Add to Compare' mod='postabproductslider'}">{l s='Compare' mod='postabproductslider'}
											
											  </a>
											 {/if}
											</li>
										
										</ul>
										<div class="quick_view">
											{if isset($quick_view) && $quick_view}
												<a class="quick-view" title="{l s='Quick view' mod='postabproductslider'}" href="{$product.link|escape:'html':'UTF-8'}">
													<span>{l s='Quick view' mod='postabproductslider'}</span>
												</a>
											{/if}
										</div>
									</div>
								</div>	
							</div>
							<div class="product-contents">
								<h5 class="product-name"><a class="product-name" href="{$product.link|escape:'html'}" title="{$product.name|truncate:50:'...'|escape:'htmlall':'UTF-8'}">{$product.name|truncate:35:'...'|escape:'htmlall':'UTF-8'}</a></h5>
								{capture name='displayProductListReviews'}{hook h='displayProductListReviews' product=$product}{/capture}
								{if $smarty.capture.displayProductListReviews}
									<div class="hook-reviews">
									{hook h='displayProductListReviews' product=$product}
									</div>
								{/if}							
								{if (!$PS_CATALOG_MODE AND ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
								<div class="price-box">
								{if isset($product.show_price) && $product.show_price && !isset($restricted_country_mode)}
									{hook h="displayProductPriceBlock" product=$product type='before_price'}
									<span class="price product-price">
										{if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}
									</span>
									{if isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction) && $product.specific_prices.reduction > 0}
										{hook h="displayProductPriceBlock" product=$product type="old_price"}
										<span class="old-price product-price">
											{displayWtPrice p=$product.price_without_reduction}
										</span>
										{hook h="displayProductPriceBlock" id_product=$product.id_product type="old_price"}
										{if $product.specific_prices.reduction_type == 'percentage'}
											<span class="price-percent-reduction">-{$product.specific_prices.reduction * 100}%</span>
										{/if}
									{/if}
									{hook h="displayProductPriceBlock" product=$product type="price"}
									{hook h="displayProductPriceBlock" product=$product type="unit_price"}
									{hook h="displayProductPriceBlock" product=$product type='after_price'}
								{/if}
								</div>
								{/if}
							
	
							</div>
						</div>	
					{if $smarty.foreach.myLoop.iteration % 1 == 0 || $smarty.foreach.myLoop.last  }
					</div>
					{/if}
						
				{/foreach}
				</div>
				<div class="boxprevnext">
					<a class="prev prevtabslider"><i class="icon-angle-left"></i></a>
					<a class="next nexttabslider"><i class="icon-angle-right"></i></a>
				</div>
			</div>	
		</div>
	{/foreach}	
	
	</div> <!-- .tab_container -->
</div>
<script type="text/javascript"> 
	$(document).ready(function() {
		var owl = $(".productTabContent");
		owl.owlCarousel({
		items :4,
		slideSpeed: 1000,
		 pagination :false,
		itemsDesktop : [1199,3],
		itemsDesktopSmall : [991,3],
		itemsTablet: [767,2],
		itemsMobile : [480,1]
		});
		$(".nexttabslider").click(function(){
		owl.trigger('owl.next');
		})
		$(".prevtabslider").click(function(){
		owl.trigger('owl.prev');
		})  
	});
</script>

