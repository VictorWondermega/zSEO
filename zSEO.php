<?php
// version: 1
namespace za\zSEO;

// ザガタ。六 /////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////

class zSEO {
	/* Zagata.SEO */
	
	/////////////////////////////// 
	// funcs

	/////////////////////////////// 
	public function tmplts() {
		$vrs = $this->za->mm('vrs')[0];
		$tmp = $this->za->mm('vis');
		if($tmp) {
			
			$tmp[0]['tmplts'][] = './zSEO/seo.xsl';
			
			if(isset($vrs['rss'])) { 
				$tmp[0]['page']['ca'] = 'rss'; 
				// $tmp[0]['hdrs'] = array('content-type: application/rss+xml; charset=utf-8');
				$tmp[0]['hdrs'] = array('content-type: application/xml; charset=utf-8');
				$ix = count($this->za->x);
				for($i=0;$i<$ix;$i++) { if(isset($this->za->x[$i]['lbd'])) {
						$this->za->x[$i]['rsslbd'] = date('r',$this->za->x[$i]['lbd']);
				} else {} }
			} elseif(isset($vrs['yamanifest.json'])) { 
				$tmp[0]['page']['ca'] = 'yamanifest.json'; 
				$tmp[0]['hdrs'] = array('content-type: application/json; charset=utf-8');
			} elseif(isset($vrs['manifest.json'])) { 
				$tmp[0]['page']['ca'] = 'manifest.json'; 
				$tmp[0]['hdrs'] = array('content-type: application/manifest+json; charset=utf-8');
			}elseif(isset($vrs['sitemap.xml'])) { 
				$tmp[0]['page']['ca'] = 'sitemap.xml'; 
				$tmp[0]['hdrs'] = array('content-type: application/xml; charset=utf-8');
			}elseif(isset($vrs['browserconfig.xml'])) { 
				$tmp[0]['page']['ca'] = 'browserconfig.xml'; 
				$tmp[0]['hdrs'] = array('content-type: application/xml; charset=utf-8');
			} else {			
				$tmp[0]['page']['hdr']['seo'] = array();
			}
			$this->za->mm('vis',$tmp[0]);
		} else { }
	}

	/////////////////////////////// 
	// ini
	function __construct($za,$a=false,$n=false) {
		$this->za = $za;
		$this->n = (($n)?$n:'zSEO');
		// $this->za->msg('dbg','zSEO','i am '.$this->n.'(zSEO)');

		// how to add specials to sys before zR? 
		$tmp = $za->mm(array('vrs','sys'));
		$tmp['url']['browserconfig.xml'] = 0;
		$tmp['url']['yamanifest.json'] = 0;
		$tmp['url']['manifest.json'] = 0;
		$tmp['url']['sitemap.xml'] = 0;
		$tmp['url']['rss'] = 0;
		$za->mm(array('vrs','sys'),$tmp);

		$za->ee('vis',array($this,'tmplts'));
	}
}

////////////////////////////////////////////////////////////////

if(class_exists('\zlo')) {
	\zlo::da('zSEO');
} elseif(realpath(__FILE__) == realpath($_SERVER['DOCUMENT_ROOT'].$_SERVER['SCRIPT_NAME'])) {
	header("content-type: text/plain;charset=utf-8");
	exit('zSEO');
} else {}

?>
