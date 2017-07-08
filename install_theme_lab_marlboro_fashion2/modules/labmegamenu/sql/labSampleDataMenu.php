<?php
/**
* 2007-2014 PrestaShop
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
*  @copyright 2007-2014 PrestaShop SA
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*/

class labSampleDataMenu
{
	public function initData()
	{
		$return = true;
		$languages = Language::getLanguages(true);
		$id_shop = Configuration::get('PS_SHOP_DEFAULT');
		
		$return &= Db::getInstance()->Execute('INSERT IGNORE INTO `'._DB_PREFIX_.'labmegamenu` (`id_labmegamenu`, `type_link`, `dropdown`, `type_icon`, `icon`, `align_sub`, `width_sub`, `class`, `position`, `active`) VALUES 		
		(1, 0, 0, 0, "", "lab-sub-auto", "col-sm-12", "", 0, 1),
		(2, 0, 1, 0, "", "lab-sub-auto", "col-sm-4", "", 0, 1),
		(3, 0, 0, 0, "", "lab-sub-right", "col-sm-6", "", 0, 1),
		(4, 0, 0, 0, "", "lab-sub-right", "col-sm-9", "", 0, 1),
		(5, 1, 1, 0, "", "lab-sub-auto", "col-sm-12", "underline", 0, 1)
		
		;');
		
		$return &= Db::getInstance()->Execute('INSERT IGNORE INTO `'._DB_PREFIX_.'labmegamenu_shop` (`id_labmegamenu`, `id_shop`, `type_link`, `dropdown`, `type_icon`, `icon`, `align_sub`, `width_sub`, `class`, `position`, `active`) VALUES 	
		(1, '.$id_shop.', 0, 0, 0, "", "lab-sub-auto", "col-sm-12", "", 0, 1),
		(2, '.$id_shop.', 0, 1, 0, "", "lab-sub-auto", "col-sm-4", "", 0, 1),
		(3, '.$id_shop.', 0, 0, 0, "", "lab-sub-right", "col-sm-6", "", 0, 1),
		(4, '.$id_shop.', 0, 0, 0, "", "lab-sub-right", "col-sm-9", "", 0, 1),
		(5, '.$id_shop.', 1, 1, 0, "", "lab-sub-auto", "col-sm-12", "underline", 0, 1)
		
		;');
		
		$return &= Db::getInstance()->Execute('INSERT IGNORE INTO `'._DB_PREFIX_.'labmegamenu_row` (`id_row`, `id_labmegamenu`, `class`, `active`) VALUES 
		(1, 3, "", 1),
		(2, 4, "", 1),
		(3, 4, "", 1)
		
		;');
		
		$return &= Db::getInstance()->Execute('INSERT IGNORE INTO `'._DB_PREFIX_.'labmegamenu_row_shop` (`id_row`, `id_labmegamenu`, `id_shop`,`class`, `active`) VALUES 
		(1, 3, '.$id_shop.', "", 1),
		(2, 4, '.$id_shop.', "", 1),
		(3, 4, '.$id_shop.', "", 1)
		
		;');
		
		$return &= Db::getInstance()->Execute('INSERT IGNORE INTO `'._DB_PREFIX_.'labmegamenu_column` (`id_column`, `id_row`, `width`, `class`, `position`, `active`) VALUES 
		(1, 1, "col-sm-4", "", 0, 1),
		(2, 1, "col-sm-4", "", 0, 1),
		(3, 2, "col-sm-3", "", 0, 1),
		(4, 2, "col-sm-3", "", 0, 1),
		(7, 2, "col-sm-3", "", 0, 1),
		(8, 1, "col-sm-4", "", 0, 1),
		(9, 2, "col-sm-3", "", 0, 1),
		(10, 3, "col-sm-3", "", 0, 1),
		(11, 3, "col-sm-3", "", 0, 1),
		(12, 3, "col-sm-3", "", 0, 1),
		(13, 3, "col-sm-3", "", 0, 1)
		
		;');
		
		$return &= Db::getInstance()->Execute('INSERT IGNORE INTO `'._DB_PREFIX_.'labmegamenu_column_shop` (`id_column`, `id_row`, `id_shop`, `width`, `class`, `position`, `active`) VALUES 
		(1, 1, '.$id_shop.', "col-sm-4", "", 0, 1),
		(2, 1, '.$id_shop.', "col-sm-4", "", 0, 1),
		(3, 2, '.$id_shop.', "col-sm-3", "", 0, 1),
		(4, 2, '.$id_shop.', "col-sm-3", "", 0, 1),
		(7, 2, '.$id_shop.', "col-sm-3", "", 0, 1),
		(8, 1, '.$id_shop.', "col-sm-4", "", 0, 1),
		(9, 2, '.$id_shop.', "col-sm-3", "", 0, 1),
		(10, 3, '.$id_shop.', "col-sm-3", "", 0, 1),
		(11, 3, '.$id_shop.', "col-sm-3", "", 0, 1),
		(12, 3, '.$id_shop.', "col-sm-3", "", 0, 1),
		(13, 3, '.$id_shop.', "col-sm-3", "", 0, 1)
		;');
		
		$return &= Db::getInstance()->Execute('INSERT IGNORE INTO `'._DB_PREFIX_.'labmegamenu_item` (`id_item`, `id_column`, `type_link`, `type_item`, `id_product`, `position`, `active`) VALUES 
		(1, 1, 1, "1", 0, 0, 1),
		(2, 1, 1, "2", 0, 0, 1),
		(3, 1, 1, "2", 0, 0, 1),
		(4, 1, 1, "2", 0, 0, 1),
		(5, 1, 1, "2", 0, 0, 1),
		(6, 1, 1, "2", 0, 0, 1),
		(9, 2, 1, "1", 0, 0, 1),
		(10, 2, 1, "2", 0, 0, 1),
		(11, 2, 1, "2", 0, 0, 1),
		(12, 2, 1, "2", 0, 0, 1),
		(13, 2, 1, "2", 0, 0, 1),
		(14, 2, 1, "2", 0, 0, 1),
		(17, 3, 3, "2", 0, 0, 1),
		(23, 4, 3, "2", 0, 0, 1),
		(48, 8, 1, "1", 0, 0, 1),
		(49, 8, 1, "2", 0, 0, 1),
		(50, 8, 1, "2", 0, 0, 1),
		(51, 8, 1, "2", 0, 0, 1),
		(52, 8, 1, "2", 0, 0, 1),
		(53, 8, 1, "2", 0, 0, 1),
		(54, 7, 3, "2", 0, 0, 1),
		(55, 9, 3, "2", 0, 0, 1),
		(56, 10, 1, "1", 0, 0, 1),
		(57, 11, 1, "1", 0, 0, 1),
		(58, 12, 1, "1", 0, 0, 1),
		(59, 13, 1, "1", 0, 0, 1),
		(60, 10, 1, "2", 0, 0, 1),
		(61, 10, 1, "2", 0, 0, 1),
		(62, 10, 1, "2", 0, 0, 1),
		(63, 10, 1, "2", 0, 0, 1),
		(64, 11, 1, "2", 0, 0, 1),
		(65, 11, 1, "2", 0, 0, 1),
		(66, 11, 1, "2", 0, 0, 1),
		(67, 11, 1, "2", 0, 0, 1),
		(68, 12, 1, "2", 0, 0, 1),
		(69, 12, 1, "2", 0, 0, 1),
		(70, 12, 1, "2", 0, 0, 1),
		(71, 12, 1, "2", 0, 0, 1),
		(72, 13, 1, "2", 0, 0, 1),
		(73, 13, 1, "2", 0, 0, 1),
		(74, 13, 1, "2", 0, 0, 1),
		(75, 13, 1, "2", 0, 0, 1)
		
		;');
		
		$return &= Db::getInstance()->Execute('INSERT IGNORE INTO `'._DB_PREFIX_.'labmegamenu_item_shop` (`id_item`, `id_column`, `id_shop`, `type_link`, `type_item`, `id_product`, `position`, `active`) VALUES 
		(1, 1, '.$id_shop.', 1, "1", 0, 0, 1),
		(2, 1, '.$id_shop.', 1, "2", 0, 0, 1),
		(3, 1, '.$id_shop.', 1, "2", 0, 0, 1),
		(4, 1, '.$id_shop.', 1, "2", 0, 0, 1),
		(5, 1, '.$id_shop.', 1, "2", 0, 0, 1),
		(6, 1, '.$id_shop.', 1, "2", 0, 0, 1),
		(9, 2, '.$id_shop.', 1, "1", 0, 0, 1),
		(10, 2, '.$id_shop.', 1, "2", 0, 0, 1),
		(11, 2, '.$id_shop.', 1, "2", 0, 0, 1),
		(12, 2, '.$id_shop.', 1, "2", 0, 0, 1),
		(13, 2, '.$id_shop.', 1, "2", 0, 0, 1),
		(14, 2, '.$id_shop.', 1, "2", 0, 0, 1),
		(17, 3, '.$id_shop.', 3, "2", 0, 0, 1),
		(23, 4, '.$id_shop.', 3, "2", 0, 0, 1),
		(48, 8, '.$id_shop.', 1, "1", 0, 0, 1),
		(49, 8, '.$id_shop.', 1, "2", 0, 0, 1),
		(50, 8, '.$id_shop.', 1, "2", 0, 0, 1),
		(51, 8, '.$id_shop.', 1, "2", 0, 0, 1),
		(52, 8, '.$id_shop.', 1, "2", 0, 0, 1),
		(53, 8, '.$id_shop.', 1, "2", 0, 0, 1),
		(54, 7, '.$id_shop.', 3, "2", 0, 0, 1),
		(55, 9, '.$id_shop.', 3, "2", 0, 0, 1),
		(56, 10, '.$id_shop.', 1, "1", 0, 0, 1),
		(57, 11, '.$id_shop.', 1, "1", 0, 0, 1),
		(58, 12, '.$id_shop.', 1, "1", 0, 0, 1),
		(59, 13, '.$id_shop.', 1, "1", 0, 0, 1),
		(60, 10, '.$id_shop.', 1, "2", 0, 0, 1),
		(61, 10, '.$id_shop.', 1, "2", 0, 0, 1),
		(62, 10, '.$id_shop.', 1, "2", 0, 0, 1),
		(63, 10, '.$id_shop.', 1, "2", 0, 0, 1),
		(64, 11, '.$id_shop.', 1, "2", 0, 0, 1),
		(65, 11, '.$id_shop.', 1, "2", 0, 0, 1),
		(66, 11, '.$id_shop.', 1, "2", 0, 0, 1),
		(67, 11, '.$id_shop.', 1, "2", 0, 0, 1),
		(68, 12, '.$id_shop.', 1, "2", 0, 0, 1),
		(69, 12, '.$id_shop.', 1, "2", 0, 0, 1),
		(70, 12, '.$id_shop.', 1, "2", 0, 0, 1),
		(71, 12, '.$id_shop.', 1, "2", 0, 0, 1),
		(72, 13, '.$id_shop.', 1, "2", 0, 0, 1),
		(73, 13, '.$id_shop.', 1, "2", 0, 0, 1),
		(74, 13, '.$id_shop.', 1, "2", 0, 0, 1),
		(75, 13, '.$id_shop.', 1, "2", 0, 0, 1)
		
		;');
		
		foreach ($languages as $language)
		{
			$return &= Db::getInstance()->Execute('INSERT IGNORE INTO `'._DB_PREFIX_.'labmegamenu_lang` (`id_labmegamenu`, `id_shop`, `id_lang`, `title`, `link`, `subtitle`) VALUES 
			(1, '.$id_shop.', '.$language['id_lang'].', "PAGindex", "PAGindex", ""),
			(2, '.$id_shop.', '.$language['id_lang'].', "CAT3", "CAT3", ""),
			(3, '.$id_shop.', '.$language['id_lang'].', "CAT4", "CAT4", ""),
			(4, '.$id_shop.', '.$language['id_lang'].', "CAT8", "CAT8", ""),
			(5, '.$id_shop.', '.$language['id_lang'].', " BUY THEME!", "#", "")
			
			;');
			
			$return &= Db::getInstance()->Execute('INSERT IGNORE INTO `'._DB_PREFIX_.'labmegamenu_item_lang` (`id_item`, `id_shop`, `id_lang`, `title`, `link`, `text`) VALUES 
			(1, '.$id_shop.', '.$language['id_lang'].', "CAT3", "CAT3", ""),
			(2, '.$id_shop.', '.$language['id_lang'].', "CAT5", "CAT5", ""),
			(3, '.$id_shop.', '.$language['id_lang'].', "CAT9", "CAT9", ""),
			(4, '.$id_shop.', '.$language['id_lang'].', "CAT7", "CAT7", ""),
			(5, '.$id_shop.', '.$language['id_lang'].', "CAT9", "CAT9", ""),
			(6, '.$id_shop.', '.$language['id_lang'].', "CAT10", "CAT10", ""),
			(9, '.$id_shop.', '.$language['id_lang'].', "CAT8", "CAT8", ""),
			(10, '.$id_shop.', '.$language['id_lang'].', "CAT9", "CAT9", ""),
			(11, '.$id_shop.', '.$language['id_lang'].', "CAT10", "CAT10", ""),
			(12, '.$id_shop.', '.$language['id_lang'].', "CAT5", "CAT5", ""),
			(13, '.$id_shop.', '.$language['id_lang'].', "CAT11", "CAT11", ""),
			(14, '.$id_shop.', '.$language['id_lang'].', "CAT7", "CAT7", ""),
			(17, '.$id_shop.', '.$language['id_lang'].', "", "#", "<div class=\"img\"><a href=\"#\" title=\"\"><img src=\"{lab_menu_h_url}img\/cms\/img_menu1.jpg\" alt=\"\" /></a></div>"),
			(23, '.$id_shop.', '.$language['id_lang'].', "", "#", "<div class=\"img\"><a href=\"#\" title=\"\"><img src=\"{lab_menu_h_url}img\/cms\/img_menu2.jpg\" alt=\"\" /></a></div>"),
			(48, '.$id_shop.', '.$language['id_lang'].', "CAT4", "CAT4", ""),
			(49, '.$id_shop.', '.$language['id_lang'].', "CAT5", "CAT5", ""),
			(50, '.$id_shop.', '.$language['id_lang'].', "CAT7", "CAT7", ""),
			(51, '.$id_shop.', '.$language['id_lang'].', "CAT9", "CAT9", ""),
			(52, '.$id_shop.', '.$language['id_lang'].', "CAT11", "CAT11", ""),
			(53, '.$id_shop.', '.$language['id_lang'].', "CAT7", "CAT7", ""),
			(54, '.$id_shop.', '.$language['id_lang'].', "", "#", "<div class=\"img\"><a href=\"#\" title=\"\"><img src=\"{lab_menu_h_url}img\/cms\/img_menu3.jpg\" alt=\"\" /></a></div>"),
			(55, '.$id_shop.', '.$language['id_lang'].', "", "#", "<div class=\"img\"><a href=\"#\" title=\"\"><img src=\"{lab_menu_h_url}img\/cms\/img_menu4.jpg\" alt=\"\" /></a></div>"),
			(56, '.$id_shop.', '.$language['id_lang'].', "CAT3", "CAT3", ""),
			(57, '.$id_shop.', '.$language['id_lang'].', "CAT4", "CAT4", ""),
			(58, '.$id_shop.', '.$language['id_lang'].', "CAT8", "CAT8", ""),
			(59, '.$id_shop.', '.$language['id_lang'].', "CAT7", "CAT7", ""),
			(60, '.$id_shop.', '.$language['id_lang'].', "CAT4", "CAT4", ""),
			(61, '.$id_shop.', '.$language['id_lang'].', "CAT7", "CAT7", ""),
			(62, '.$id_shop.', '.$language['id_lang'].', "CAT9", "CAT9", ""),
			(63, '.$id_shop.', '.$language['id_lang'].', "CAT11", "CAT11", ""),
			(64, '.$id_shop.', '.$language['id_lang'].', "CAT5", "CAT5", ""),
			(65, '.$id_shop.', '.$language['id_lang'].', "CAT7", "CAT7", ""),
			(66, '.$id_shop.', '.$language['id_lang'].', "CAT10", "CAT10", ""),
			(67, '.$id_shop.', '.$language['id_lang'].', "CAT9", "CAT9", ""),
			(68, '.$id_shop.', '.$language['id_lang'].', "CAT4", "CAT4", ""),
			(69, '.$id_shop.', '.$language['id_lang'].', "CAT7", "CAT7", ""),
			(70, '.$id_shop.', '.$language['id_lang'].', "CAT9", "CAT9", ""),
			(71, '.$id_shop.', '.$language['id_lang'].', "CAT10", "CAT10", ""),
			(72, '.$id_shop.', '.$language['id_lang'].', "CAT11", "CAT11", ""),
			(73, '.$id_shop.', '.$language['id_lang'].', "CAT10", "CAT10", ""),
			(74, '.$id_shop.', '.$language['id_lang'].', "CAT9", "CAT9", ""),
			(75, '.$id_shop.', '.$language['id_lang'].', "CAT5", "CAT5", "")
			
			;');
		}
		return $return;
	}
}
?>