{*
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
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2017 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<style>

#reviewscarousel_module .material-icons, .star_content .material-icons{
color: {$stars_color|escape:'htmlall':'UTF-8'};
}

</style>

{if $reviews}
<div id="reviewscarousel_module" class="{if $ws_productreviewsis17 == 1}block block-categories{/if} container">
    <div class="pos-title">
      <h2>
        <span>
            {l s='Last Reviews' mod='ws_productreviews'}
        </span>
      </h2>
    </div>

    <div class="reviews-carousel-wrapper reviews-owl-carousel reviews-owl-theme clearfix clearBoth" id="reviewscarousel">
        {foreach $reviews as $review name='reviewsCarousel'}
        <div class="reviews-carousel-item">

            <div class="row">
                <div class="col-md-2">

                {if $widget_photo && $review.cover_img}
                     <a class="review_img_big" rel="review_img_big" href="{$review.product_link|escape:'htmlall':'UTF-8'}"><img class="review_img" src="{$review_img_path|escape:'htmlall':'UTF-8'}{$review.cover_img|escape:'htmlall':'UTF-8'}_thumb.jpg"></a>
                {else}
                <a class="products-block-image" href="{$review.product_link|escape:'htmlall':'UTF-8'}" title="{$review.name|escape:'htmlall':'UTF-8'}">
                    <img src="{$link->getImageLink($review.product_link_rewrite, $review.product_cover, 'home_default')|escape:'htmlall':'UTF-8'}" />
                </a>
                {/if}
                </div>
                <div class="col-md-10">
               <h4><span>{$review.customer_name|escape:'htmlall':'UTF-8'}</span> {l s='on' mod='ws_productreviews'} <a href="{$review.product_link|escape:'htmlall':'UTF-8'}" title="{$review.name|escape:'htmlall':'UTF-8'}">{$review.name|escape:'htmlall':'UTF-8'}</a></h4>
               <div class="star_content">
            {section name="i" start=0 loop=5 step=1}
                {if $review.grade le $smarty.section.i.index}
                    {if $ws_productreviewsis17 == 1}<i class="material-icons">star_border</i>{else}<div class="star"></div>{/if}
                {else}
                    {if $ws_productreviewsis17 == 1}<i class="material-icons">star</i>{else}<div class="star star_on"></div>{/if}
                {/if}
            {/section}
            </div>
            <div class="review_title">{$review.title|escape:'htmlall':'UTF-8'}</div>
                    <blockquote>
                        {$review.content|truncate:245:'...'|escape:'htmlall':'UTF-8'}
                    </blockquote>
                 <p>
                <a data-fancybox-type="inline" data-fancybox-width="600" data-fancybox-height="400" class="read-review-btn" href="#full-review-{$review.id_product_comment|intval}" title="{l s='Review by' mod='ws_productreviews'} {$review.customer_name|escape:'htmlall':'UTF-8'}">
                    <span>{l s='Read review' mod='ws_productreviews'}</span>
                </a>

            </p>
                </div>
            </div>

            <div style="display: none;">
                <div class="full-review-popup" id="full-review-{$review.id_product_comment|intval}">
                    <h4><span>{$review.customer_name|escape:'htmlall':'UTF-8'}</span> {l s='on' mod='ws_productreviews'} <a href="{$review.product_link|escape:'htmlall':'UTF-8'}" title="{$review.name|escape:'htmlall':'UTF-8'}">{$review.name|escape:'htmlall':'UTF-8'}</a></h4>
                    {l s='Grade:' mod='ws_productreviews'}
                    <div class="star_content clearfix clearBoth">
                    {section name="i" start=0 loop=5 step=1}
                        {if $review.grade le $smarty.section.i.index}
                            {if $ws_productreviewsis17 == 1}<i class="material-icons">star_border</i>{else}<div class="star"></div>{/if}
                        {else}
                            {if $ws_productreviewsis17 == 1}<i class="material-icons">star</i>{else}<div class="star star_on"></div>{/if}
                        {/if}
                    {/section}
                    </div>
                    <blockquote>{$review.content|escape:'htmlall':'UTF-8'}</blockquote>
                </div>
            </div>
        </div><!-- .reviews-carousel-item -->
        {/foreach}
    </div><!-- .reviews-carousel-wrapper -->
</div><!-- .container -->

{/if}