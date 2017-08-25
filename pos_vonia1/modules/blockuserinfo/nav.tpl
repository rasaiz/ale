<!-- Block user information module NAV  -->

<!--  	<div class="poswelcome">
			{if $is_logged}
				<p class="welcome-msg">{l s='welcome' mod='blockuserinfo'} {$cookie->customer_firstname} {$cookie->customer_lastname}  </p>
			{else}
					<p class="welcome-msg">{l s='Welcome Greentech store!' mod='blockuserinfo'} </p>
			{/if}
	</div>  -->
	<div class="header_userinfo hidden-xs">
			<ul id="header_links" class=" vertical-link header_links_ul toogle_content">
				{$context = Context::getContext()}
				<li class="first"><a class="link-myaccount" href="{$link->getPageLink('my-account', true)|escape:'html'}" title="{l s='Mi cuenta' mod='blockuserinfo'}">
					{l s='Mi cuenta' mod='blockuserinfo'}
				</a></li>
				<li><a class="link-wishlist wishlist_block" href="{$context->link->getModuleLink('blockwishlist', 'mywishlist')}" title="{l s='Mi lista de deseos' mod='blockuserinfo'}">
				{l s='Mi lista de deseos' mod='blockuserinfo'}</a></li>
				<li><a class="link-checkout" href="{$link->getPageLink('order', true)|escape:'html'}" title="{l s='Checkout' mod='blockcontact'}">{l s='Checkout' mod='blockuserinfo'}</a></li>
				<li>
				{if $is_logged}
					<a class="logout" href="{$link->getPageLink('index', true, NULL, "mylogout")|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Cerrar Sesión' mod='blockuserinfo'}">
						{l s='Cerrar Sesión' mod='blockuserinfo'}
					</a>
				{else}
					<a class="login" href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Iniciar sesión' mod='blockuserinfo'}">
						{l s='Iniciar sesión' mod='blockuserinfo'}
					</a>
				{/if}
				</li>
			</ul>
	</div>
	<div class="header_userinfo_mobile visible-xs">
		<div class="top-userinfo">
			<div class=" top-links current">
				<span>{l s='Gestión de cuenta' mod='blockuserinfo'}</span>
			</div>
			<ul class=" vertical-link header_links_ul toogle_content">
				{$context = Context::getContext()}
				<li class="first"><a class="link-myaccount" href="{$link->getPageLink('my-account', true)|escape:'html'}" title="{l s='Mi cuenta' mod='blockuserinfo'}">
					{l s='Mi cuenta' mod='blockuserinfo'}
				</a></li>
				<li><a class="link-wishlist wishlist_block" href="{$context->link->getModuleLink('blockwishlist', 'mywishlist')}" title="{l s='Mi lista de deseos' mod='blockuserinfo'}">
				{l s='Mi lista de deseos' mod='blockuserinfo'}</a></li>
				<li><a class="link-checkout" href="{$link->getPageLink('order', true)|escape:'html'}" title="{l s='Checkout' mod='blockcontact'}">{l s='Checkout' mod='blockuserinfo'}</a></li>
				<li>
				{if $is_logged}
					<a class="logout" href="{$link->getPageLink('index', true, NULL, "mylogout")|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Cerrar Sesión' mod='blockuserinfo'}">
						{l s='Cerrar Sesión' mod='blockuserinfo'}
					</a>
				{else}
					<a class="login" href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Iniciar Sesión' mod='blockuserinfo'}">
						{l s='Iniciar Sesión' mod='blockuserinfo'}
					</a>
				{/if}
				</li>
			</ul>
		</div>
	</div>
	

	

<!-- /Block usmodule NAV -->
