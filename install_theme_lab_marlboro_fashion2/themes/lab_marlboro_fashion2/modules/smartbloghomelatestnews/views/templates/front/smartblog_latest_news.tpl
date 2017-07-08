<div class="laberthemes">
	 <!-- <p class="layber">{l s='Our Blog Posts' mod='smartbloghomelatestnews'}</p>
    <p class='lab_title'>
		<span>{l s='New Post From blog' mod='smartbloghomelatestnews'}</span>
	</p>  -->
    
    <div class="blog-content row">
	<div class="labnewsmartblog">
    <div class="sdsblog-box-content">	
        {if isset($view_data) AND !empty($view_data)}
            {assign var='i' value=1}			
            {foreach from=$view_data item=post name=myLoop}
                    {assign var="options" value=null}
                    {$options.id_post = $post.id}
                    {$options.slug = $post.link_rewrite}
					{if $i <= 6 }					
					   <div class="item-inner wow fadeInUp " data-wow-delay="{$smarty.foreach.myLoop.iteration}00ms">
							<div class="item-i" >								
									
									<div class="content-blog ">
										
										<h2 class="labname"><a href="{smartblog::GetSmartBlogLink('smartblog_post',$options)}">{$post.title}</a></h2>
										<p class="date_added">
											<span>{$post.date_added|date_format:"%B"|truncate:3:''} {$post.date_added|date_format:"%d"|truncate:3},{$post.date_added|date_format:"%Y"|truncate:10:''}</span>
										</p>
										<div class="image_blog ">
											<a href="{smartblog::GetSmartBlogLink('smartblog_post',$options)}"><img alt="{$post.title}" class="feat_img_small" src="{$modules_dir}smartblog/images/{$post.post_img}-home-default.jpg"></a>
											<a class="read-more" href="{smartblog::GetSmartBlogLink('smartblog_post',$options)}"><!-- {l s='Read more ' mod='smartbloghomelatestnews'} --> <i class="pe-7s-link"></i></a>
										</div>
										<p class="meta_description">{$post.meta_description|truncate:100}</p>
										
									</div>
								
							</div>
						</div>
					{/if}
                {$i=$i+1}
            {/foreach}
        {/if}
     </div>
   
	
	</div>
	
	  <div class="lab_boxnp">
		<a class="prev labnewblogprev"><i class="icon icon-angle-left"></i></a>
		<a class="next labnewblognext"><i class="icon icon-angle-right"></i></a>
	</div>  
	</div>
</div>
 <script>
    $(document).ready(function() {
	var owl = $(".sdsblog-box-content");
    owl.owlCarousel({
		autoPlay : false,
		slideSpeed : 2000,
		paginationSpeed : 2000,
		rewindSpeed : 2000,
		addClassActive : true,
		items :3,
		itemsDesktop : [1024,3],
		itemsDesktopSmall : [980,2],
		itemsTablet: [767,2],
		itemsMobile : [480,1],
	});
	$(".labnewblognext").click(function(){
	owl.trigger('owl.next');
	})
	$(".labnewblogprev").click(function(){
	owl.trigger('owl.prev');
	})
    });
</script> 