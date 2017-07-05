<?php

if (!defined('_PS_VERSION_'))
    exit;

class Posfeatureproduct extends Module {

    private $_html = '';
    private $_postErrors = array();

    function __construct() {
        $this->name = 'posfeatureproduct';
        $this->tab = 'front_office_features';
        $this->version = '1.1';
        $this->author = 'Posthemes';
        $this->need_instance = 0;
        $this->ps_versions_compliancy = array('min' => '1.5', 'max' => '1.6');
        parent::__construct();

        $this->displayName = $this->l('Featured products with slider on the homepage.');
        $this->description = $this->l('Displays featured products in any where of your homepage.');
    }

    function install() {
        $this->_clearCache('posfeatureproduct.tpl');
        Configuration::updateValue('POSFEATUREPRODUCT', 8);
        Configuration::updateValue($this->name . '_auto_slide', 0);
        Configuration::updateValue($this->name . '_speed_slide', '1000');
        Configuration::updateValue($this->name . '_a_speed', '600');
        Configuration::updateValue($this->name . '_show_price', 1);
        Configuration::updateValue($this->name . '_show_des', 0);
        Configuration::updateValue($this->name . '_qty_products', 12);
        Configuration::updateValue($this->name . '_qty_items', 4);
        Configuration::updateValue($this->name . '_width_item', 270);
        Configuration::updateValue($this->name . '_show_nextback', 1);
        Configuration::updateValue($this->name . '_show_control', 0);
        Configuration::updateValue($this->name . '_min_item', 4);
        Configuration::updateValue($this->name . '_max_item', 12);
        Configuration::updateValue($this->name . '_show_addtocart', 1);

        if (!parent::install()
                || !$this->registerHook('header')
                || !$this->registerHook('feature')
                || !$this->registerHook('addproduct')
                || !$this->registerHook('updateproduct')
                || !$this->registerHook('deleteproduct')
				|| !$this->registerHook('blockPosition1')
        )
            return false;
        return true;
    }

    public function uninstall() {
        Configuration::deleteByName($this->name . '_auto_slide');
        Configuration::deleteByName($this->name . '_speed_slide');
        Configuration::deleteByName($this->name . '_a_speed');
        Configuration::deleteByName($this->name . '_show_price');
        Configuration::deleteByName($this->name . '_show_des');
        Configuration::deleteByName($this->name . '_qty_products');
        Configuration::deleteByName($this->name . '_qty_items');
        Configuration::deleteByName($this->name . '_width_item');
        Configuration::deleteByName($this->name . '_show_nextback');
        Configuration::deleteByName($this->name . '_show_control');
        Configuration::deleteByName($this->name . '_min_item');
        Configuration::deleteByName($this->name . '_max_item');
        Configuration::deleteByName($this->name . '_show_addtocart');

        $this->_clearCache('posfeatureproduct.tpl');
        return parent::uninstall();
    }

    public function getContent() {
        $output = '<h2>' . $this->displayName . '</h2>';
        if (Tools::isSubmit('submitPostFeaturedProduct')) {
            if (!sizeof($this->_postErrors))
                $this->_postProcess();
            else {
                foreach ($this->_postErrors AS $err) {
                    $this->_html .= '<div class="alert error">' . $err . '</div>';
                }
            }
        }
        return $output . $this->_displayForm();
    }

    public function getSelectOptionsHtml($options = NULL, $name = NULL, $selected = NULL) {
        $html = "";
        $html .='<select name =' . $name . ' style="width:130px">';
        if (count($options) > 0) {
            foreach ($options as $key => $val) {
                if (trim($key) == trim($selected)) {
                    $html .='<option value=' . $key . ' selected="selected">' . $val . '</option>';
                } else {
                    $html .='<option value=' . $key . '>' . $val . '</option>';
                }
            }
        }
        $html .= '</select>';
        return $html;
    }

    private function _postProcess() {
        Configuration::updateValue($this->name . '_auto_slide', Tools::getValue('auto_slide'));
        Configuration::updateValue($this->name . '_speed_slide', Tools::getValue('speed_slide'));
        Configuration::updateValue($this->name . '_a_speed', Tools::getValue('a_speed'));
        Configuration::updateValue($this->name . '_show_price', Tools::getValue('show_price'));
        Configuration::updateValue($this->name . '_show_des', Tools::getValue('show_des'));
        Configuration::updateValue($this->name . '_qty_products', Tools::getValue('qty_products'));
        Configuration::updateValue($this->name . '_qty_items', Tools::getValue('qty_items'));
        Configuration::updateValue($this->name . '_width_item', Tools::getValue('width_item'));
        Configuration::updateValue($this->name . '_show_nextback', Tools::getValue('show_nextback'));
        Configuration::updateValue($this->name . '_show_control', Tools::getValue('show_control'));
        Configuration::updateValue($this->name . '_min_item', Tools::getValue('min_item'));
        Configuration::updateValue($this->name . '_max_item', Tools::getValue('max_item'));
        Configuration::updateValue($this->name . '_show_addtocart', Tools::getValue('show_addtocart'));



        $this->_html .= '<div class="conf confirm">' . $this->l('Settings updated') . '</div>';
    }

    private function _displayForm() {
        $this->_html .= '
		<form action="' . $_SERVER['REQUEST_URI'] . '" method="post">
                  <fieldset>
                    <legend><img src="../img/admin/cog.gif" alt="" class="middle" />' . $this->l('Settings') . '</legend>
                     <label>' . $this->l('Auto slide: ') . '</label>
                    <div class="margin-form">';
        $this->_html .= $this->getSelectOptionsHtml(array(0 => 'No', 1 => 'Yes'), 'auto_slide', (Tools::getValue('auto_slide') ? Tools::getValue('auto_slide') : Configuration::get($this->name . '_auto_slide')));
        $this->_html .='
                    </div>
                     <label>' . $this->l('Min Items: ') . '</label>
                    <div class="margin-form">
                            <input type = "text"  name="min_item" value =' . (Tools::getValue('min_item') ? Tools::getValue('min_item') : Configuration::get($this->name . '_min_item')) . ' ></input>
                    </div>
                    
                     <label>' . $this->l('Qty of Products: ') . '</label>
                    <div class="margin-form">
                            <input type = "text"  name="qty_products" value =' . (Tools::getValue('qty_products') ? Tools::getValue('qty_products') : Configuration::get($this->name . '_qty_products')) . ' ></input>
                    </div>
                    
                    <input type="submit" name="submitPostFeaturedProduct" value="' . $this->l('Update') . '" class="button" />
                     </fieldset>
		</form>';
        return $this->_html;
    }

    public function hookDisplayHeader($params) {
        $this->hookHeader($params);
    }

    public function hookHeader($params) {
        $this->context->controller->addCSS(($this->_path) . 'css/posfeatureproduct.css', 'all');
//                $this->context->controller->addJS($this->_path.'js/modernizr.custom.17475.js');
//                $this->context->controller->addJS($this->_path.'js/jquerypp.custom.js');
//                $this->context->controller->addJS($this->_path.'js/jquery.elastislide.js');
    }

    public function getSlideshowHtml() {

        if (!$this->isCached('posfeatureproduct.tpl', $this->getCacheId('posfeatureproduct'))) {
            $slideOptions = array(
                'auto_slide' => Configuration::get($this->name . '_auto_slide'),
                'speed_slide' => Configuration::get($this->name . '_speed_slide'),
                'a_speed' => Configuration::get($this->name . '_a_speed'),
                'show_price' => Configuration::get($this->name . '_show_price'),
                'show_des' => Configuration::get($this->name . '_show_des'),
                'qty_products' => Configuration::get($this->name . '_qty_products'),
                'qty_items' => Configuration::get($this->name . '_qty_items'),
                'width_item' => Configuration::get($this->name . '_width_item'),
                'show_nexback' => Configuration::get($this->name . '_show_nextback'),
                'show_control' => Configuration::get($this->name . '_show_control'),
                'min_item' => Configuration::get($this->name . '_min_item'),
                'max_item' => Configuration::get($this->name . '_max_item'),
                'show_addtocart' => Configuration::get($this->name . '_show_addtocart'),
            );
            //echo "<pre>"; print_r($slideOptions);
            $category = new Category(Context::getContext()->shop->getCategory(), (int) Context::getContext()->language->id);
            $nb = (int) Configuration::get($this->name . '_qty_products');
            $products = $category->getProducts((int) Context::getContext()->language->id, 1, ($nb ? $nb : 8));
            if(!$products) return ;
            $this->smarty->assign(array(
                'products' => $products,
                'add_prod_display' => Configuration::get('PS_ATTRIBUTE_CATEGORY_DISPLAY'),
                'homeSize' => Image::getSize(ImageType::getFormatedName('home')),
                'slideOptions' => $slideOptions
            ));
        }
        return $this->display(__FILE__, 'posfeatureproduct.tpl', $this->getCacheId('posfeatureproduct'));
    }

    public function hookfeature($params) {
        return $this->getSlideshowHtml();
    }
	public function hookblockPosition1($params) {
        return $this->getSlideshowHtml();
    }
	
	public function hookdisplayRightColumn($params) {
        return $this->getSlideshowHtml();
    }
	public function hookdisplayLeftColumn($params) {
        return $this->getSlideshowHtml();
    }
    public function hookAddProduct($params) {
        $this->_clearCache('posfeatureproduct.tpl');
    }

    public function hookUpdateProduct($params) {
        $this->_clearCache('posfeatureproduct.tpl');
    }

    public function hookDeleteProduct($params) {
        $this->_clearCache('posfeatureproduct.tpl');
    }

}
