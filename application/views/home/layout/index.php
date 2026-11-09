<!doctype html>
<html lang="en-US">
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
	   <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="keyword" content="<?php echo $page_data['meta_keyword']; ?>">
		<meta name="description" content="<?php echo $page_data['meta_description']; ?>">
        <!-- Favicon -->
		<link rel="shortcut icon" href="<?php echo base_url('uploads/frontend/images/' . $cms_setting['fav_icon']); ?>">
		<title><?php echo $page_data['page_title']; ?></title>
	
<style> 

body {
	background: #ffffff !important;
	color: #000000 !important;
	font-size: 18px !important;
	line-height: 1.4 !important;
	font-weight: 400;
	width:100%;
	font-family: 'Montserrat', 'SolaimanLipiNormal', sans-serif !important;
  
}



.course-btn .shop-page-btn  a {
	display: inline-block;
	background: #051939;
	padding: 5px 14px;
	font-size: 15px;
	text-transform: capitalize;
	font-weight: 600;
	color: #ffffff;
	border-radius: 50px;
	transition: .5s all;
}

.course-btn  a {
	display: inline-block;
	background: #051939;
	padding: 5px 14px;
	font-size: 15px;
	text-transform: capitalize;
	font-weight: 600;
	color: #ffffff;
	border-radius: 50px;
	transition: .5s all;
}

.elitesDesign_logo {
	padding: 10px 0;
	background: #ffffff;
	color : #000000;
}

.menu-section {
	background: <?php echo $cms_setting['menu_color'] ?>;
	-webkit-box-shadow: 0 3px 6px rgba(0,0,0,0.3);
	box-shadow: 0 1px 2px rgba(0,0,0,0.3);
	position: relative;
	border-bottom: 3px solid #800505;
}

.stellarnav.dark li a {
	color: #ffffff;
}

.stellarnav > ul > li > a {
	padding : 15px 10px 15px 10px;
	font-weight: 500;
	font-size: 18px;
	border-bottom: none;
}

.sticky {
	 
	position: static !important;
		width: 100%;
	top: 0;
	left: 0;
	z-index: 999;
	-webkit-transition: .8s all;
	-o-transition: .8s all;
	transition: .8s all;
}

.footer-section {
	background: <?php echo $cms_setting['footer_background_color'] ?>;
	padding: 60px 30px;
}

.footer_color a {
	color: #ffffff;
	font-size : 18px;
}
.footer_color {
	font-size : 18px;
	color: #ffffff;
}

.bottom-footer-section {
	background: <?php echo $cms_setting['copyright_bg_color'] ?>;
	padding: 15px 0;
	color: #ffffff;
}

.bottom-footer-section a {
	color: #ffffff;
}

#scroll5-left {
	position: relative;
	width: auto;
	height: 40px;
	padding-top: 8px;
	padding-left: 10px;
	margin: 0;
	padding-right: 10px;
	background: <?php echo $cms_setting['primary_color'] ?>;
	color: #ffffff;
	font-weight: 400;
	font-size: 18px;

}


#scroll5-left::before {
	position: absolute;
	right: -20px;
	bottom: 0;
	content: "";
	width: 0;
	height: 0;
	border-left: 20px solid <?php echo $cms_setting['primary_color'] ?>;
	border-top: 20px solid transparent;
	border-bottom: 20px solid transparent;
}

.scroolbar5 {
	background: <?php echo $cms_setting['primary_color'] ?>;
	color: #ffffff;
	position: absolute !important;
	right: 0;
	top: 0;
	float: right;
	width: 59px;
	height: 40px;
	cursor: pointer;
}

.scroolbar5::after {
	position: absolute;
	top: 0;
	right: 100%;
	content: '';
	height: 0;
	width: 0;
	border-bottom: 40px solid <?php echo $cms_setting['primary_color'] ?>;
	border-left: 16px solid transparent;
	display: inline-block;	
}

.about-title {
	background: <?php echo $cms_setting['primary_color'] ?>;
	color: #ffffff;
	font-size: 20px;
	padding: 10px;
	margin-bottom: 7px;
	text-transform: capitalize;

}

.academic_information ul li a {
	display: inline-block;
	text-decoration: none;
	font-weight: normal;
	font-size: 17px;
	border: 2px solid  <?php echo $cms_setting['primary_color'] ?>;
	padding: 10px;
	width: 100%;
	color: <?php echo $cms_setting['primary_color'] ?>;
	text-transform: capitalize;
	transition: .8s all;
}

.notic_board_title {
	background: <?php echo $cms_setting['primary_color'] ?>;
	padding: 8px;
	font-size: 20px;
	text-transform: capitalize;
	color: #ffffff;
	margin-top: 25px;
	font-weight: normal;
}

.oLink_litle {
	background: <?php echo $cms_setting['primary_color'] ?>;
	color: #ffffff;
	padding: 5px 10px;
	font-size: 20px;
	letter-spacing: 0.3px;
}

.elitesDesign_scroll {
	width: 42px;
	height: 52px;
	padding: 10px;
	background: #051939;
	position: fixed;
	right: 25px;
	bottom: 70px;
	z-index: 9999;
	border-radius: 50px 50px 0px 0px;
}

.elitesDesign_scroll i {
	font-size: 26px;
	color: #ffffff;
	font-weight: 600;
	top: 15px;
	display: block;
	position: absolute;
	right: 0;
	left: 0;
	text-align: center;
}
.video-wrpp {
	background: #051939;
	padding: 5px;
	border-radius: 5px;
	color: #ffffff;
}

.video-title a {
	display: inline-block;
    width: 100%;
	color: #ffffff;
}

.table.table-bordered thead tr th {
	text-align: center;
	background: #051939;
	color: #ffffff;
	font-weight: 400;
	padding: 11px 0;
	border-bottom: none;
	letter-spacing: 0.3px;
}

.archive-btn > a {
	overflow: hidden;
	color: #ffffff;
	background: #051939;
	font-size: 16px;
	font-weight: 500;
	line-height: 1;
	padding: 10px 48px 11px 20px;
	display: inline-block;
	text-transform: capitalize;
	transition: all 0.4s ease-in-out;
	border-radius: 5px;
	transform-origin: inherit;
	position: relative;
}


.teacher_title {
	font-size: 40px;
	text-align: center;
	font-weight: 700;
	text-transform: uppercase;
	color: #051939;
}

.sec-title2 {
	color: #fff;
	font-size: 40px;
	font-weight: 800;
	letter-spacing: 1px;
	margin-bottom: 3px;
}
  

.sec-title {
	font-size: 40px;
	font-weight: 700;
	text-transform: uppercase;
	color: #051939;
}

.video-seciton-title {
	font-size:  40px;
	font-weight: 700;
	color: #fff;
	text-transform: uppercase;
}

.video-seciton {
	padding-top: 30px;
	padding-bottom: 70px;
	background: <?php echo $cms_setting['hover_color'] ?>;
	margin: 30px 0 5px 0;
}


.blog-title a {
	font-size: 20px;
	display: inline-block;
	color: #00215b;
	font-weight: 600;
	transition: .5s all;
}

.information-title1 {
	background:  #A53146;
	padding: 10px;
	font-size: 20px;
	text-transform: capitalize;
	color: #ffffff;
	margin:0;
}


.information-title2 {
	background:  #06874A;
	padding: 10px;
	font-size: 20px;
	text-transform: capitalize;
	color: #ffffff;
	margin:0;
}



.information-title3 {
	background: #965D03;
	padding: 10px;
	font-size: 20px;
	text-transform: capitalize;
	color: #ffffff;
	margin:0;
}


.information-title4 {
	background: #691475;
	padding: 10px;
	font-size: 20px;
	text-transform: capitalize;
	color: #ffffff;
	margin:0;
}
</style> 	
<script>
window._wpemojiSettings = {"baseUrl":"https:\/\/s.w.org\/images\/core\/emoji\/14.0.0\/72x72\/","ext":".png","svgUrl":"https:\/\/s.w.org\/images\/core\/emoji\/14.0.0\/svg\/","svgExt":".svg","source":{"concatemoji":"https:\/\/elitesDesign.net\/eschool\/wp-includes\/js\/wp-emoji-release.min.js?ver=6.4.1"}};
/*! This file is auto-generated */
!function(i,n){var o,s,e;function c(e){try{var t={supportTests:e,timestamp:(new Date).valueOf()};sessionStorage.setItem(o,JSON.stringify(t))}catch(e){}}function p(e,t,n){e.clearRect(0,0,e.canvas.width,e.canvas.height),e.fillText(t,0,0);var t=new Uint32Array(e.getImageData(0,0,e.canvas.width,e.canvas.height).data),r=(e.clearRect(0,0,e.canvas.width,e.canvas.height),e.fillText(n,0,0),new Uint32Array(e.getImageData(0,0,e.canvas.width,e.canvas.height).data));return t.every(function(e,t){return e===r[t]})}function u(e,t,n){switch(t){case"flag":return n(e,"\ud83c\udff3\ufe0f\u200d\u26a7\ufe0f","\ud83c\udff3\ufe0f\u200b\u26a7\ufe0f")?!1:!n(e,"\ud83c\uddfa\ud83c\uddf3","\ud83c\uddfa\u200b\ud83c\uddf3")&&!n(e,"\ud83c\udff4\udb40\udc67\udb40\udc62\udb40\udc65\udb40\udc6e\udb40\udc67\udb40\udc7f","\ud83c\udff4\u200b\udb40\udc67\u200b\udb40\udc62\u200b\udb40\udc65\u200b\udb40\udc6e\u200b\udb40\udc67\u200b\udb40\udc7f");case"emoji":return!n(e,"\ud83e\udef1\ud83c\udffb\u200d\ud83e\udef2\ud83c\udfff","\ud83e\udef1\ud83c\udffb\u200b\ud83e\udef2\ud83c\udfff")}return!1}function f(e,t,n){var r="undefined"!=typeof WorkerGlobalScope&&self instanceof WorkerGlobalScope?new OffscreenCanvas(300,150):i.createElement("canvas"),a=r.getContext("2d",{willReadFrequently:!0}),o=(a.textBaseline="top",a.font="600 32px Arial",{});return e.forEach(function(e){o[e]=t(a,e,n)}),o}function t(e){var t=i.createElement("script");t.src=e,t.defer=!0,i.head.appendChild(t)}"undefined"!=typeof Promise&&(o="wpEmojiSettingsSupports",s=["flag","emoji"],n.supports={everything:!0,everythingExceptFlag:!0},e=new Promise(function(e){i.addEventListener("DOMContentLoaded",e,{once:!0})}),new Promise(function(t){var n=function(){try{var e=JSON.parse(sessionStorage.getItem(o));if("object"==typeof e&&"number"==typeof e.timestamp&&(new Date).valueOf()<e.timestamp+604800&&"object"==typeof e.supportTests)return e.supportTests}catch(e){}return null}();if(!n){if("undefined"!=typeof Worker&&"undefined"!=typeof OffscreenCanvas&&"undefined"!=typeof URL&&URL.createObjectURL&&"undefined"!=typeof Blob)try{var e="postMessage("+f.toString()+"("+[JSON.stringify(s),u.toString(),p.toString()].join(",")+"));",r=new Blob([e],{type:"text/javascript"}),a=new Worker(URL.createObjectURL(r),{name:"wpTestEmojiSupports"});return void(a.onmessage=function(e){c(n=e.data),a.terminate(),t(n)})}catch(e){}c(n=f(s,u,p))}t(n)}).then(function(e){for(var t in e)n.supports[t]=e[t],n.supports.everything=n.supports.everything&&n.supports[t],"flag"!==t&&(n.supports.everythingExceptFlag=n.supports.everythingExceptFlag&&n.supports[t]);n.supports.everythingExceptFlag=n.supports.everythingExceptFlag&&!n.supports.flag,n.DOMReady=!1,n.readyCallback=function(){n.DOMReady=!0}}).then(function(){return e}).then(function(){var e;n.supports.everything||(n.readyCallback(),(e=n.source||{}).concatemoji?t(e.concatemoji):e.wpemoji&&e.twemoji&&(t(e.twemoji),t(e.wpemoji)))}))}((window,document),window._wpemojiSettings);
</script>
<style id='wp-emoji-styles-inline-css'>

	img.wp-smiley, img.emoji {
		display: inline !important;
		border: none !important;
		box-shadow: none !important;
		height: 1em !important;
		width: 1em !important;
		margin: 0 0.07em !important;
		vertical-align: -0.1em !important;
		background: none !important;
		padding: 0 !important;
	}
</style>
<link rel='stylesheet' id='wp-block-library-css' href='<?php echo base_url('assets/front/style.minaec2aec2.css?ver=6.4.1'); ?>' media='all' />
<style id='classic-theme-styles-inline-css'>
/*! This file is auto-generated */
.wp-block-button__link{color:#fff;background-color:#32373c;border-radius:9999px;box-shadow:none;text-decoration:none;padding:calc(.667em + 2px) calc(1.333em + 2px);font-size:1.125em}.wp-block-file__button{background:#32373c;color:#fff;text-decoration:none}
</style>
<style id='global-styles-inline-css'>
body{--wp--preset--color--black: #000000;--wp--preset--color--cyan-bluish-gray: #abb8c3;--wp--preset--color--white: #ffffff;--wp--preset--color--pale-pink: #f78da7;--wp--preset--color--vivid-red: #cf2e2e;--wp--preset--color--luminous-vivid-orange: #ff6900;--wp--preset--color--luminous-vivid-amber: #fcb900;--wp--preset--color--light-green-cyan: #7bdcb5;--wp--preset--color--vivid-green-cyan: #00d084;--wp--preset--color--pale-cyan-blue: #8ed1fc;--wp--preset--color--vivid-cyan-blue: #0693e3;--wp--preset--color--vivid-purple: #9b51e0;--wp--preset--gradient--vivid-cyan-blue-to-vivid-purple: linear-gradient(135deg,rgba(6,147,227,1) 0%,rgb(155,81,224) 100%);--wp--preset--gradient--light-green-cyan-to-vivid-green-cyan: linear-gradient(135deg,rgb(122,220,180) 0%,rgb(0,208,130) 100%);--wp--preset--gradient--luminous-vivid-amber-to-luminous-vivid-orange: linear-gradient(135deg,rgba(252,185,0,1) 0%,rgba(255,105,0,1) 100%);--wp--preset--gradient--luminous-vivid-orange-to-vivid-red: linear-gradient(135deg,rgba(255,105,0,1) 0%,rgb(207,46,46) 100%);--wp--preset--gradient--very-light-gray-to-cyan-bluish-gray: linear-gradient(135deg,rgb(238,238,238) 0%,rgb(169,184,195) 100%);--wp--preset--gradient--cool-to-warm-spectrum: linear-gradient(135deg,rgb(74,234,220) 0%,rgb(151,120,209) 20%,rgb(207,42,186) 40%,rgb(238,44,130) 60%,rgb(251,105,98) 80%,rgb(254,248,76) 100%);--wp--preset--gradient--blush-light-purple: linear-gradient(135deg,rgb(255,206,236) 0%,rgb(152,150,240) 100%);--wp--preset--gradient--blush-bordeaux: linear-gradient(135deg,rgb(254,205,165) 0%,rgb(254,45,45) 50%,rgb(107,0,62) 100%);--wp--preset--gradient--luminous-dusk: linear-gradient(135deg,rgb(255,203,112) 0%,rgb(199,81,192) 50%,rgb(65,88,208) 100%);--wp--preset--gradient--pale-ocean: linear-gradient(135deg,rgb(255,245,203) 0%,rgb(182,227,212) 50%,rgb(51,167,181) 100%);--wp--preset--gradient--electric-grass: linear-gradient(135deg,rgb(202,248,128) 0%,rgb(113,206,126) 100%);--wp--preset--gradient--midnight: linear-gradient(135deg,rgb(2,3,129) 0%,rgb(40,116,252) 100%);--wp--preset--font-size--small: 13px;--wp--preset--font-size--medium: 20px;--wp--preset--font-size--large: 36px;--wp--preset--font-size--x-large: 42px;--wp--preset--spacing--20: 0.44rem;--wp--preset--spacing--30: 0.67rem;--wp--preset--spacing--40: 1rem;--wp--preset--spacing--50: 1.5rem;--wp--preset--spacing--60: 2.25rem;--wp--preset--spacing--70: 3.38rem;--wp--preset--spacing--80: 5.06rem;--wp--preset--shadow--natural: 6px 6px 9px rgba(0, 0, 0, 0.2);--wp--preset--shadow--deep: 12px 12px 50px rgba(0, 0, 0, 0.4);--wp--preset--shadow--sharp: 6px 6px 0px rgba(0, 0, 0, 0.2);--wp--preset--shadow--outlined: 6px 6px 0px -3px rgba(255, 255, 255, 1), 6px 6px rgba(0, 0, 0, 1);--wp--preset--shadow--crisp: 6px 6px 0px rgba(0, 0, 0, 1);}:where(.is-layout-flex){gap: 0.5em;}:where(.is-layout-grid){gap: 0.5em;}body .is-layout-flow > .alignleft{float: left;margin-inline-start: 0;margin-inline-end: 2em;}body .is-layout-flow > .alignright{float: right;margin-inline-start: 2em;margin-inline-end: 0;}body .is-layout-flow > .aligncenter{margin-left: auto !important;margin-right: auto !important;}body .is-layout-constrained > .alignleft{float: left;margin-inline-start: 0;margin-inline-end: 2em;}body .is-layout-constrained > .alignright{float: right;margin-inline-start: 2em;margin-inline-end: 0;}body .is-layout-constrained > .aligncenter{margin-left: auto !important;margin-right: auto !important;}body .is-layout-constrained > :where(:not(.alignleft):not(.alignright):not(.alignfull)){max-width: var(--wp--style--global--content-size);margin-left: auto !important;margin-right: auto !important;}body .is-layout-constrained > .alignwide{max-width: var(--wp--style--global--wide-size);}body .is-layout-flex{display: flex;}body .is-layout-flex{flex-wrap: wrap;align-items: center;}body .is-layout-flex > *{margin: 0;}body .is-layout-grid{display: grid;}body .is-layout-grid > *{margin: 0;}:where(.wp-block-columns.is-layout-flex){gap: 2em;}:where(.wp-block-columns.is-layout-grid){gap: 2em;}:where(.wp-block-post-template.is-layout-flex){gap: 1.25em;}:where(.wp-block-post-template.is-layout-grid){gap: 1.25em;}.has-black-color{color: var(--wp--preset--color--black) !important;}.has-cyan-bluish-gray-color{color: var(--wp--preset--color--cyan-bluish-gray) !important;}.has-white-color{color: var(--wp--preset--color--white) !important;}.has-pale-pink-color{color: var(--wp--preset--color--pale-pink) !important;}.has-vivid-red-color{color: var(--wp--preset--color--vivid-red) !important;}.has-luminous-vivid-orange-color{color: var(--wp--preset--color--luminous-vivid-orange) !important;}.has-luminous-vivid-amber-color{color: var(--wp--preset--color--luminous-vivid-amber) !important;}.has-light-green-cyan-color{color: var(--wp--preset--color--light-green-cyan) !important;}.has-vivid-green-cyan-color{color: var(--wp--preset--color--vivid-green-cyan) !important;}.has-pale-cyan-blue-color{color: var(--wp--preset--color--pale-cyan-blue) !important;}.has-vivid-cyan-blue-color{color: var(--wp--preset--color--vivid-cyan-blue) !important;}.has-vivid-purple-color{color: var(--wp--preset--color--vivid-purple) !important;}.has-black-background-color{background-color: var(--wp--preset--color--black) !important;}.has-cyan-bluish-gray-background-color{background-color: var(--wp--preset--color--cyan-bluish-gray) !important;}.has-white-background-color{background-color: var(--wp--preset--color--white) !important;}.has-pale-pink-background-color{background-color: var(--wp--preset--color--pale-pink) !important;}.has-vivid-red-background-color{background-color: var(--wp--preset--color--vivid-red) !important;}.has-luminous-vivid-orange-background-color{background-color: var(--wp--preset--color--luminous-vivid-orange) !important;}.has-luminous-vivid-amber-background-color{background-color: var(--wp--preset--color--luminous-vivid-amber) !important;}.has-light-green-cyan-background-color{background-color: var(--wp--preset--color--light-green-cyan) !important;}.has-vivid-green-cyan-background-color{background-color: var(--wp--preset--color--vivid-green-cyan) !important;}.has-pale-cyan-blue-background-color{background-color: var(--wp--preset--color--pale-cyan-blue) !important;}.has-vivid-cyan-blue-background-color{background-color: var(--wp--preset--color--vivid-cyan-blue) !important;}.has-vivid-purple-background-color{background-color: var(--wp--preset--color--vivid-purple) !important;}.has-black-border-color{border-color: var(--wp--preset--color--black) !important;}.has-cyan-bluish-gray-border-color{border-color: var(--wp--preset--color--cyan-bluish-gray) !important;}.has-white-border-color{border-color: var(--wp--preset--color--white) !important;}.has-pale-pink-border-color{border-color: var(--wp--preset--color--pale-pink) !important;}.has-vivid-red-border-color{border-color: var(--wp--preset--color--vivid-red) !important;}.has-luminous-vivid-orange-border-color{border-color: var(--wp--preset--color--luminous-vivid-orange) !important;}.has-luminous-vivid-amber-border-color{border-color: var(--wp--preset--color--luminous-vivid-amber) !important;}.has-light-green-cyan-border-color{border-color: var(--wp--preset--color--light-green-cyan) !important;}.has-vivid-green-cyan-border-color{border-color: var(--wp--preset--color--vivid-green-cyan) !important;}.has-pale-cyan-blue-border-color{border-color: var(--wp--preset--color--pale-cyan-blue) !important;}.has-vivid-cyan-blue-border-color{border-color: var(--wp--preset--color--vivid-cyan-blue) !important;}.has-vivid-purple-border-color{border-color: var(--wp--preset--color--vivid-purple) !important;}.has-vivid-cyan-blue-to-vivid-purple-gradient-background{background: var(--wp--preset--gradient--vivid-cyan-blue-to-vivid-purple) !important;}.has-light-green-cyan-to-vivid-green-cyan-gradient-background{background: var(--wp--preset--gradient--light-green-cyan-to-vivid-green-cyan) !important;}.has-luminous-vivid-amber-to-luminous-vivid-orange-gradient-background{background: var(--wp--preset--gradient--luminous-vivid-amber-to-luminous-vivid-orange) !important;}.has-luminous-vivid-orange-to-vivid-red-gradient-background{background: var(--wp--preset--gradient--luminous-vivid-orange-to-vivid-red) !important;}.has-very-light-gray-to-cyan-bluish-gray-gradient-background{background: var(--wp--preset--gradient--very-light-gray-to-cyan-bluish-gray) !important;}.has-cool-to-warm-spectrum-gradient-background{background: var(--wp--preset--gradient--cool-to-warm-spectrum) !important;}.has-blush-light-purple-gradient-background{background: var(--wp--preset--gradient--blush-light-purple) !important;}.has-blush-bordeaux-gradient-background{background: var(--wp--preset--gradient--blush-bordeaux) !important;}.has-luminous-dusk-gradient-background{background: var(--wp--preset--gradient--luminous-dusk) !important;}.has-pale-ocean-gradient-background{background: var(--wp--preset--gradient--pale-ocean) !important;}.has-electric-grass-gradient-background{background: var(--wp--preset--gradient--electric-grass) !important;}.has-midnight-gradient-background{background: var(--wp--preset--gradient--midnight) !important;}.has-small-font-size{font-size: var(--wp--preset--font-size--small) !important;}.has-medium-font-size{font-size: var(--wp--preset--font-size--medium) !important;}.has-large-font-size{font-size: var(--wp--preset--font-size--large) !important;}.has-x-large-font-size{font-size: var(--wp--preset--font-size--x-large) !important;}
.wp-block-navigation a:where(:not(.wp-element-button)){color: inherit;}
:where(.wp-block-post-template.is-layout-flex){gap: 1.25em;}:where(.wp-block-post-template.is-layout-grid){gap: 1.25em;}
:where(.wp-block-columns.is-layout-flex){gap: 2em;}:where(.wp-block-columns.is-layout-grid){gap: 2em;}
.wp-block-pullquote{font-size: 1.5em;line-height: 1.6;}
</style>
<link rel='stylesheet' id='educare-style-css' href='<?php echo base_url('assets/front/style8a548a54.css?ver=1.0.0'); ?>' media='all' />
<link rel='stylesheet' id='educare-bootstrap-css' href='<?php echo base_url('assets/front/assets/css/bootstrap.min8a548a54.css?ver=1.0.0'); ?>' media='all' />
<link rel='stylesheet' id='educare-lineawesome-css' href='<?php echo base_url('assets/front/assets/css/line-awesome.min8a548a54.css?ver=1.0.0'); ?>' media='all' />
<link rel='stylesheet' id='educare-animate-css' href='<?php echo base_url('assets/front/assets/css/animate8a548a54.css?ver=1.0.0'); ?>' media='all' />
<link rel='stylesheet' id='educare-stellarnav-css' href='<?php echo base_url('assets/front/assets/css/stellarnav8a548a54.css?ver=1.0.0'); ?>' media='all' />
<link rel='stylesheet' id='educare-magnific-css' href='<?php echo base_url('assets/front/assets/css/magnific-popup8a548a54.css?ver=1.0.0'); ?>' media='all' />
<link rel='stylesheet' id='educare-carousel-css' href='<?php echo base_url('assets/front/assets/css/owl.carousel.min8a548a54.css?ver=1.0.0'); ?>' media='all' />
<link rel='stylesheet' id='educare-responsive-css' href='<?php echo base_url('assets/front/assets/css/responsive8a548a54.css?ver=1.0.0'); ?>' media='all' />
<script src="<?php echo base_url('assets/front/js/jquery/jquery.minf43bf43b.js?ver=3.7.1'); ?>" id="jquery-core-js"></script>
<script src="<?php echo base_url('assets/front/js/jquery/jquery-migrate.min55895589.js?ver=3.4.1'); ?>" id="jquery-migrate-js"></script>
<link rel="https://api.w.org/" href="index52f052f0.html?rest_route=/" /><link rel="EditURI" type="application/rsd+xml" title="RSD" href="xmlrpc0db00db0.html?rsd" />







<!-- Bootstrap -->
		<link href="<?php echo base_url() ?>assets/frontend/css/bootstrap.min.css" rel="stylesheet">
		<!-- Template CSS Files  -->
		<link rel="stylesheet" href="<?php echo base_url('assets/vendor/font-awesome/css/all.min.css'); ?>">
		<link rel="stylesheet" href="<?php echo base_url('assets/frontend/plugins/animate.min.css'); ?>">
		<link rel="stylesheet" href="<?php echo base_url('assets/frontend/css/responsive.css'); ?>">
		<link rel="stylesheet" href="<?php echo base_url('assets/frontend/css/owl.carousel.min.css'); ?>">
		<link rel="stylesheet" href="<?php echo base_url('assets/vendor/select2/css/select2.min.css'); ?>">
		<link rel="stylesheet" href="<?php echo base_url('assets/vendor/sweetalert/sweetalert-custom.css');?>">
		<link rel="stylesheet" href="<?php echo base_url('assets/vendor/bootstrap-datepicker/css/bootstrap-datepicker.standalone.css'); ?>">
		<link rel="stylesheet" href="<?php echo base_url('assets/vendor/bootstrap-fileupload/bootstrap-fileupload.min.css'); ?>">
		<link rel="stylesheet" href="<?php echo base_url('assets/frontend/plugins/magnific-popup/magnific-popup.css'); ?>">
		<link rel="stylesheet" href="<?php echo base_url('assets/frontend/css/style.css'); ?>">
		<script src="<?php echo base_url('assets/vendor/jquery/jquery.min.js'); ?>"></script>
		<!-- If user have enabled CSRF proctection this function will take care of the ajax requests and append custom header for CSRF -->
		<script type="text/javascript">
			var base_url = "<?php echo base_url(); ?>";
			var csrfData = <?php echo json_encode(csrf_jquery_token()); ?>;
			$(function($) {
				$.ajaxSetup({
					data: csrfData
				});
			});
		</script>
		<!-- Google Analytics --> 
		<?php echo $cms_setting['google_analytics']; ?>
		
		<!-- Theme Color Options -->
		<script type="text/javascript">
			document.documentElement.style.setProperty('--thm-primary', '<?php echo $cms_setting["primary_color"] ?>');
			document.documentElement.style.setProperty('--thm-hover', '<?php echo $cms_setting["hover_color"] ?>');
			document.documentElement.style.setProperty('--thm-text', '<?php echo $cms_setting["text_color"] ?>');
			document.documentElement.style.setProperty('--thm-secondary-text', '<?php echo $cms_setting["text_secondary_color"] ?>');
			document.documentElement.style.setProperty('--thm-footer-text', '<?php echo $cms_setting["footer_text_color"] ?>');
			document.documentElement.style.setProperty('--thm-radius', '<?php echo $cms_setting["border_radius"] ?>');
		</script>









</head>


<?php $this->load->view('home/layout/header'); ?>
<?php echo $main_contents; ?>
<?php $this->load->view('home/layout/footer'); ?>                

      



								


 
				
 
              
                   
               
                       
                    
                   


                      
                                      
                                      
                   
                

  

					
                     

<script src="<?php echo base_url('assets/front/assets/js/bootstrap.min8a548a54.js?ver=1.0.0'); ?>" id="educare-bootstrap-js"></script>
<script src="<?php echo base_url('assets/front/assets/js/bootstrap.bundle.min8a548a54.js?ver=1.0.0'); ?>" id="educare-bootstrapbundle-js"></script>
<script src="<?php echo base_url('assets/front/assets/js/stellarnav.min8a548a54.js?ver=1.0.0'); ?>" id="educare-stellarnav-js"></script>
<script src="<?php echo base_url('assets/front/assets/js/owl.carousel.min8a548a54.js?ver=1.0.0'); ?>" id="educare-carousel-js"></script>
<script src="<?php echo base_url('assets/front/assets/js/jquery.magnific-popup.min8a548a54.js?ver=1.0.0'); ?>" id="educare-magnific-js"></script>
<script src="<?php echo base_url('assets/front/assets/js/main8a548a54.js?ver=1.0.0'); ?>" id="educare-main-js"></script>
		
</div>

		
</body>
</html>      
