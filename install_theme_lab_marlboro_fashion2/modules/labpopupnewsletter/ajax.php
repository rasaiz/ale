<?php
require_once(dirname(__FILE__).'/../../config/config.inc.php');
require_once(dirname(__FILE__).'/../../init.php');
include(dirname(__FILE__).'/labpopupnewsletter.php');
$ppp = new LabPopupNewsletter();

if (Tools::getValue('email') != "") {
	echo $ppp->newsletterRegistration(Tools::getValue('email'));
}
