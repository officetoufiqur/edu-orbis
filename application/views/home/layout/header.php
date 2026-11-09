<div class="container main_website">
    
                    <!--============================
                            elitesDesign_header Start
                    ==============================-->
					
					
        <header class="elitesDesign_banner">
											            <div class="banner">
                <a href="/"><img src="<?php echo base_url('uploads/frontend/images/' . $cms_setting['main_logo']); ?>" alt=""></a>
            </div>   
			
        </header>

         
                    
                    <!--============================
                            elitesDesign_header End
                    ==============================-->
                    
            
            
            										                   <div class="mobile-logo">
                           <a href="/">  <img src="<?php echo base_url('uploads/frontend/images/' . $cms_setting['mobile_logo']); ?>" alt=""> </a>
                        </div>
									                    
                    
                    
                    <!--=======================
                        Menu-section-Start
                    ==========================--> 
             
                    
                    
    <div class="menu-section" id="myHeader">
        
                 



                        <div class="stellarnav"><ul id="menu-main-menu" class="menu">
						
						<li id="menu-item-147" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-home menu-item-147">
						
						
						<a href="/" aria-current="page"><i class="las la-home"></i> হোম </a></li>





<?php
							$school = $this->uri->segment(1);
							$result = $this->home_model->menuList($school);
							foreach ($result as $key => $row) {
								$active_menu 	= '';
								$submenu 		= '';
								$op_new_tab 	= '';
								$submenu_active = '';
								$currentURL 	= base_url(uri_string());
								
								if ($currentURL == $row['url']) {
									$active_menu = ' active';
								}
								if (!empty($row['submenu']) && is_array($row['submenu'])) {
									$submenu = ' dropdown';
									$arrayURL = array_column($row['submenu'],'url');
									if (in_array($currentURL, $arrayURL)) {
										$submenu_active = ' active';
									}
									$row['title'] = $row['title'] . '<span class="arrow"></span>';
								}
                                if ($row['open_new_tab']) {
                                    $op_new_tab = "target='_blank'";
                                }
								if ($cms_setting['online_admission'] == 0 && $row['alias'] == 'admission') continue;
							?>
<li id="menu-item-183" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-183" <?php echo $op_new_tab; ?>><a href="<?php echo $row['url']; ?>"><?php echo $row['title']; ?></a>

<?php if (!empty($row['submenu'])) { ?>
<ul class="sub-menu">
</li>
										<?php foreach ($row['submenu'] as $row2) { 
											$active_menu 	= '';
											$op_new_tab 	= '';
											if ($currentURL == $row2['url']) {
												$active_menu = ' active';
											}
			                                if ($row2['open_new_tab']) {
			                                    $op_new_tab = "target='_blank'";
			                                }
											?>
	<li id="menu-item-239" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-239"><a href="<?php echo $row2['url']; ?>"> <?php echo $row2['title']; ?> </a>
	</li>
	<?php } ?>
</ul>
<?php } ?>



</li>


<?php } ?>





					<?php 
					$homeURL = base_url($cms_setting['url_alias']);
					if (!is_loggedin()) { 
				        $authenticationURL = base_url($cms_setting['url_alias'] . '/authentication');
				        $saasExisting = $this->app_lib->isExistingAddon('saas');
				        if ($saasExisting && $this->db->table_exists("custom_domain")) {
				            $getDomain = $this->home_model->getCurrentDomain();
				            if(!empty($getDomain)) {
				                $authenticationURL = base_url('authentication');
				            }
				        } ?>


<li id="menu-item-148" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-148"><a href="#">লগইন</a>
<ul class="sub-menu">
	<li id="menu-item-155" class="menu-item menu-item-type-taxonomy menu-item-object-teacherscat menu-item-155"><a href="<?php echo base_url('authentication'); ?>">শিক্ষক লগ-ইন</a></li>
		<li id="menu-item-156" class="menu-item menu-item-type-taxonomy menu-item-object-teacherscat menu-item-156"><a href="<?php echo base_url('authentication'); ?>">স্টাফ লগ-ইন</a></li>
	<li id="menu-item-156" class="menu-item menu-item-type-taxonomy menu-item-object-teacherscat menu-item-156"><a href="<?php echo base_url('authentication'); ?>">শিক্ষাথী লগ-ইন</a></li>
		<li id="menu-item-156" class="menu-item menu-item-type-taxonomy menu-item-object-teacherscat menu-item-156"><a href="<?php echo base_url('authentication'); ?>">অভিভাবগ লগ-ইন</a></li>
</ul>
</li>
<?php } else { ?>

<li id="menu-item-148" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-148"><a href="#">ড্যাশবোর্ড</a>
<ul class="sub-menu">
	<li id="menu-item-155" class="menu-item menu-item-type-taxonomy menu-item-object-teacherscat menu-item-155"><a href="<?php echo base_url('dashboard'); ?>">আমার ড্যাশবোর্ড</a></li>
</ul>
</li>





<?php } ?>






</ul></div>    
    
    

                </div>
                
                	  
                
      
                
                
 
                    <!--=======================
                        Menu-section-End
                    ==========================--> 