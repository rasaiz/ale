<div class="lab_testimonials" style="{if $show_background && $background != ""}background: rgba(0, 0, 0, 0) url({$link->getMediaLink("`$module_dir`$background")}) repeat fixed 50% 0;background-size: cover;{/if}">
	<div class="container">
		 <!--  <p class="layber">{l s='Satisfied Clients' mod='labtestimonials'}</p>
		  <h4 class="lab_title">{l s='What customers say'}</h4> -->
		  <div id="wrapper">
			{if $testimonials}
				<div class="testimonials">
				  {foreach from=$testimonials key=test item=testimonial}
					{if $testimonial.active == 1}
					  <div class="item-inner wow fadeInUp " data-wow-delay="200ms" >
						<div class="item">
						<!--<div class="media-content">
						   {if $testimonial.media}
							{if in_array($testimonial.media_type,$arr_img_type)}
							  <a class="fancybox-media" href="{$mediaUrl}{$testimonial.media}?id={$testimonial.id_labtestimonial}">
								<img src="{$mediaUrl}{$testimonial.media}" alt="Image Testimonial">
							  </a>

							{/if}
							{if in_array($testimonial.media_type,$video_types) }
								<video width="260" height="240" controls>
									<source src="{$mediaUrl}{$testimonial.media}" type="video/mp4" />
								</video>
							{/if}
						  {else}
							  <img src="{$module_dir}assets/front/img/demo1.jpg" alt="Image Testimonial">
						  {/if}
						   {if $testimonial.media_type == 'youtube'}
							<a class="fancybox-media" href="{$testimonial.media_link}"><img src="{$video_youtube}" alt="{l s='Youtube Video' mod='labtestimonials'}"></a>
						  {elseif $testimonial.media_type == 'vimeo'}
							<a class="fancybox-media" href="{$testimonial.media_link}"><img src="{$video_vimeo}" alt="{l s='Vimeo Video' mod='labtestimonials'}"></a>
						  {/if} 
						</div>-->
						<div class="media-content">
							<a class="fancybox-media" href="{$mediaUrl}{$testimonial.media}?id={$testimonial.id_labtestimonial}">
								<img src="{$mediaUrl}{$testimonial.media}" alt="Image Testimonial">
							</a>
						</div>
						<div class="content_test">
						<p><span class="des_namepost">{$testimonial.name_post}</span><span class="des_company"> {$testimonial.company}</span></p>
							<p class="des_testimonial">{$testimonial.content|truncate:60} </p>							
						</div>
						
					  </div>
					  </div>
					{/if}

				  {/foreach}
				</div>
				<!-- <div class="prevnexttestimonial">
					<a class="prev prevtestimonial"><i class="icon icon-angle-left"></i></a>
					<a class="next nexttestimonial"><i class="icon icon-angle-right"></i></a>
				</div> -->
			{/if}
			  <!-- <div class="button_testimonial">
				  <div class="view_all"><a class="btn btn-default button button-small" href="{$link->getModuleLink('labtestimonials','views',['process' => 'view'])}">{l s='View All' mod='labtestimonials'}</a></div>
				  <div class="submit_link"><a class="btn btn-default button button-small" href="{$link->getModuleLink('labtestimonials','views',['process' => 'form_submit'])}"> {l s='Submit Testimonial' mod='labtestimonials'}</a></div>
			  </div> -->
		  </div>
	</div>
	
</div>
<script>
	$(document).ready(function() {
	var owl = $(".testimonials");
	owl.owlCarousel({
		autoPlay : false,
		slideSpeed : 2000,
		paginationSpeed : 2000,
		rewindSpeed : 2000,
		items :3,
		itemsDesktop : [1200,2],
		itemsDesktopSmall : [991,1],
		itemsTablet: [767,1],
		itemsMobile : [480,1],
	});
		$(".nexttestimonial").click(function(){
		owl.trigger('owl.next');
		})
		$(".prevtestimonial").click(function(){
		owl.trigger('owl.prev');
		})    
	});
</script>