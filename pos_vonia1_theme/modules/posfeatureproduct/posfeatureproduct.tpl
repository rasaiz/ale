<div class="pos-feature-product">
		<div class="pos-title">
			<h2><span>{l s='Featured Products' mod='posfeatureproduct'}</span></h2>
		</div>
		<div class="row pos-content">
		{if count($products)>1}
		
			<div class="featureSlide">
				{foreach from=$products item=product name=myLoop}
					{if $smarty.foreach.myLoop.index % 3 == 0 || $smarty.foreach.myLoop.first }
					<div class="item-feature">
					{/if}
						<div class="item-product">
					
							<div class="products-inner">
								<a class="product_img_link" href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}" itemprop="url">
									<img class="replace-2x img-responsive" src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'home_default')|escape:'html':'UTF-8'}" alt="{if !empty($product.legend)}{$product.legend|escape:'html':'UTF-8'}{else}{$product.name|escape:'html':'UTF-8'}{/if}" title="{if !empty($product.legend)}{$product.legend|escape:'html':'UTF-8'}{else}{$product.name|escape:'html':'UTF-8'}{/if}" {if isset($homeSize)} {/if} itemprop="image" />
								</a>
								
							</div>
								
							<div class="product-contents">
								<h5 class="product-name"><a href="{$product.link|escape:'html'}" title="{$product.name|truncate:50:'...'|escape:'htmlall':'UTF-8'}">{$product.name|truncate:35:'...'|escape:'htmlall':'UTF-8'}</a></h5>
								{if $slideOptions.show_des ==1 }
									<div class="product_desc"><a href="{$product.link|escape:'html'}" title="{l s='More' mod='posfeatureproduct'}">{$product.description_short|strip_tags|truncate:65:'...'}</a></div>
								{/if}	
								{capture name='displayProductListReviews'}{hook h='displayProductListReviews' product=$product}{/capture}
								{if $smarty.capture.displayProductListReviews}
									<div class="hook-reviews">
									{hook h='displayProductListReviews' product=$product}
									</div>
								{/if}
							
								<div  class="price-box">
									{if isset($product.show_price) && $product.show_price && !isset($restricted_country_mode)}
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
									{/if}
								</div>								
							</div>	
						</div>
						
					{if $smarty.foreach.myLoop.iteration % 3 == 0 || $smarty.foreach.myLoop.last  }
					</div>
					{/if}
				
				{/foreach}
			</div>
			<div class="boxprevnext">
				<a class="prev prevfure"><i class="icon-angle-left"></i></a>
				<a class="next nextfure"><i class="icon-angle-right"></i></a>
			</div>
			{else}
			<p class="warning">{l s='No products for this new products.' mod='posfeatureproduct'}</p>
		
		{/if}
		</div>	
	</div>
	
<script type="text/javascript"> 
    $(document).ready(function() {
		var owl = $(".featureSlide");
		owl.owlCarousel({
		items : 3,
		slideSpeed: 1000,
		pagination :false,
		itemsDesktop : [1199,3],
		itemsDesktopSmall : [991,2], 
		itemsTablet: [767,2], 
		itemsMobile : [480,1],
		autoPlay :  {if $slideOptions.auto_slide != 1}false{else}true{/if},
		});
		 
		// Custom Navigation Events
		$(".nextfure").click(function(){
		owl.trigger('owl.next');
		})
		$(".prevfure").click(function(){
		owl.trigger('owl.prev');
		})
    });

</script>


		 

