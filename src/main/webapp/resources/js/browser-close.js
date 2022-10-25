/**
 * 
 */
        var closing_window = false; 
        $(window).on('focus', function () { 
        	closing_window = false;
        	//if the user interacts with the window, then the window is not being 
        	//closed 
        }); 
        
        $(window).on('blur', function () {
        	closing_window = true;
        	if (!document.hidden) {
        		//when the window is being minimized 
        		closing_window = false; 
        	}
        	$(window).on('resize', function (e) {
        		//when the window is being maximized 
        		closing_window = false; 
        	});
        	$(window).off('resize');
        	//avoid multiple listening
        });
        
        $('html').on('mouseleave', function () {
        	closing_window = false; 
        	//if the user is leaving html, we have more reasons to believe that he's 
        	//leaving or thinking about closing the window 
        });
        
        $('html').on('mouseenter', function () {
        	closing_window = false;
        	//if the user's mouse its on the page, it means you don't need to logout
        	//them, didn't it? 
        });
        
        var prevKey="";
        $(document).on('keydown', function (e) {
        	if (e.keyCode == 91 || e.keyCode == 18) {
        		closing_window = false; 
        		//shortcuts for ALT+TAB and Window key 
        	} else if (e.keyCode == 116 || (e.ctrlKey && e.keyCode == 82)) {
        		closing_window = false; 
        		//shortcuts for F5 and CTRL+F5 and CTRL+R 
        	} else if (e.key.toUpperCase() == "F4" && (prevKey == "ALT" || prevKey == "CONTROL")) {
        		closing_window = true; 
        	} else if(e.keyCode == 115){ //창 닫기(Alt+F4) 방지
        		console.log("key");
				closing_window = true; 
			} else if(e.keyCode == 505){ //윈도우 창이 닫힐 경우
				closing_window = true; 
				//alert(document.body.onBeforeUnload);
			}
			prevKey = e.key.toUpperCase();
        }); 
        
        // Prevent logout when clicking in a hiperlink 
        $(document).on("click", "a", function () {
        	closing_window = false; 
        }); 
        
        // Prevent logout when clicking in a button (if these buttons rediret to some page) 
        $(document).on("click", "button", function () {
        	closing_window = false; 
        }); 
        
        // Prevent logout when submiting 
        $(document).on("submit", "form", function () {
        	closing_window = false; 
        }); 
        
        // Prevent logout when submiting 
        $(document).on("click", "input[type=submit]", function () {
        	closing_window = false; 
        }); 
    	
        window.onunload = function() {
            if(event.clientX < 0 && event.clientY < 0) {
                alert("브라우저를 종료하였습니다.");
            }
      }
        
		function handleBrowserCloseButton(event) { 
		   if (closing_window) {
		    	$.ajax({
		    		url: "/admin/auto_logout",
		    		type: "POST",
		    		async: true 
		    	});
		    } 
		} 