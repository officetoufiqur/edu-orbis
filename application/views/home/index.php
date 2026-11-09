            <!--============Scroll 03 start==============-->
      
        
 
 
  <!--=========elitesDesign==============
                        Slider section Start
            =============elitesDesign=============-->  
        <div class="slider-section">
            <div class="slider-content">
                <div class="slider-active owl-carousel">
                    
							

            <?php
			foreach ($sliders as $key => $value) {
				$elements = json_decode($value['elements'], true);
				?>		
					<div class="slider_wrpp">
					                        <div class="slide_image">
                            <a href=""> <img src="<?php echo base_url('uploads/frontend/slider/' . $elements['image']) ?>" /> </a>               
                        </div>
								                         <div class="slider-padding">
                            <div class="container">
                                <div class="slider-item">
                                    <h1 class="slider-title">
                                       <?php echo $value['title']; ?>                             </h1>                            
                                </div>
                            </div>
                        </div>
                    </div>
					
						<?php } ?>								
					
					
														
					
					
					
                  
                   
                
                </div>
            </div>
        </div>
            
            <!--=========elitesDesign==============
                Slider section End
            =============elitesDesign=============-->  
                                
                                                
 
   
 								
 <div class="top-scroll-section5">  
               
                    <div class="alert" role="alert">
                        <div class="scroll-section5">
                            <div class="row">
                            <div class="col-md-12">
	                                  <div class="top_scroll2"> 
                                    <div class="scroll5-left">
                                        <div id="scroll5-left">
                                            <span> জরুরী ঘোষণা : </span>
                                        </div>
                                
                                    </div>
                                
                                    <div class="scroll5-right">
                                        <marquee direction="left" scrollamount="5px" onmouseover="this.stop()" onmouseout="this.start()"> 
                                            
																
                                            <a href="#"> <i class="las la-exclamation-circle"></i> <?php echo $cms_setting['emergency_notice']; ?></a>
											
                                                                                   
                                        </marquee>
                                    </div>
                                    <div class="scroolbar5">
                                        <button data-bs-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                    </div>
    
                                </div>
                            </div>
                            </div>
                        </div>
                    </div>
              
            </div>
    
    <!--============Scroll 05 End==============-->   
	
	 	 
	 
	          
 
 
 




                    <!--=======================
                        elitesDesign_main_section start
                    ==========================--> 

        <section class="elitesDesign_main_section">

                <div class="row">
                    <div class="col-lg-9 col-md-9"><!-- col-9 start -->

                <!--=======================
                    About_section start
                ==========================-->
				 								
										    <?php
        if (!empty($wellcome)) {
        $elements = json_decode($wellcome[ 'elements' ], true);
        ?>
										
                        <div class="about_section">
                            <div class="row">
                                <div class="col-lg-12 col-md-12">
                                   <h3 class="about-title">
                                    <i class="las la-address-card"></i> <?php echo $wellcome['title']; ?>                                   </h3>
													
				
                                    <div class="about_image">
                                        <img src="<?php echo base_url('uploads/frontend/home_page/' . $elements['image']); ?>" alt="">
                                    </div>
				

                                    <div class="about_content">
                                      <p><?php echo $wellcome['description']; ?>.....</p>
  <a href="<?php echo base_url('frontend/about'); ?>"> বিস্তারিত</a>
                                    </div>
                                </div>
                            </div>
                        </div>
						
						       <?php } ?>
						
												
						
                <!--=======================
                    About_section End
                ==========================-->

								
					
                <!--====================
                    speech section start
                ======================-->
				    <?php
    if (!empty($teachers)) {
    $elements = json_decode($teachers[ 'elements' ], true);
    ?>
                    <section class="speech-section">
                        <div class="row">
                            <div class="col-lg-12 col-md-12">
                                <div class="speech-active owl-carousel">

									 						
									<div class="speech-wrpp">
                                        <h4 class="about-title">
                                            <i class="las la-address-book"></i>  সভাপতির বানী                                       </h4>
										                                        <div class="speech-image">
                                            <img src="<?php echo base_url('uploads/frontend/images/' . $cms_setting['sovapoti_images']); ?>" alt="">
                                        </div>
										                                        
                                        <div class="speech-content">
                                         <p><?php echo $teachers['title'] ?>.....</p>
 <a href="<?php echo base_url('frontend/sovapoti'); ?>"> বিস্তারিত</a>
                                        </div>
                                    </div>
									
									 									
									<div class="speech-wrpp">
                                        <h4 class="about-title">
                                            <i class="las la-address-book"></i>  প্রিন্সিপালের বানী                                    </h4>
										                                        <div class="speech-image">
                                            <img src="<?php echo base_url('uploads/frontend/images/' . $cms_setting['principal_images']); ?>" alt="">
                                        </div>
										                                        
                                        <div class="speech-content">
                                         <div class="post_content">
<p><?php echo $teachers['sovapoti_short_message'] ?>.....</p>
 <a href="<?php echo base_url('frontend/principal'); ?>"> বিস্তারিত</a>
                                        </div>
                                    </div>
									
									    


                               
                                </div>

                            </div>
                            
                           
                            
                        </div>
                    </section>

				<?php } ?>		
						     
                <!--====================
                    speech section End
                ======================-->

           

                    <div class="widget_area">			<div class="textwidget"><p><a href="index4df34df3.html?page_id=290" rel="noopener"><img decoding="async" class="aligncenter size-full wp-image-287" src="wp-content/uploads/2023/07/mujib_cornar.html" alt="" width="100%" height="auto" srcset="https://elitesDesign.net/eschool/wp-content/uploads/2023/07/mujib_cornar.png 1000w, https://elitesDesign.net/eschool/wp-content/uploads/2023/07/mujib_cornar-300x83.png 300w, https://elitesDesign.net/eschool/wp-content/uploads/2023/07/mujib_cornar-768x212.png 768w, https://elitesDesign.net/eschool/wp-content/uploads/2023/07/mujib_cornar-600x166.png 600w" sizes="(max-width: 1000px) 100vw, 1000px" /></a></p>
</div>
		</div>



                <!--=======================
                    Category_section Start
                ==========================-->
                        <section class="category_section">
                            
							
														<div class="row">
                                <div class="col-lg-6 col-md-6">
                                   <div class="category_item">
								                                          <h3 class="information-title1">
                                          <i class="las la-bars"></i> শিক্ষার্থী ও অভিভাবগদের কর্ণার                                       </h3>
								                                          <div class="cat_item_padding">
									                                               <div class="category_image">
                                                <img src="<?php echo base_url('assets/front/assets/images/menu01.png'); ?>" alt="">
                                            </div>
									                                               <div class="cat_menu">
                                                <div class="menu-student-information-container"><ul id="menu-student-information" class="menu"><li id="menu-item-185" class="menu-item menu-item-type-taxonomy menu-item-object-studentscat menu-item-185"><i class="las la-check"></i> <a href="<?php echo base_url('authentication'); ?>">শিক্ষার্থী লগইন</a></li>
<li id="menu-item-186" class="menu-item menu-item-type-taxonomy menu-item-object-studentscat menu-item-186"><i class="las la-check"></i> <a href="<?php echo base_url('authentication'); ?>">অভিভাবগ লগইন</a></li>
<li id="menu-item-187" class="menu-item menu-item-type-taxonomy menu-item-object-studentscat menu-item-187"><i class="las la-check"></i> <a href="<?php echo base_url('frontend/exam_results'); ?>">অনলাইন রেজাল্ট</a></li>
<li id="menu-item-188" class="menu-item menu-item-type-taxonomy menu-item-object-studentscat menu-item-188"><i class="las la-check"></i> <a href="<?php echo base_url('frontend/admission'); ?>">অনলাইন এডমিশন</a></li>
<li id="menu-item-189" class="menu-item menu-item-type-taxonomy menu-item-object-studentscat menu-item-189"><i class="las la-check"></i> <a href="<?php echo base_url('frontend/admit_card'); ?>">এডমিট কার্ড</a></li>
</ul></div>                                            </div>
                                        </div>
                                    </div>
                                </div>
                                  
                                <div class="col-lg-6 col-md-6">
                                   <div class="category_item">
								                                           <h3 class="information-title2">
                                           <i class="las la-bars"></i> শিক্ষক ও স্টাফদের কর্ণার  
                                       </h3>
								                                          <div class="cat_item_padding">
                                                                                        <div class="category_image">
                                                <img src="<?php echo base_url('assets/front/assets/images/menu02.png'); ?>" alt="">
                                            </div>
									                                               <div class="cat_menu">
                                                <div class="menu-teacher-container"><ul id="menu-teacher" class="menu"><li id="menu-item-190" class="menu-item menu-item-type-taxonomy menu-item-object-teacherscat menu-item-190"><i class="las la-check"></i> <a href="<?php echo base_url('authentication'); ?>">শিক্ষক লগইন</a></li>
<li id="menu-item-191" class="https://soft.tasnimitfarm.com/authentication/aaa"><i class="las la-check"></i> <a href="<?php echo base_url('authentication'); ?>">স্টাফ লগইন</a></li>
<li id="menu-item-192" class="menu-item menu-item-type-taxonomy menu-item-object-teacherscat menu-item-192"><i class="las la-check"></i> <a href="<?php echo base_url('frontend/teachers'); ?>">শিক্ষক মণ্ডলীদের তালিকা</a></li>
<li id="menu-item-193" class="menu-item menu-item-type-taxonomy menu-item-object-teacherscat menu-item-193"><i class="las la-check"></i> <a href="<?php echo base_url('frontend/teachers'); ?>">স্টাফদের তালিকা</a></li>
<li id="menu-item-194" class="menu-item menu-item-type-taxonomy menu-item-object-teacherscat menu-item-194"><i class="las la-check"></i> <a href="<?php echo base_url('authentication'); ?>">লাইব্রেরিয়ান লগইন</a></li>
</ul></div>                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                               							                               
                            <div class="row">
                                <div class="col-lg-6 col-md-6">
                                   <div class="category_item">
								                                           <h3 class="information-title3">
                                            <i class="las la-bars"></i> সকল ডাউনলোড                                       </h3>
								                                          <div class="cat_item_padding">
                                                                                        <div class="category_image">
                                                <img src="<?php echo base_url('assets/front/assets/images/menu03.png'); ?>" alt="">
                                            </div>
									                                               <div class="cat_menu">
                                                <div class="menu-downlaod-container"><ul id="menu-downlaod" class="menu"><li id="menu-item-195" class="menu-item menu-item-type-taxonomy menu-item-object-informationcat menu-item-195"><i class="las la-check"></i> <a href="<?php echo base_url('frontend/admit_card'); ?>">এডমিট কার্ড ডাউনলোড</a></li>
<li id="menu-item-196" class="menu-item menu-item-type-taxonomy menu-item-object-informationcat menu-item-196"><i class="las la-check"></i> <a href="<?php echo base_url('frontend/exam_results'); ?>">মার্কশিট ডাউনলোড</a></li>
<li id="menu-item-197" class="menu-item menu-item-type-taxonomy menu-item-object-informationcat menu-item-197"><i class="las la-check"></i> <a href="<?php echo base_url('frontend/certificates'); ?>">সার্টিফিকেট ডাউনলোড</a></li>
<li id="menu-item-198" class="menu-item menu-item-type-taxonomy menu-item-object-informationcat menu-item-198"><i class="las la-check"></i> <a href="<?php echo base_url('authentication'); ?>">পরীক্ষার রুটিন</a></li>
<li id="menu-item-199" class="menu-item menu-item-type-taxonomy menu-item-object-informationcat menu-item-199"><i class="las la-check"></i> <a href="<?php echo base_url('authentication'); ?>">ভর্তি ফরম ডাউনলোড</a></li>
</ul></div>                                            </div>
                                        </div>
                                    </div>
                                </div>
                                  
                                <div class="col-lg-6 col-md-6">
                                   <div class="category_item">
								   										<h3 class="information-title4">
                                             <i class="las la-bars"></i> একাডেমিক তথ্য                                       </h3>
								   									   
                                       <div class="cat_item_padding">
                                                                                        <div class="category_image">
                                                <img src="<?php echo base_url('assets/front/assets/images/menu04.png'); ?>" alt="">
                                            </div>
									                                               <div class="cat_menu">
                                                <div class="menu-academic-information-container"><ul id="menu-academic-information" class="menu"><li id="menu-item-204" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-204"><i class="las la-check"></i> <a href="<?php echo base_url('frontend/about'); ?>">প্রতিষ্ঠানের ইতিহাস</a></li>
<li id="menu-item-200" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-200"><i class="las la-check"></i> <a href="<?php echo base_url('frontend/exam_results'); ?>">পরীক্ষার ফলাফল</a></li>
<li id="menu-item-201" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-201"><i class="las la-check"></i> <a href="<?php echo base_url('frontend/news'); ?>">নোটিশ</a></li>
<li id="menu-item-202" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-202"><i class="las la-check"></i> <a href="<?php echo base_url('frontend/gallery'); ?>">ফোটো গ্যালারী</a></li>
<li id="menu-item-203" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-203"><i class="las la-check"></i> <a href="<?php echo base_url('frontend/video'); ?>">ভিডিও গ্যালারী</a></li>
</ul></div>                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
							                        </section>




                <!--=======================
                    Category_section End
                ==========================-->


                    </div><!-- col-9 End -->




                    <!-- col-3 start -->
                    <div class="col-lg-3 col-md-3">
                        <!-- ========= academic_information start ========== -->
                         	<div class="academic_information">
                            <div class="menu-sidebar-one-container"><ul id="menu-sidebar-one" class="menu"><li id="menu-item-205" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-205"><a href="<?php echo base_url('frontend/exam_results'); ?>"><i class="lar la-arrow-alt-circle-right"></i> পরীক্ষার ফলাফল</a></li>
<li id="menu-item-206" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-206"><a href="<?php echo base_url('frontend/news'); ?>"><i class="lar la-arrow-alt-circle-right"></i> নোটিশ</a></li>
<li id="menu-item-207" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-207"><a href="<?php echo base_url('frontend/about'); ?>"><i class="lar la-arrow-alt-circle-right"></i>প্রতিষ্ঠানের ইতিহাস</a></li>
<li id="menu-item-208" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-208"><a href="<?php echo base_url('frontend/gallery'); ?>"><i class="lar la-arrow-alt-circle-right"></i>ফটো গ্যালারী</a></li>
<li id="menu-item-209" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-209"><a href="<?php echo base_url('frontend/video'); ?>"><i class="lar la-arrow-alt-circle-right"></i> ভিডিও গ্যালারী</a></li>
</ul></div>                        </div>
						                         <!-- ========= academic_information start ========== -->
                         
                                               				<?php
$news_list = $this->home_model->getLatestNews($branchID);
if (!empty($news_list)) {
	$url_alias = $cms_setting['url_alias'];
	?>	    
                        <!-- ============notic board start==================== -->
                        
                        
                    <div class="widget_area">			<div class="textwidget"><p><a href="index4df34df3.html?page_id=290"><img decoding="async" class="aligncenter size-full wp-image-288" src="wp-content/uploads/2023/07/mujib100.html" alt="" width="100%" height="auto" srcset="https://elitesDesign.net/eschool/wp-content/uploads/2023/07/mujib100.png 800w, https://elitesDesign.net/eschool/wp-content/uploads/2023/07/mujib100-300x222.png 300w, https://elitesDesign.net/eschool/wp-content/uploads/2023/07/mujib100-768x569.png 768w, https://elitesDesign.net/eschool/wp-content/uploads/2023/07/mujib100-600x445.png 600w" sizes="(max-width: 800px) 100vw, 800px" /></a></p>
</div>
		</div>                        
                        
                        <div class="notic_board">
						
							
                            							<div class="notic_board_title">
                              <i class="las la-bars"></i> নোটিশ বোর্ড                            </div>
							                            
                            <div class="noitc_board_item">
                            <div class="noitc_board_item">
                           <marquee direction = "up" height="200" scrollamount="3px" onmouseover="this.stop()" onmouseout="this.start()">       
                                    
                                     <ul>
					
					

   <?php foreach ($news_list as $key => $value) { ?>
									<li><i class="lar la-arrow-alt-circle-right"></i><a href="<?php echo base_url($url_alias . '/news_view/' . $value->alias); ?>"><strong><?php echo str_pad($key + 1, 2, '0', STR_PAD_LEFT); ?>-</strong> <?php echo $value->title; ?></span></a></li>
 								
			<?php } ?>


										    
                                         
                                     </ul>
                                 
                                 </marquee>
                            </div>
                            
                        </div>
						
						               
							
                           <!-- =========== notic board End ================= -->
						       <?php } ?>     
                            							<div class="notic_board_title">
                              <i class="las la-bars"></i> ফেসবুকে আমরা                            </div>
							                            <div class="facebook-content">
                                                        <iframe
              src="https://www.facebook.com/plugins/page.php?href=https://www.facebook.com/<?php echo $cms_setting['facebook_page_url']; ?>&amp;tabs=time&amp;width=260&amp;height=150&amp;small_header=false&amp;adapt_container_width=true&amp;hide_cover=false&amp;show_facepile=true&amp;appId=334182264340964"
              width="260" height="150" style="border:none;overflow:hidden" scrolling="no" frameborder="0"
              allowfullscreen="true"
              allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"></iframe>
			  </div>
                            
                            
                        <!-- ======= Offical Link start ========== -->
                        
						                          
							
                           <!-- =========== notic board End ================= -->
                                                    <div class="official_link">
                            <div class="oLink_litle">
                                 <i class="las la-bars"></i> গুরুত্বপূর্ণ লিংক                            </div>
							                        
                           <div class="oLink_menu">
						   
						  <div class="menu-sidebar-two-container"><ul id="menu-sidebar-two" class="menu"><li id="menu-item-210" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-210"><a target="_blank" rel="noopener" href="http://www.moedu.gov.bd/"><i class="lar la-arrow-alt-circle-right"></i> শিক্ষা মন্ত্রনালয়</a></li></ul></div> 
						  <div class="menu-sidebar-two-container"><ul id="menu-sidebar-two" class="menu"><li id="menu-item-210" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-210"><a target="_blank" rel="noopener" href="https://www.dhakaeducationboard.gov.bd/site/"><i class="lar la-arrow-alt-circle-right"></i> মাধ্যমিক ও উচ্চমাধ্যমিক শিক্ষা বোর্ড</a></li></ul></div>
						  <div class="menu-sidebar-two-container"><ul id="menu-sidebar-two" class="menu"><li id="menu-item-210" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-210"><a target="_blank" rel="noopener" href="https://www.dshe.gov.bd/"><i class="lar la-arrow-alt-circle-right"></i> মাধ্যমিক ও উচ্চশিক্ষা অধিদপ্তর</a></li></ul></div> 
				 			<div class="menu-sidebar-two-container"><ul id="menu-sidebar-two" class="menu"><li id="menu-item-210" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-210"><a target="_blank" rel="noopener" href="https://www.nu.ac.bd/"><i class="lar la-arrow-alt-circle-right"></i> জাতীয় বিশ্ববিদ্যালয়</a></li></ul></div> 				 			
							
														   
										
														   </div>
                             
                        </div>
						                        
                        
                        
                        
                        <!-- ======= Offical Link End ========== -->
                             
                             
                        <!-- ======= Offical Link start ========== -->
                        
                        <div class="official_link">
						                            <div class="oLink_litle">
                             <i class="las la-bars"></i> অফিসিয়াল লিংক                            </div>
						                        
                           <div class="oLink_menu">
                               <div class="menu-sidebar-three-container"><ul id="menu-sidebar-three" class="menu"><li id="menu-item-213" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-213"><a target="_blank" rel="noopener" href="http://www.educationboardresults.gov.bd/"><i class="lar la-arrow-alt-circle-right"></i> এডুকেশন ফলাফল</a></li>
<li id="menu-item-214" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-214"><a target="_blank" rel="noopener" href="http://www.banbe.gov.bd/"><i class="lar la-arrow-alt-circle-right"></i> বেনবেইজ</a></li>
</ul></div>                           </div>
                            
                        </div>
                        
                                                
                        
                        <!-- ======= Offical Link End ========== -->
                            
                        
                    </div>
                </div>
            </div>
        </section>  
                       
                       
                    <!--=======================
                        elitesDesign_main_section End
                    ==========================--> 
                    
                    
                                                               
     								
                    <!--=======================
                        Teacher_section Start
                    ==========================--> 
        <section class="teacher_section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12">
					                       <div class="teacher_title">
							Our Teacher                            <div class="icon_image">
                               <img src="<?php echo base_url('assets/front/assets/images/icon-image.png'); ?>" alt="">
                            </div>
                       </div>
					                       
                        <div class="teacher_list owl-carousel">
                
                            <?php
    if (!empty($teachers)) {
    $elements = json_decode($teachers[ 'elements' ], true);
    ?>											
			                           
							            <?php
			$doctor_list = $this->home_model->get_teacher_list($elements['teacher_start'], $branchID);
			foreach ($doctor_list as $row) {
                ?>	
							<div class="teacher_wrpp">
							   <div class="teacher_image">
                                     <img src="<?php echo get_image_url('staff', $row['photo']); ?>" alt="">
                                </div>
								                                <div class="teacher_content">
                                    <h4 class="teacher_name">
										<a href="#"> <?php echo $row['name']; ?> </a>	
                                    </h4>
									
									                                    <h6 class="teacher_deg">
                                      <?php echo $row['designation_name']; ?>                          </h6>
										
                                </div>
                                
                                <div class="teacher-social">
                                    
									
									<a href="<?php echo $row['facebook_url']; ?>"><i class="lab la-facebook-f"></i></a>
							        <a href="<?php echo $row['twitter_url']; ?>"><i class="lab la-twitter"></i></a>
									<a href="<?php echo $row['linkedin_url']; ?>"><i class="lab la-linkedin-in"></i></a>
		                                </div>
                                
                            </div>
							<?php } ?>
							
							 <?php } ?>			   
								
							
							
										 							
							
							
												                            
                                                    
                                                  
                            
                        </div>
                    </div>
                </div>
            </div>
        </section>
                                       
                    <!--=======================
                        Teacher_section End
                    ==========================--> 
					   
 
 
 								
                  

               
                            <!--==========================
                              Video section Start
                            ===========================--> 
    <div class="video-seciton">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <div class="video-section-wrpp">
                        <div class="video-seciton-title">
							 Video Gallery                        </div>

                        <div class="video-seciton-img">
                            <img src="wp-content/themes/ESchool/assets/images/icon-image.html" alt="">
                        </div>
                    </div>
                        
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-12">
                    <div class="video-list owl-carousel">                        
                        
																													
					
                         
                                <?php 
            $faq_list = $this->db->where('branch_id', $branchID)->get('front_cms_faq_list')->result_array();
            foreach ($faq_list as $key => $value) {
            ?>						 
						<div class="video-wrpp">
                            <div class="video-item">
                            <img src="https://img.youtube.com/vi/<?php echo $value['description']; ?>/mqdefault.jpg" />
																								
                                <a href="https://www.youtube.com/watch?v=<?php echo $value['description']; ?>" class="video-icon popup "><i class="la la-play"></i></a>
                            </div>
                            <div class="video-title">
                                <a href="https://www.youtube.com/watch?v=<?php echo $value['description']; ?>" class="popup"><?php echo $value['title'] ?></a> 
                            </div>                             
                        </div>  

                         		<?php } ?>				 
						

                         
																		
									
						



														
                                           
                                          
         
                    </div>
                </div>
            </div>
        </div>
    </div>   
	                             <!--==========================
                                Video Section End
                            ===========================--> 
                                                                                         
                                  
                                      
                                      
                                     
 
 <?php
$news_list = $this->home_model->getLatestNews($branchID);
if (!empty($news_list)) {
	$url_alias = $cms_setting['url_alias'];
	?>				

                    <!--=========elitesDesign==============
                        Blog section Start
                    =============elitesDesign=============-->    
        <section class="blog-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <div class="sec-content">
                            <h1 class="sec-title">
                                Notice                            </h1>
                            <div class="secIcon">
                                <img src="<?php echo base_url('assets/front/assets/images/heading-line.png'); ?>" alt="">
                            </div>
                        </div>
                    </div>
                </div><!--End row-->

                <div class="row">
                    <div class="col-lg-12">
                        <div class="blog-active owl-carousel">
                            
								         														
											
																
								
<?php foreach ($news_list as $key => $value) { ?>
							<div class="blog-wrpp">
							    <figure class="blog-image">
                                    <img class="lazyload" src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhg1saXr10N_hPWmyFi_cGUX8B9tbZCB4iZrqc8F4hbvyuGB49WucBKDYG4nEbzfDSwDZxjp6xL78aEGhkz91HZzIikA7fVrEAs9uyLql-IvfNEf7zctn84hHqR4ShFnG2s4uQNg_YMg1l7c5HLJ_G61TDcWPJMVVYe19Dq3IAhUyvQqYjvIENTA5AQMFY/s16000/notice.png" data-src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhg1saXr10N_hPWmyFi_cGUX8B9tbZCB4iZrqc8F4hbvyuGB49WucBKDYG4nEbzfDSwDZxjp6xL78aEGhkz91HZzIikA7fVrEAs9uyLql-IvfNEf7zctn84hHqR4ShFnG2s4uQNg_YMg1l7c5HLJ_G61TDcWPJMVVYe19Dq3IAhUyvQqYjvIENTA5AQMFY/s16000/notice.png">	
                                </figure>
							    
                                <div class="blog-item">
                                       
                                    <h1 class="blog-title">
                                        <a href="<?php echo base_url($url_alias . '/news_view/' . $value->alias); ?>"><strong><?php echo str_pad($key + 1, 2, '0', STR_PAD_LEFT); ?>-</strong> <?php echo $value->title; ?></span></a>
                                    </h1>
    
                                    <div class="blog-btn">
                                        <a href="<?php echo base_url($url_alias . '/news_view/' . $value->alias); ?>"> <i class="las la-angle-right"></i> বিস্তারিত </a>
                                    </div>
                                </div>
                            </div><!--End wrpp-->

<?php } ?>
												
												
												
												
                                                        
                    

                        </div><!--End owl-carousel-->
                    </div><!--End col-12-->
                </div><!--Edn row-->
            </div><!--End container-->
        </section><!--End section-->
            
            
                <!--=========elitesDesign==============
                    Blog section End
                =============elitesDesign=============-->    
<?php } ?>