<?php

// Security
if (!defined('_PS_VERSION_'))
    exit;

// Checking compatibility with older PrestaShop and fixing it
if (!defined('_MYSQL_ENGINE_'))
    define('_MYSQL_ENGINE_', 'MyISAM');

// Loading Models
require_once(_PS_MODULE_DIR_ . 'labmanagerblocks/models/Managerblock.php');

class Labmanagerblocks extends Module {
    public  $hookAssign   = array();
    public $_staticModel =  "";
    public function __construct() {
        $this->name = 'labmanagerblocks';
        $this->tab = 'front_office_features';
        $this->version = '1.0';
        $this->author = 'Labersthemes';
        $this->need_instance = 0;
        $this->ps_versions_compliancy = array('min' => '1.5', 'max' => '1.6');
        $this->hookAssign = array('rightcolumn','leftcolumn','home','top','footer','extraLeft');
        $this->_staticModel = new ManagerBlock();
        parent::__construct();
        $this->displayName = $this->l('Lab Static Block');
        $this->description = $this->l('Manager Content Blocks');
        $this->confirmUninstall = $this->l('Are you sure you want to uninstall?');
        $this->admin_tpl_path = _PS_MODULE_DIR_ . $this->name . '/views/templates/admin/';
    }

    public function install() {

        // Install SQL
		$res = $this->installDb();
          // Install Tabs
		if(!(int)Tab::getIdFromClassName('AdminLabMenu')) {
			$parent_tab = new Tab();
			// Need a foreach for the language
			$parent_tab->name[$this->context->language->id] = $this->l('Lab Module');
			$parent_tab->class_name = 'AdminLabMenu';
			$parent_tab->id_parent = 0; // Home tab
			$parent_tab->module = $this->name;
			$parent_tab->add();
		}


        $tab = new Tab();
        // Need a foreach for the language
	foreach (Language::getLanguages() as $language)
            $tab->name[$language['id_lang']] = $this->l('Manage Static blocks');
        $tab->class_name = 'AdminLabManagerBlocks';
        $tab->id_parent = (int)Tab::getIdFromClassName('AdminLabMenu'); 
        $tab->module = $this->name;
        $tab->add();
        // Set some defaults
        return parent::install() &&
                $this->registerHook('displayNav') &&
                $this->registerHook('top') &&
                $this->registerHook('labSearch') &&
                $this->registerHook('blockPosition1') &&
				$this->registerHook('blockPosition2') &&
				$this->registerHook('blockPosition3') &&
				$this->registerHook('blockPosition4') &&
				$this->registerHook('blockPosition5') &&
				$this->registerHook('blockPosition6') &&
				$this->registerHook('smartBlog') &&
				$this->registerHook('labtestimonials') &&
				$this->registerHook('labmegamenu') &&
				$this->registerHook('bannerSlide') &&
                $this->registerHook('leftColumn') &&
                $this->registerHook('rightColumn') &&
                $this->registerHook('home') &&
                $this->registerHook('footer') &&
                $this->registerHook('displayHeader')&&
                $this->registerHook('displayBackOfficeHeader');
				
		return (bool)$res;
    }
	
    public function uninstall() {

        Configuration::deleteByName('labmanagerblocks');
		$res = $this->uninstallDb();
	
        $tab = new Tab((int) Tab::getIdFromClassName('Adminlabmanagerblocks'));
        $tab->delete();

        // Uninstall Module
        if (!parent::uninstall())
            return false;
        return true;
		return (bool)$res;
    }

	/* database */
public function installDb(){
        $res = Db::getInstance()->execute(
            'CREATE TABLE IF NOT EXISTS `' . _DB_PREFIX_ . 'lab_managerblock` (
			  `id_labmanagerblock` int(10) unsigned NOT NULL AUTO_INCREMENT,
			  `identify` varchar(128) NOT NULL,
			  `hook_position` varchar(128) NOT NULL,
			  `name_module` varchar(128) NOT NULL,
			  `hook_module` varchar(128) NOT NULL,
			  `position` int(10) unsigned NOT NULL,
			  `insert_module` int(10) unsigned NOT NULL,
			  `active` int(10) unsigned NOT NULL,
			  `showhook` int(10) unsigned NOT NULL,
			  PRIMARY KEY (`id_labmanagerblock`)
			) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 '
        );
        if ($res)
            $res &= Db::getInstance()->execute(
                'CREATE TABLE IF NOT EXISTS `' . _DB_PREFIX_ . 'lab_managerblock_lang` (
			  `id_labmanagerblock` int(11) unsigned NOT NULL,
			  `id_lang` int(11) unsigned NOT NULL,
			  `title` varchar(128) NOT NULL,
			  `description` longtext,
			  PRIMARY KEY (`id_labmanagerblock`,`id_lang`)
			) ENGINE=InnoDB DEFAULT CHARSET=utf8');
		if ($res)
            $res &= Db::getInstance()->execute(
                'CREATE TABLE IF NOT EXISTS `' . _DB_PREFIX_ . 'lab_managerblock_shop` (
				  `id_labmanagerblock` int(11) unsigned NOT NULL,
				  `id_shop` int(11) unsigned NOT NULL,
				  PRIMARY KEY (`id_labmanagerblock`,`id_shop`)
				) ENGINE=InnoDB DEFAULT CHARSET=utf8');
		
		$sql =  "INSERT INTO `"._DB_PREFIX_."lab_managerblock` (`id_labmanagerblock`, `identify`, `hook_position`, `name_module`, `hook_module`, `position`, `insert_module`, `active`, `showhook`) VALUES
			('1','html-static','blockPosition2','Chose Module','displayTop','0','0','0','1'),
			('2','html-static','labtestimonials','Chose Module','displayTop','0','0','0','1'),
			('3','html-static','smartBlog','Chose Module','displayTop','0','0','0','1'),
			('4','html-static','blockPosition1','Chose Module','displayTop','0','0','0','1'),
			('5','html-static','blockPosition3','Chose Module','displayTop','0','0','0','1')
																					
												
			";
        $sql1 = "INSERT INTO `"._DB_PREFIX_."lab_managerblock_lang` (`id_labmanagerblock`, `id_lang`, `title`, `description`) VALUES
			
			('1','1','Awesome our products','<div class=\"lab-title-custtom\">\r\n<p>A</p>\r\n<h2>Awesome our products</h2>\r\n<span>Select a style that you want and make you look so cool !</span></div>'),
			('1','2','Awesome our products','<div class=\"lab-title-custtom\">\r\n<p>A</p>\r\n<h2>Awesome our products</h2>\r\n<span>Select a style that you want and make you look so cool !</span></div>'),
			('2','1','what they say','<div class=\"lab-title-custtom\">\r\n<p>T</p>\r\n<h2>what they say</h2>\r\n<span>Recognition determines success and power</span></div>'),
			('2','2','what they say','<div class=\"lab-title-custtom\">\r\n<p>T</p>\r\n<h2>what they say</h2>\r\n<span>Recognition determines success and power</span></div>'),
			('3','1','From the blog','<div class=\"lab-title-custtom\">\r\n<p>B</p>\r\n<h2>From the blog</h2>\r\n<span>Fashion trends, latest fashion ideas & style tips</span></div>'),
			('3','2','From the blog','<div class=\"lab-title-custtom\">\r\n<p>B</p>\r\n<h2>From the blog</h2>\r\n<span>Fashion trends, latest fashion ideas & style tips</span></div>'),
			('4','1','banner static block','<div class=\"lab_static \">\r\n<div class=\" col-lg-3 col-md-3 col-sm-3 col-xs-12\">\r\n<div class=\"row\">\r\n<div class=\"img\"><a title=\"\" href=\"#\"><img src=\"/lab_marlboro/img/cms/img1_home2.jpg\" alt=\"images\" /></a>\r\n<div class=\"static-text\">\r\n<h4>Women</h4>\r\n<p>Designed in-house in our London studio by our dedicated menswear team.</p>\r\n<a href=\"#\">explore now</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\" col-lg-6 col-md-6 col-sm-6 col-xs-12\">\r\n<div class=\"row\">\r\n<div class=\"img\"><a title=\"\" href=\"#\"><img src=\"/lab_marlboro/img/cms/img2_home2.jpg\" alt=\"images\" /></a>\r\n<div class=\"static-text\">\r\n<h4>Fashion collection</h4>\r\n<p>Designed in-house in our London studio by our dedicated menswear team.</p>\r\n<a href=\"#\">explore now</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\" col-lg-3 col-md-3 col-sm-3 col-xs-12\">\r\n<div class=\"row\">\r\n<div class=\"img\"><a title=\"\" href=\"#\"><img src=\"/lab_marlboro/img/cms/img3_home2.jpg\" alt=\"images\" /></a>\r\n<div class=\"static-text\">\r\n<h4>Men</h4>\r\n<p>Designed in-house in our London studio by our dedicated menswear team.</p>\r\n<a href=\"#\">explore now</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>'),
			('4','2','banner static block','<div class=\"lab_static \">\r\n<div class=\" col-lg-3 col-md-3 col-sm-3 col-xs-12\">\r\n<div class=\"row\">\r\n<div class=\"img\"><a title=\"\" href=\"#\"><img src=\"/lab_marlboro/img/cms/img1_home2.jpg\" alt=\"images\" /></a>\r\n<div class=\"static-text\">\r\n<h4>Women</h4>\r\n<p>Designed in-house in our London studio by our dedicated menswear team.</p>\r\n<a href=\"#\">explore now</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\" col-lg-6 col-md-6 col-sm-6 col-xs-12\">\r\n<div class=\"row\">\r\n<div class=\"img\"><a title=\"\" href=\"#\"><img src=\"/lab_marlboro/img/cms/img2_home2.jpg\" alt=\"images\" /></a>\r\n<div class=\"static-text\">\r\n<h4>Fashion collection</h4>\r\n<p>Designed in-house in our London studio by our dedicated menswear team.</p>\r\n<a href=\"#\">explore now</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\" col-lg-3 col-md-3 col-sm-3 col-xs-12\">\r\n<div class=\"row\">\r\n<div class=\"img\"><a title=\"\" href=\"#\"><img src=\"/lab_marlboro/img/cms/img3_home2.jpg\" alt=\"images\" /></a>\r\n<div class=\"static-text\">\r\n<h4>Men</h4>\r\n<p>Designed in-house in our London studio by our dedicated menswear team.</p>\r\n<a href=\"#\">explore now</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>'),
			('5','1','banner static blockPosition3','<div class=\"lab_static\">\r\n<div class=\"img\"><a title=\"\" href=\"#\"><img src=\"/lab_marlboro/img/cms/img4_home2.png\" alt=\"images\" /></a></div>\r\n</div>'),
			('5','2','banner static blockPosition3','<div class=\"lab_static\">\r\n<div class=\"img\"><a title=\"\" href=\"#\"><img src=\"/lab_marlboro/img/cms/img4_home2.png\" alt=\"images\" /></a></div>\r\n</div>')

			
						
";
        $sql2 = "INSERT INTO `"._DB_PREFIX_."lab_managerblock_shop` (`id_labmanagerblock`, `id_shop`) VALUES
			('1','1'),
			('2','1'),
			('3','1'),
			('4','1'),
			('5','1')
			
			
			";
        
		if ($res){
              $res &=  Db::getInstance()->Execute($sql);
              $res &=  Db::getInstance()->Execute($sql1);
              $res &=  Db::getInstance()->Execute($sql2);
        }
        return (bool)$res;
}

private function uninstallDb() {
    Db::getInstance()->execute('DROP TABLE `'._DB_PREFIX_.'lab_managerblock`');
    Db::getInstance()->execute('DROP TABLE `'._DB_PREFIX_.'lab_managerblock_lang`');
    Db::getInstance()->execute('DROP TABLE `'._DB_PREFIX_.'lab_managerblock_shop`');
    return true;
}

/*  */
    
    public function hookdisplayNav($param) {
        $id_shop = (int)Context::getContext()->shop->id;
        $staticBlocks = $this->_staticModel->getStaticblockLists($id_shop,'displayNav');
        if(count($staticBlocks)<1) return null;
        $this->smarty->assign(array(
            'staticblocks' => $staticBlocks,
        ));
       return $this->display(__FILE__, 'block.tpl');
    }
	public function hookdisplayTop($param) {
        $id_shop = (int)Context::getContext()->shop->id;
        $staticBlocks = $this->_staticModel->getStaticblockLists($id_shop,'displayTop');
        if(count($staticBlocks)<1) return null;
        $this->smarty->assign(array(
            'staticblocks' => $staticBlocks,
        ));
       return $this->display(__FILE__, 'block.tpl');
    }
    
    public function hookdisplayLeftColumn($param) {
       $id_shop = (int)Context::getContext()->shop->id;
        $staticBlocks = $this->_staticModel->getStaticblockLists($id_shop,'displayLeftColumn');
        if(count($staticBlocks)<1) return null;
        $this->smarty->assign(array(
            'staticblocks' => $staticBlocks,
        ));
       return $this->display(__FILE__, 'block.tpl');
    }
    
     public function hookRightColumn($param) { 
        $id_shop = (int)Context::getContext()->shop->id;
        $staticBlocks = $this->_staticModel->getStaticblockLists($id_shop,'displayRightColumn');
        $this->smarty->assign(array(
            'staticblocks' => $staticBlocks,
        ));
       return $this->display(__FILE__, 'block.tpl');
    }
    
    public function hookdisplayFooter($param) { 
        $id_shop = (int)Context::getContext()->shop->id;
        $staticBlocks = $this->_staticModel->getStaticblockLists($id_shop,'displayFooter');
        if(count($staticBlocks)<1) return null;
        $this->smarty->assign(array(
            'staticblocks' => $staticBlocks,
        ));
       return $this->display(__FILE__, 'block.tpl');
    }
    
    public function hookdisplayHome($param) {
        $id_shop = (int)Context::getContext()->shop->id;
        $staticBlocks = $this->_staticModel->getStaticblockLists($id_shop,'displayHome');
        if(count($staticBlocks)<1) return null;
        //if(is_array($staticBlocks))
        $this->smarty->assign(array(
            'staticblocks' => $staticBlocks,
        ));
       return $this->display(__FILE__, 'block.tpl');
    }
    
    public function hookblockPosition1($param) {
        $id_shop = (int)Context::getContext()->shop->id;
        $staticBlocks = $this->_staticModel->getStaticblockLists($id_shop,'blockPosition1');
        if(count($staticBlocks)<1) return null;
        //if(is_array($staticBlocks))
        $this->smarty->assign(array(
            'staticblocks' => $staticBlocks,
        ));
       return $this->display(__FILE__, 'block.tpl');
    }
	public function hooklabSearch($param) {
        $id_shop = (int)Context::getContext()->shop->id;
        $staticBlocks = $this->_staticModel->getStaticblockLists($id_shop,'labSearch');
        if(count($staticBlocks)<1) return null;
        //if(is_array($staticBlocks))
        $this->smarty->assign(array(
            'staticblocks' => $staticBlocks,
        ));
       return $this->display(__FILE__, 'block.tpl');
    }
    
    public function hookblockPosition2($param) {
        $id_shop = (int)Context::getContext()->shop->id;
        $staticBlocks = $this->_staticModel->getStaticblockLists($id_shop,'blockPosition2');
        if(count($staticBlocks)<1) return null;
        //if(is_array($staticBlocks))
        $this->smarty->assign(array(
            'staticblocks' => $staticBlocks,
        ));
       return $this->display(__FILE__, 'block.tpl');
    }
    
    public function hookblockPosition3($param) {
        $id_shop = (int)Context::getContext()->shop->id;
        $staticBlocks = $this->_staticModel->getStaticblockLists($id_shop,'blockPosition3');
        if(count($staticBlocks)<1) return null;
        //if(is_array($staticBlocks))
        $this->smarty->assign(array(
            'staticblocks' => $staticBlocks,
        ));
       return $this->display(__FILE__, 'block.tpl');
    }
	public function hookblockPosition4($param) {
        $id_shop = (int)Context::getContext()->shop->id;
        $staticBlocks = $this->_staticModel->getStaticblockLists($id_shop,'blockPosition4');
        if(count($staticBlocks)<1) return null;
        //if(is_array($staticBlocks))
        $this->smarty->assign(array(
            'staticblocks' => $staticBlocks,
        ));
       return $this->display(__FILE__, 'block.tpl');
    }
	public function hooklabmegamenu($param) {
        $id_shop = (int)Context::getContext()->shop->id;
        $staticBlocks = $this->_staticModel->getStaticblockLists($id_shop,'labmegamenu');
        if(count($staticBlocks)<1) return null;
        //if(is_array($staticBlocks))
        $this->smarty->assign(array(
            'staticblocks' => $staticBlocks,
        ));
       return $this->display(__FILE__, 'block.tpl');
    }
    public function hookbannerSlide($param) {
        $id_shop = (int)Context::getContext()->shop->id;
        $staticBlocks = $this->_staticModel->getStaticblockLists($id_shop,'bannerSlide');
        if(count($staticBlocks)<1) return null;
        //if(is_array($staticBlocks))
        $this->smarty->assign(array(
            'staticblocks' => $staticBlocks,
        ));
       return $this->display(__FILE__, 'block.tpl');
    }
	public function hooksmartBlog($param) {
        $id_shop = (int)Context::getContext()->shop->id;
        $staticBlocks = $this->_staticModel->getStaticblockLists($id_shop,'smartBlog');
        if(count($staticBlocks)<1) return null;
        //if(is_array($staticBlocks))
        $this->smarty->assign(array(
            'staticblocks' => $staticBlocks,
        ));
       return $this->display(__FILE__, 'block.tpl');
    }
	public function hooklabtestimonials($param) {
        $id_shop = (int)Context::getContext()->shop->id;
        $staticBlocks = $this->_staticModel->getStaticblockLists($id_shop,'labtestimonials');
        if(count($staticBlocks)<1) return null;
        //if(is_array($staticBlocks))
        $this->smarty->assign(array(
            'staticblocks' => $staticBlocks,
        ));
       return $this->display(__FILE__, 'block.tpl');
    }
	public function hookblockPosition5($param) {
        $id_shop = (int)Context::getContext()->shop->id;
        $staticBlocks = $this->_staticModel->getStaticblockLists($id_shop,'blockPosition5');
        if(count($staticBlocks)<1) return null;
        //if(is_array($staticBlocks))
        $this->smarty->assign(array(
            'staticblocks' => $staticBlocks,
        ));
       return $this->display(__FILE__, 'block.tpl');
    }
	public function hookblockPosition6($param) {
        $id_shop = (int)Context::getContext()->shop->id;
        $staticBlocks = $this->_staticModel->getStaticblockLists($id_shop,'blockPosition6');
        if(count($staticBlocks)<1) return null;
        //if(is_array($staticBlocks))
        $this->smarty->assign(array(
            'staticblocks' => $staticBlocks,
        ));
       return $this->display(__FILE__, 'block.tpl');
    }
    
     public function hookDisplayBackOfficeHeader($params) {
		if (method_exists($this->context->controller, 'addJquery'))
		{        
		$this->context->controller->addJquery();
		$this->context->controller->addJS(($this->_path).'js/staticblock.js');
		}
		return $this->display(__FILE__, 'views/templates/admin/fortawesome.tpl');
    }
    
    
    public function getModulById($id_module) {
        return Db::getInstance()->getRow('
            SELECT m.*
            FROM `' . _DB_PREFIX_ . 'module` m
            JOIN `' . _DB_PREFIX_ . 'module_shop` ms ON (m.`id_module` = ms.`id_module` AND ms.`id_shop` = ' . (int) ($this->context->shop->id) . ')
            WHERE m.`id_module` = ' . $id_module);
    }

    public function getHooksByModuleId($id_module) {
        $module = self::getModulById($id_module);
        $moduleInstance = Module::getInstanceByName($module['name']);
        $hooks = array();
        if ($this->hookAssign)
            foreach ($this->hookAssign as $hook) {
                if (_PS_VERSION_ < "1.5") {
                    if (is_callable(array($moduleInstance, 'hook' . $hook))) {
                        $hooks[] = $hook;
                    }
                } else {
                    $retro_hook_name = Hook::getRetroHookName($hook);
                    if (is_callable(array($moduleInstance, 'hook' . $hook)) || is_callable(array($moduleInstance, 'hook' . $retro_hook_name))) {
                        $hooks[] = $retro_hook_name;
                    }
                }
            }
        $results = self::getHookByArrName($hooks);
        return $results;
    }

    public static function getHookByArrName($arrName) {
        $result = Db::getInstance()->ExecuteS('
		SELECT `id_hook`, `name`
		FROM `' . _DB_PREFIX_ . 'hook` 
		WHERE `name` IN (\'' . implode("','", $arrName) . '\')');
        return $result;
    }
  //$hooks = $this->getHooksByModuleId(10);
    public function getListModuleInstalled() {
        $mod = new labmanagerblocks();
        $modules = $mod->getModulesInstalled(0);
        $arrayModule = array();
        foreach($modules as $key => $module) {
            if($module['active']==1) {
                $arrayModule[0] = array('id_module'=>0, 'name'=>'Chose Module');
                $arrayModule[$key] = $module;
            }
        }
        if ($arrayModule)
            return $arrayModule;
        return array();
    }
    
    private function _installHookCustomer(){
		$hookspos = array(
				'displayNav',
				'labSearch',
				'blockPosition1',
				'blockPosition2',
				'blockPosition3',
				'blockPosition4',
				'blockPosition5',
				'blockPosition6',
				'smartBlog',
				'labtestimonials',
				'labmegamenu',
				'bannerSlide'
			); 
		foreach( $hookspos as $hook ){
			if( Hook::getIdByName($hook) ){
				
			} else {
				$new_hook = new Hook();
				$new_hook->name = pSQL($hook);
				$new_hook->title = pSQL($hook);
				$new_hook->add();
				$id_hook = $new_hook->id;
			}
		}
		return true;
	}

}