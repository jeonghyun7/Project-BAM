/*---------------------------------------------
Template name:  Dirto
Version:        1.0
Author:         techydevs
Author Email:   contact@tecydevs.com

[Table of Content]

01: Preloader
02: side-widget-menu
02: Mobile Menu Open Control
03: Mobile Menu Close Control
04: Side user panel menu Open Control
05: Back to Top Button and Navbar Scrolling Effects
06: back to top button click control
07: most-visited-wrap
08: Client logo slider
09: client-testimonial
10: gallery-carousel
11: magnificpopup
12: Daterangepicker
13: MagnificPopup
14: Quantity number increment control
15: Quantity number decrement control
16: Tooltip
17: Nice Select
18: Counter up
----------------------------------------------*/

(function ($) {
    "use strict"; //use of strict

    $(document).on('ready', function () {

        /*==== Preloader =====*/
        $(window).on('load', function(){
            $('.loader-container').delay('500').fadeOut(2000);
        });

        /*====  side-widget-menu  =====*/
        $(document).on('click','.side-menu-wrap .side-menu-ul>li .la-angle-down', function () {
            $(this).closest('li').siblings().removeClass('active').find('.dropdown-menu-item').slideUp(200);
            $(this).closest('li').toggleClass('active').find('.dropdown-menu-item').slideToggle(200);
            return false;
        });

        /*=========== Mobile Menu Open Control ============*/
        $(document).on('click','.logo-right-content .side-menu-open', function () {
            $('.side-nav-container').addClass('active');
        });

        /*=========== Mobile Menu Close Control ============*/
        $(document).on('click','.humburger-menu .side-menu-close', function () {
            $(".side-nav-container, .side-user-panel").removeClass('active');
        });

        /*=========== Side user panel menu Open Control ============*/
        $(document).on('click','.logo-right-content .side-user-menu-open', function () {
            $('.side-user-panel').addClass('active');
        });

        /*===== Back to Top Button and Navbar Scrolling Effects ======*/
        $(window).on('scroll', function() {
            //header fixed animation and control
            if($(window).scrollTop() > 10) {
                $('.header-menu-wrapper').addClass('header-fixed');
            }else{
                $('.header-menu-wrapper').removeClass('header-fixed');
            }

            //back to top button control
            if ($(window).scrollTop() > 300) {
                $('#back-to-top').addClass('show-back-to-top');
            } else {
                $('#back-to-top').removeClass('show-back-to-top');
            }

            // skillbar
            $('.skillbar').each(function(){
                $(this).find('.skillbar-bar').animate({
                    width:$(this).attr('data-percent')
                },6000);
            });

        });

       /*===== back to top button click control ======*/
        $(document).on("click", '#back-to-top', function() {
            $('html, body').animate({
                scrollTop: 0
            }, 800);
            return false;
        });

        /*==== card-carousel =====*/
        $('.card-carousel').owlCarousel({
            loop: true,
            items: 3,
            nav: false,
            dots: true,
            smartSpeed: 700,
            autoplay: false,
            center: true,
            margin: 30,
            responsive : {
                // breakpoint from 0 up
                0 : {
                    items: 1
                },
                // breakpoint from 480 up
                480 : {
                    items: 1
                },
                // breakpoint from 600 up
                600 : {
                    items: 2
                },
                // breakpoint from 992 up
                992 : {
                    items: 3
                }
            }
        });

        /*==== Client logo =====*/
        $('.client-logo').owlCarousel({
            loop: true,
            items: 6,
            nav: false,
            dots: false,
            smartSpeed: 700,
            autoplay: true,
            responsive : {
                // breakpoint from 0 up
                0 : {
                    items: 1
                },
                // breakpoint from 425 up
                425 : {
                    items: 2
                },
                // breakpoint from 480 up
                480 : {
                    items: 2
                },
                // breakpoint from 767 up
                767 : {
                    items: 4
                },
                // breakpoint from 992 up
                992 : {
                    items: 6
                }
            }
        });

        /*==== testimonial-carousel =====*/
        $('.testimonial-carousel').owlCarousel({
            loop: true,
            items: 1,
            nav: true,
            dots: true,
            smartSpeed: 700,
            autoplay: false,
            stagePadding: 30,
            margin:80,
            navText: ["<span class=\"la la-caret-left\"></span>", "<span class=\"la la-caret-right\"></span>"]
        });


        /*==== gallery-carousel =====*/
        $('.gallery-carousel').owlCarousel({
            loop: true,
            items: 1,
            nav: true,
            dots: true,
            smartSpeed: 700,
            autoplay: false,
            dotsData: true,
            navText: ["<span class=\"la la-chevron-left\"></span>", "<span class=\"la la-chevron-right\"></span>"]
        });

        /*==== magnificpopup =====*/
        $('.video-popup-btn').magnificPopup({
            type: 'video'
        });

        /*==== Daterangepicker 라이브러리 =====*/
        $('input[name="daterange"]').daterangepicker({
        	autoApply: true,
        	minDate: new Date(),
        	opens: 'center',
        	 locale :{
                 format: 'YYYY/MM/DD',
                 'monthNames': [
                	 '1월',
                	 '2월',
                	 '3월',
                	 '4월',
                	 '5월',
                	 '6월',
                	 '7월',
                	 '8월',
                	 '9월',
                	 '10월',
                	 '11월',
                	 '12월'
                 ],
                 'daysOfWeek': [
                	 '일',
                	 '월',
                	 '화',
                	 '수',
                	 '목',
                	 '금',
                	 '토'
                 ]
             },
        }, function(start, end, label){
        	$('.check-in').val(start.format('YYYY/MM/DD'))
        	$('.check-out').val(end.format('YYYY/MM/DD'))
        });
        
        /*==== Quantity number increment control =====*/
        $(document).on('click', '.input-number-increment', function() {
            var $input = $(this).parents('.input-number-group').find('.input-number');
            var val = parseInt($input.val(), 10);
            var max = $(".input-number").attr("max");
            if(val == max) {
            	$input.val(val);
            } else {
            	$input.val(val + 1);
            	check_available();
            }
        });
        
        /***changed by rhie***/
        /*==== Quantity number decrement control =====*/
        $(document).on('click', '.input-number-decrement', function() {
            var $input = $(this).parents('.input-number-group').find('.input-number');
            var val = parseInt($input.val(), 10);
            if(val == 0){
            	$input.val(val);
            } else {
            	$input.val(val - 1);
            	check_available();
            }
        });
        
        function check_available(){
            let check = document.getElementById('peopleNum').value;
            console.log("check available : "+check_booking_available);
            if(check>=1 && check_booking_available){
            	document.getElementById('booking-event').style.pointerEvents = 'auto'; 
            }else{
            	alert("인원수를 1명 이상으로 설정해주세요.")
            	document.getElementById('booking-event').style.pointerEvents = 'none';
            }
         }

        /*==== select2 =====*/
        $('.select-option-field').select2({
            placeholder: "캠핑장명 또는 장소 입력",
            allowClear: true
        });

        $('.select-option-field-2').select2({
            placeholder: "Select a Category",
            allowClear: true
        });

        $('.select-option-field-3').select2({
            placeholder: "Property Type",
            allowClear: true
        });

        $('.select-option-field-4').select2({
            placeholder: "Short by",
            allowClear: true
        });

        $('.select-option-field-5').select2({
            placeholder: "Time Slots",
            allowClear: true
        });

        $('.select-option-field-6').select2({
            placeholder: "Select a City",
            allowClear: true
        });

        $('.select-option-field-7').select2({
            placeholder: "Select a State",
            allowClear: true
        });

        $('.select-option-field-8').select2({
            placeholder: "Select a Country",
            allowClear: true
        });

        $('.select-option-field-9').select2({
            placeholder: "Opening Time",
            allowClear: true
        });

        $('.select-option-field-10').select2({
            placeholder: "Closing Time",
            allowClear: true
        });

        /*==== Counter up =====*/
        $('.counter').counterUp({
            delay: 20,
            time: 2000
        });

        /*====  Tooltip =====*/
        $('[data-toggle="tooltip"]').tooltip();

        /*==== showMore =====*/
        $('.show-more-item').showMore({
            minheight: 244,
            buttontxtmore: 'Show More',
            buttontxtless: 'Show less',
            buttoncss: 'theme-btn',
            animationspeed: 250
        });

        /*======= ui price range slider ========*/
        $( "#slider-range" ).slider({
            range: true,
            min: 0,
            max: 500,
            values: [ 50, 290 ],
            slide: function( event, ui ) {
                $( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
            }
        });
        $( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) +
            " - $" + $( "#slider-range" ).slider( "values", 1 ) );



        /*==== author-slider =====*/
        $('.author-slider').owlCarousel({
            loop: true,
            items: 5,
            nav: true,
            dots: false,
            smartSpeed: 700,
            autoplay: false,
            margin: 30,
            navText: ["<span class=\"la la-chevron-left\"></span>", "<span class=\"la la-chevron-right\"></span>"],
            responsive : {
                // breakpoint from 0 up
                0 : {
                    items: 1
                },
                // breakpoint from 480 up
                480 : {
                    items: 1
                },
                // breakpoint from 600 up
                600 : {
                    items: 2
                },
                // breakpoint from 992 up
                992 : {
                    items: 3
                },
                // breakpoint from 1440 up
                1440 : {
                    items: 4
                },
                // breakpoint from 1441 up
                1441 : {
                    items: 5
                }
            }
        });

        //filer_input
        $('#filer_input').filer({
            limit: 10,
            maxSize: 100,
            showThumbs: true
        });

        //filer_input 2 drag and drop file upload
        $("#filer_input2").filer({
            limit: 10,
            maxSize: 100,
            changeInput: '<div class="jFiler-input-dragDrop"><div class="jFiler-input-inner"><div' + ' class="jFiler-input-icon"><i class="icon-jfi-cloud-up-o"></i></div><div' + ' class="jFiler-input-text"><h3>Drag & Drop Files Here to Upload</h3> <span class="or-divider">or</span></div><a' + ' class="jFiler-input-choose-btn">Browse Files</a></div></div>',
            showThumbs: true,
            theme: "dragdropbox",
            templates: {
                box: '<ul class="jFiler-items-list jFiler-items-grid"></ul>',
                item: '<li class="jFiler-item">\
						<div class="jFiler-item-container">\
							<div class="jFiler-item-inner">\
								<div class="jFiler-item-thumb">\
									<div class="jFiler-item-status"></div>\
									<div class="jFiler-item-thumb-overlay">\
										<div class="jFiler-item-info">\
											<div style="display:table-cell;vertical-align: middle;">\
												<span class="jFiler-item-title"><b title="{{fi-name}}">{{fi-name}}</b></span>\
												<span class="jFiler-item-others">{{fi-size2}}</span>\
											</div>\
										</div>\
									</div>\
									{{fi-image}}\
								</div>\
								<div class="jFiler-item-assets jFiler-row">\
									<ul class="list-inline pull-left">\
										<li>{{fi-progressBar}}</li>\
									</ul>\
									<ul class="list-inline pull-right">\
										<li><a class="icon-jfi-trash jFiler-item-trash-action"></a></li>\
									</ul>\
								</div>\
							</div>\
						</div>\
					</li>',
                itemAppend: '<li class="jFiler-item">\
							<div class="jFiler-item-container">\
								<div class="jFiler-item-inner">\
									<div class="jFiler-item-thumb">\
										<div class="jFiler-item-status"></div>\
										<div class="jFiler-item-thumb-overlay">\
											<div class="jFiler-item-info">\
												<div style="display:table-cell;vertical-align: middle;">\
													<span class="jFiler-item-title"><b title="{{fi-name}}">{{fi-name}}</b></span>\
													<span class="jFiler-item-others">{{fi-size2}}</span>\
												</div>\
											</div>\
										</div>\
										{{fi-image}}\
									</div>\
									<div class="jFiler-item-assets jFiler-row">\
										<ul class="list-inline pull-left">\
											<li><span class="jFiler-item-others">{{fi-icon}}</span></li>\
										</ul>\
										<ul class="list-inline pull-right">\
											<li><a class="icon-jfi-trash jFiler-item-trash-action"></a></li>\
										</ul>\
									</div>\
								</div>\
							</div>\
						</li>',
                progressBar: '<div class="bar"></div>',
                itemAppendToEnd: false,
                canvasImage: true,
                removeConfirmation: true,
                _selectors: {
                    list: '.jFiler-items-list',
                    item: '.jFiler-item',
                    progressBar: '.bar',
                    remove: '.jFiler-item-trash-action'
                }
            },
            dragDrop: {
                dragEnter: null,
                dragLeave: null,
                drop: null,
                dragContainer: null,
            },
            uploadFile: {
                url: "../php/ajax_upload_file.php",
                data: null,
                type: 'POST',
                enctype: 'multipart/form-data',
                synchron: true,
                beforeSend: function(){},
                success: function(data, itemEl, listEl, boxEl, newInputEl, inputEl, id){
                    var parent = itemEl.find(".jFiler-jProgressBar").parent(),
                        new_file_name = JSON.parse(data),
                        filerKit = inputEl.prop("jFiler");

                    filerKit.files_list[id].name = new_file_name;

                    itemEl.find(".jFiler-jProgressBar").fadeOut("slow", function(){
                        $("<div class=\"jFiler-item-others text-success\"><i class=\"icon-jfi-check-circle\"></i> Success</div>").hide().appendTo(parent).fadeIn("slow");
                    });
                },
                error: function(el){
                    var parent = el.find(".jFiler-jProgressBar").parent();
                    el.find(".jFiler-jProgressBar").fadeOut("slow", function(){
                        $("<div class=\"jFiler-item-others text-error\"><i class=\"icon-jfi-minus-circle\"></i> Error</div>").hide().appendTo(parent).fadeIn("slow");
                    });
                },
                statusCode: null,
                onProgress: null,
                onComplete: null
            },
            files: null,
            addMore: true,
            allowDuplicates: true,
            clipBoardPaste: true,
            excludeName: null,
            beforeRender: null,
            afterRender: null,
            beforeShow: null,
            beforeSelect: null,
            onSelect: null,
            afterShow: null,
            onRemove: function(itemEl, file, id, listEl, boxEl, newInputEl, inputEl){
                var filerKit = inputEl.prop("jFiler"),
                    file_name = filerKit.files_list[id].name;

                $.post('../php/ajax_remove_file.php', {file: file_name});
            },
            onEmpty: null,
            options: null,
            dialogs: {
                alert: function(text) {
                    return alert(text);
                },
                confirm: function (text, callback) {
                    confirm(text) ? callback() : null;
                }
            },
            captions: {
                button: "Choose Files",
                feedback: "Choose files To Upload",
                feedback2: "files were chosen",
                drop: "Drop file here to Upload",
                removeConfirmation: "Are you sure you want to remove this file?",
                errors: {
                    filesLimit: "Only {{fi-limit}} files are allowed to be uploaded.",
                    filesType: "Only Images are allowed to be uploaded.",
                    filesSize: "{{fi-name}} is too large! Please upload file up to {{fi-maxSize}} MB.",
                    filesSizeAll: "Files you've choosed are too large! Please upload files up to {{fi-maxSize}} MB."
                }
            }
        });

        //Bootstrap dropdown-toggle
        $('.dropdown-toggle').dropdown();


//        /*=========== Google map ============*/
//        if($("#map").length) {
//            initMap('map', 40.717499, -74.044113, 'images/map-marker.png');
//        }

    });
})(jQuery);

