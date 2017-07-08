<a class= "product_image" href="{$product.link|escape:'html'}" title="{$product.name|escape:html:'UTF-8'}">
			<img class="img-responsive img1" src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'large_default')|escape:'html'}" alt="{$product.name|escape:html:'UTF-8'}" />

    {if isset($rotator_img)}
			{foreach from=$rotator_img item=image name=thumbnails}
                {assign var=imageIds value="`$product.id_product`-`$image.id_image`"}
                <img  class="img-responsive img2" src="{$link->getImageLink($product.link_rewrite, $imageIds, 'large_default')|escape:'html':'UTF-8'}" alt="{$imageTitle}"  itemprop="image"  />
            {/foreach}
    {/if}
</a>