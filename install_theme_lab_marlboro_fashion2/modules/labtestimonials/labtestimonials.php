<?php
if(!defined('_PS_VERSION_'))
exit;
include_once(_PS_MODULE_DIR_.'labtestimonials/defined.php');
include_once(_PS_MODULE_DIR_.'labtestimonials/libs/Params.php');
include_once(_PS_MODULE_DIR_.'labtestimonials/classes/LabTestimonial.php');
class labtestimonials extends Module {
	public $bootstrap = true ;
	private $_html = '';
	private $_configs = '';
	protected $params = null;
	public function __construct(){
		$this->name 	= 'labtestimonials';
		$this->tab	= 'front_office_features';
		$this->version= '1.0';
		$this->author 	= 'labersthemes';
		$this->need_instance = 0;
		$this->bootstrap = true;
		$this->secure_key = Tools::encrypt($this->name);
		parent::__construct();
		$this->displayName = $this->l('Lab Testimonials Module');
		$this->description = $this->l('Lab Testimonials Module.');
		$this->_params =new LabParams( $this->name, $this);
	}
	public function initConfigs(){
		return array(
			'test_limit' => 10,
			'type_image' => 'png|jpg|gif',
			'type_video' => 'flv|mp4|avi',
			'size_limit' => 6,
			'captcha' => 1,
			'auto_post' => 1,
                        'show_background' => 1
		);
	}

	public function getContent(){
		$this->_html .= '<h2>'.$this->displayName.' and Custom Fields.</h2>';
                $css = "<style>#background-images-thumbnails img {max-width:400px; height:auto;}</style>";
		if (Tools::isSubmit('submitUpdate')){
			if ($this->_postValidation()){
				$configs = $this->initConfigs();
				$res = $this->_params->batchUpdate( $configs );
				if (!$res){
					$this->_html .= $this->displayError($this->l('Configuration could not be updated'));
				}
				else{
					$this->_html .= $this->displayConfirmation($this->l('Configuration updated'));
				}
			}
                        $id_shop = (int)$this->context->shop->id;

			if (isset($_FILES['background']) && isset($_FILES['background']['tmp_name']) && !empty($_FILES['background']['tmp_name'])) {
				$img = dirname(__FILE__).'/img/background_'.$id_shop.'.jpg';
				if (file_exists($img))
					unlink($img);
				
				if ($error = ImageManager::validateUpload($_FILES['background'], Tools::convertBytes(ini_get('upload_max_filesize'))))
					$this->_html .= $error;

				elseif (!($tmp_name = tempnam(_PS_TMP_IMG_DIR_, 'PS')) || !move_uploaded_file($_FILES['background']['tmp_name'], $tmp_name))
					return false;			

				elseif (!ImageManager::resize($tmp_name, $img))
					$this->_html .= $this->displayError($this->l('An error occurred while attempting to upload the image.'));

				if (isset($tmp_name))
					unlink($tmp_name);

			}
			$this->_clearCache($this->name.'.tpl');
		}
		return $this->_html.$css.$this->initForm();
	}
	protected function initForm()
	{       $rev = date("H").date("i").date("s")."\n";
		$background = "";
		if (file_exists(dirname(__FILE__).'/img/background_'.$this->context->shop->id.'.jpg'))
			$background = '<br/>
                                            <img id="image_desc" style="clear:both;border:1px solid black;" alt="" src="'.$this->_path."/img/background_".$this->context->shop->id.".jpg".'" />
                                        <br/>';
                $image = dirname(__FILE__)."/img/background_".$this->context->shop->id.'.jpg';
		$image_size = file_exists($image) ? filesize($image) / 1000 : false;
		$configs = $this->initConfigs();
		$params = $this->_params;
		$this->fields_form[0]['form'] = array(
			'legend' => array(
			'title' => $this->l('Global Setting'),
			'icon' => 'icon-cogs'
		),
		'input' => array(
			$params->inputTags('test_limit','Testimonial Limit:','','The number items on a page.'),
			$params->inputTags('type_image','Image type:','','allow upload image type.'),
			$params->inputTags('type_video','Video type:','','allow upload video type.'),
			$params->inputTags('size_limit','Size limit upload:','','Mb .Max size file upload.'),
			$params->switchTags('captcha','Display captcha:'),
			$params->switchTags('auto_post','Admin approve','Admin can set enable or disable auto post'),
                        $params->switchTags('show_background','Show background image:'),
                        $params->fileTags('background','background image:','',$background,$image_size),
		),
		'submit' => array(
			'title' => $this->l('Save'),
		)
		);
		$helper = new HelperForm();
		$helper->show_toolbar = false;
		$helper->table =$this->table;
		$helper->identifier = $this->identifier;
		$helper->submit_action = 'submitUpdate';
		$helper->currentIndex = $this->context->link->getAdminLink('AdminModules', false).'&configure='.$this->name.'&tab_module='.$this->tab.'&module_name='.$this->name;
		$helper->token = Tools::getAdminTokenLite('AdminModules');
		$helper->tpl_vars = array(
			'fields_value' => $params->getConfigFieldsValues($configs),
			'languages' => $this->context->controller->getLanguages(),
			'id_language' => $this->context->language->id
		);
		return $helper->generateForm($this->fields_form);
	}

	public function _postValidation(){
		$errors = array();
		if(Tools::isSubmit('submitUpdate')){
			if(!Tools::getValue(('test_limit')) || !Validate::isInt(Tools::getValue('test_limit')))
				$errors[] = $this->l('False! Check again with testimonial limit.');
			if(!Tools::getValue('size_limit') || !Validate::isInt(Tools::getValue('size_limit')))
				$errors[] = $this->l('False! Check again with size upload limit.');
		}
		if (count($errors)) {
			$this->_html .= $this->displayError(implode('<br />',$errors));
			return false;
		}
		return true;
	}
	public function getParams(){
		return $this->_params;
	}
	public function install(){
		 if (parent::install() && $this->registerHook('header') && $this->registerHook('labtestimonials')) {
			$res = $this->installDb();
			$res &= $this->installModuleTab('Manage Testimonial', 'AdminTestimonial', 'AdminLabMenu');
			$configs = $this->initConfigs();
			$this->_params->batchUpdate( $configs );
			return (bool)$res;
		}
		return false;
	}
	public function uninstall(){
		if (parent::uninstall()){
			$res = $this->uninstallDb();
			$res &= $this->uninstallModuleTab('AdminTestimonial');
			$res &= $this->unregisterHook('labtestimonials');
                        
			return (bool)$res;
		}
		return false;
	}
public function installDb(){
			$res = Db::getInstance()->execute(
				'CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'labtestimonials` (
				`id_labtestimonials` int(11) NOT NULL AUTO_INCREMENT,
				`name_post` varchar(100) NOT NULL,
				`email` varchar(100) NOT NULL,
				`company` varchar(255) DEFAULT NULL,
				`address` varchar(500) NOT NULL,
				`media_link` varchar(500) DEFAULT NULL,
				`media_link_id` varchar(20) DEFAULT NULL,
				`media` varchar(255) DEFAULT NULL,
				`media_type` varchar(25) DEFAULT NULL,
				`content` text NOT NULL,
				`date_add` datetime DEFAULT NULL,
				`active` tinyint(1) DEFAULT NULL,
				`position` int(11) DEFAULT NULL ,
				PRIMARY KEY (`id_labtestimonials`)
			) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1'
			);
			
		if ($res)
				$res &= Db::getInstance()->execute(
					'CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'labtestimonials_shop` (
						`id_labtestimonials` int(10) unsigned NOT NULL,
						`id_shop` int(10) unsigned NOT NULL,
						PRIMARY KEY (`id_labtestimonials`,`id_shop`)
					) ENGINE=InnoDB DEFAULT CHARSET=utf8');
			
        $sql = "INSERT INTO `"._DB_PREFIX_."labtestimonials` (`id_labtestimonials`, `name_post`, `email`, `company`, `address`, `media_link`, `media_link_id`, `media`, `media_type`, `content`, `date_add`, `active`, `position`) VALUES
			('1','labthemes','demo@labertheme.com','CEO & Founder DooTr','labtheme',NULL,NULL,'850-img_testimo.jpg','jpg','Bacon ipsum dolor sit amet ut nostrud chuck, voluptate adipisicing fugiat ex spare ribs.  \r\n      Incididunt sint officia non cow, ut et. Cillum porchetta tongue occaecat “','2016-04-09 09:43:51','1','0'),
			('2','labthemes','demo@labertheme.com','CEO & Founder Doobros','labtheme',NULL,NULL,'731-img_testimo.jpg','jpg','Bacon ipsum dolor sit amet ut nostrud chuck, voluptate adipisicing fugiat ex spare ribs.  \r\n      Incididunt sint officia non cow, ut et. Cillum porchetta tongue occaecat “','2016-04-09 09:44:20','1','1'),
			('3','labthemes','demo@labertheme.com','CEO & Founder DooTr','labtheme',NULL,NULL,'842-img_testimo.jpg','jpg','Bacon ipsum dolor sit amet ut nostrud chuck, voluptate adipisicing fugiat ex spare ribs.  \r\n      Incididunt sint officia non cow, ut et. Cillum porchetta tongue occaecat “','2016-04-09 09:45:21','1','2')
			
		";
        $sql1 = "INSERT INTO `"._DB_PREFIX_."labtestimonials_shop` (`id_labtestimonials`, `id_shop`) VALUES
			('1','1'),
			('2','1'),
			('3','1')
			
		";
        
		if ($res){
              $res &=  Db::getInstance()->Execute($sql);
              $res &=  Db::getInstance()->Execute($sql1);
        }
			return (bool)$res;
}
		private function uninstallDb() {
			Db::getInstance()->execute('DROP TABLE `'._DB_PREFIX_.'labtestimonials`');
			Db::getInstance()->execute('DROP TABLE `'._DB_PREFIX_.'labtestimonials_shop`');
			return true;
		}
	private function installModuleTab($title, $class = 'AdminTestimonial', $parent = '') {
		$id_parent = 0;
		if ( $parent != '') {
			$id_parent = Tab::getIdFromClassName($parent);
		}
		$tab = new Tab();
		$tab->class_name = $class;
		$tab->module = $this->name;
		$tab->id_parent = intval($id_parent);
		$langs = Language::getLanguages(false);
		foreach ($langs as $l) {
			$tab->name[$l['id_lang']] = $title;
		}
		return $tab->add();
	}

	private function uninstallModuleTab($tabClass = 'AdminTestimonial') {
		$idTab = Tab::getIdFromClassName($tabClass);
	if ($idTab != 0) {
		$tab = new Tab($idTab);
		$tab->delete();
		return true;
	}
	return false;
	}
	public function hookHeader()
	{
		$this->context->controller->addCSS(_MODULE_DIR_._FIELD_TESTIMONIAL_FRONT_URL_.'css/style.css');
		$this->context->controller->addJS(_MODULE_DIR_._FIELD_TESTIMONIAL_FRONT_URL_.'js/jquery.cycle.all.js');
		$this->context->controller->addJqueryPlugin('fancybox');
		$this->context->controller->addJS(_MODULE_DIR_._FIELD_TESTIMONIAL_FRONT_URL_.'js/fancybox_media.js');
	}
	public function hookLeftColumn($params){
		
		$testLimit = $this->getParams()->get('testLimit');
		$get_testimonials = LabTestimonial::getAllTestimonials($testLimit);
		$img_types = explode('|', $this->getParams()->get('type_image'));
		$video_types = explode('|', $this->getParams()->get('type_video'));
		$iframeMedia = _MODULE_DIR_.$this->name.'/process_iframe.php';
		$mediaUrl = _MODULE_DIR_.$this->name.'/img/';
		$video_post = _MODULE_DIR_._FIELD_TESTIMONIAL_FRONT_URL_.'img/video.jpg';
		$video_youtube = _MODULE_DIR_._FIELD_TESTIMONIAL_FRONT_URL_.'img/youtube.jpg';
		$video_vimeo = _MODULE_DIR_._FIELD_TESTIMONIAL_FRONT_URL_.'img/vimeo.jpg';
                $background = "";
                $show_background = $this->getParams()->get('show_background');
                $rev = date("H").date("i").date("s")."\n";
                if (file_exists(dirname(__FILE__).'/img/background_'.$this->context->shop->id.'.jpg'))
                        $background = "img/background_".$this->context->shop->id.".jpg?".$rev;
		$this->context->smarty->assign(array(
		'testimonials' => $get_testimonials,
		'arr_img_type' => $img_types,
		'video_types' => $video_types,
		'mediaUrl' => $mediaUrl,
		'iframe' => $iframeMedia,
		'video_post' => $video_post,
		'video_youtube'=> $video_youtube,
		'video_vimeo'=> $video_vimeo,
		'iframeMedia'=> $iframeMedia,
                'background'=> $background,
                'show_background'=> $show_background
		));
		return $this->display(__FILE__, _FIELD_TESTIMONIAL_VIEW_FRONT_.'testimonials_random.tpl');
	}
        
        public function hooklabtestimonials($params){
		$testLimit = $this->getParams()->get('testLimit');
		$get_testimonials = LabTestimonial::getAllTestimonials($testLimit);
		$img_types = explode('|', $this->getParams()->get('type_image'));
		$video_types = explode('|', $this->getParams()->get('type_video'));
		$iframeMedia = _MODULE_DIR_.$this->name.'/process_iframe.php';
		$mediaUrl = _MODULE_DIR_.$this->name.'/img/';
		$video_post = _MODULE_DIR_._FIELD_TESTIMONIAL_FRONT_URL_.'img/video.jpg';
		$video_youtube = _MODULE_DIR_._FIELD_TESTIMONIAL_FRONT_URL_.'img/youtube.jpg';
		$video_vimeo = _MODULE_DIR_._FIELD_TESTIMONIAL_FRONT_URL_.'img/vimeo.jpg';
                $background = "";
                $show_background = $this->getParams()->get('show_background');
                if (file_exists(dirname(__FILE__).'/img/background_'.$this->context->shop->id.'.jpg'))
                        $background = "img/background_".$this->context->shop->id.".jpg";
		$this->context->smarty->assign(array(
		'testimonials' => $get_testimonials,
		'arr_img_type' => $img_types,
		'video_types' => $video_types,
		'mediaUrl' => $mediaUrl,
		'iframe' => $iframeMedia,
		'video_post' => $video_post,
		'video_youtube'=> $video_youtube,
		'video_vimeo'=> $video_vimeo,
		'iframeMedia'=> $iframeMedia,
                'background'=> $background,
                'show_background'=> $show_background
		));
		return $this->display(__FILE__, _FIELD_TESTIMONIAL_VIEW_FRONT_.'testimonials_random.tpl');
	}
}
