/**
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
*
* Don't forget to prefix your containers with your own identifier
* to avoid any conflicts with others containers.
*/
function getHtmlHide(nIpad,numLiItem) 
 {
	var htmlLiHide="";
	if($("#more_menu").length==0)
		for(var i=(nIpad+1);i<=numLiItem;i++)
			htmlLiHide+='<li>'+$('.lab-menu-horizontal ul.menu-content li.level-1:nth-child('+i+')').html()+'</li>';
	return htmlLiHide;
}

function addMoreResponsive(nIpadHorizontal,nIpadVertical,htmlLiH,htmlLiV,htmlMenu) 
{
	if(nIpadHorizontal>0 && nIpadVertical>0)
	{
		if($("#more_menu").length>0)
			$(".lab-menu-horizontal .container").html(htmlMenu);

		if($(window).width() > 750 && $(window).width() <= 992)
		{	
			if($("#more_menu").length==0)
			{
				$('<li id="more_menu" class="level-1 more-menu"><a href="#"><span class="icon-plus"></span>' + text_more + '</a><ul class="menu-dropdown cat-drop-menu lab-sub-auto">' + htmlLiV + '</ul></li>').insertAfter('.lab-menu-horizontal ul.menu-content li.level-1:nth-child('+nIpadVertical+')');
			}
			if($("#more_menu").length>0)
				for(var j=(nIpadVertical+2);j<=(numLiItem+1);j++)
				{
					$(".lab-menu-horizontal ul.menu-content li:nth-child("+j+").level-1").remove();
					var delItem=nIpadVertical+2;
					$(".lab-menu-horizontal ul.menu-content li:nth-child("+delItem+").level-1").remove();
				}
		}
		else if($(window).width() > 992 && $(window).width() <= 1199)
		{
			
			if($("#more_menu").length==0)
				$('<li id="more_menu" class="level-1 more-menu"><a href="#"><span class="icon-plus"></span>' + text_more + '</a><ul class="menu-dropdown cat-drop-menu lab-sub-auto">' + htmlLiH + '</ul></li>').insertAfter('.lab-menu-horizontal ul.menu-content li.level-1:nth-child('+nIpadHorizontal+')');
			if($("#more_menu").length>0)
				for(var j=(nIpadHorizontal+2);j<=(numLiItem+1);j++)
				{
					$(".lab-menu-horizontal ul.menu-content li:nth-child("+j+").level-1").remove();
					var delItem=nIpadHorizontal+2;
					$(".lab-menu-horizontal ul.menu-content li:nth-child("+delItem+").level-1").remove();
				}
		}
	}
}
$(document).ready(function()
{	activeMenu();
	$(document).on('click', '.lab-menu-horizontal .icon-drop-mobile', function() {
		$(this).next().toggle('slow');
		$(this).toggleClass('opened');
	});
	if($(window).width() < 768)
	{
		$('.lab-menu-horizontal ul.menu-content').css('display', 'none');
		menuHorClick();
	}
	$(window).resize(function(){
		if($(window).width() < 768)
		{
			$('.lab-menu-horizontal ul.menu-content').css('display', 'none');
			menuHorClick();
		}
		else
		{
			$('.lab-menu-horizontal ul.menu-content').css('display', 'block');
		}
	});
});

function activeMenu(){

	aObj = document.getElementsByClassName("lab-menu-horizontal")[0].getElementsByTagName('a');
    var found = false;
    for (i = 0; i < aObj.length; i++) {
        if (document.location.href.indexOf(aObj[i].href) >= 0) {
            aObj[i].className = 'active';
            found = true;
        }
    }
    if (!found) {
        aObj[0].className = 'active';
    }

}

function addSticky(){
	if($('#layer_cart').is(":visible"))
		$('.lab-menu-horizontal').removeClass('lab-menu-sticky animated fadeInDown');		
	else
	{
		var hBeginSticky = $('#header').height();
		if($(this).scrollTop() > hBeginSticky)			
			$('.lab-menu-horizontal').addClass('lab-menu-sticky animated fadeInDown');			
		else
			$('.lab-menu-horizontal').removeClass('lab-menu-sticky animated fadeInDown');
	}
} 

function menuHorClick()
{
	 $(".lab-menu-horizontal .title-menu-mobile").toggle(
			function() {
				$(".lab-menu-horizontal ul.menu-content").stop(true, true).slideDown(400);
			},
			function() {			
				$(".lab-menu-horizontal ul.menu-content").stop(true, true).slideUp(200);		
			}
		);
}