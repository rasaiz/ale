trinh
<div class="testimonials_block_home col-xs-12 col-sm-12 col-md-12">
<div id="testimonials_block_right" class="block" style="{if $show_background && $background != ""}background: rgba(0, 0, 0, 0) url({$link->getMediaLink("`$module_dir`$background")}) repeat fixed 50% 0;background-size: cover;{/if}">

  <div id="wrapper" class="block_content">
                        {if $testimonials}
                            <div id="slide-panel">
                                        <h4 class="title_block title_font">{l s='Testimonials' mod='labtestimonials'}<span></span></h4>
                                <div id="slide">
                                    {foreach from=$testimonials key=test item=testimonial}
                                        {if $testimonial.active == 1}
                                            <div class="main-block">
                                                <div class="content_test_top">
                                                    <p class="des_testimonial"><i class="icon-quote-left"></i>{$testimonial.content|truncate:183:'...'}<i class="icon-quote-right"></i> {*<a href="{$link->getModuleLink('labtestimonials','views',['process'=>'view','id'=>{$testimonial.id_labtestimonials}])}" class="read_more">Read More</a>*}</p>
                                                </div>
                                                <div class="content_test_bottom">
                                                <div class="media-content">
                                                    {if $testimonial.media}
                                                        {if in_array($testimonial.media_type,$arr_img_type)}
                                                            <a class="fancybox-media" href="{$mediaUrl}{$testimonial.media}?id_test={$testimonial.id_labtestimonials}">
                                                                <img src="{$mediaUrl}{$testimonial.media}" alt="Image Testimonial"/>
                                                            </a>
                                                        {/if}
                                                        {if in_array($testimonial.media_type,$video_types) }
                                                            <video width="260" height="240" controls>
                                                                <source src="{$mediaUrl}{$testimonial.media}" type="video/mp4" />
                                                            </video>
                                                        {/if}
                                                        {if strlen($testimonial.media_type) == 'youtube'}
                                                            <a class="fancybox-media" href="{$testimonial.media_link}?id_test={$testimonial.id_labtestimonials}"><img src="{$video_youtube}" alt="Youtube Video"></a>
                                                            {elseif strlen($testimonial.media_type) == 'vimeo'}
                                                            <a class="fancybox-media" href="{$testimonial.media_link}?id_test={$testimonial.id_labtestimonials}"><img src="{$video_vimeo}" alt="Vimeo Video"></a>
                                                            {/if}
                                                        {/if}
                                                </div>
                                                <div class="media-content-info">
                                                    <p class="des_namepost">{$testimonial.name_post}</p>
                                                    <p class="des_company">{$testimonial.company}</p>
                                                </div>
                                                </div>
                                            </div>
                                        {/if}
                                    {/foreach}
                                </div>
                                <div class="bx-controls-direction">
                                    <a class="prev bx-prev" href=""></a>
                                    <a class="next bx-next" href=""></a>
                                </div>
                            </div>
                        {/if}
                        {*<div class="button_testimonial">
                        <div class="view_all"><a href="{$link->getModuleLink('labtestimonials','views',['process' => 'view'])}">View All</a></div>
                        <div class="submit_link"><a href="{$link->getModuleLink('labtestimonials','views',['process' => 'form_submit'])}"> Submit Your Testimonial</a></div>
                        </div>*}
                    </div>
</div>
</div>