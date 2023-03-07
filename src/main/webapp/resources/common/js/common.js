$(function(){
	commonList.init();
	commonFile.init();
	commonUpdate.init();
	commonView.init();
	
	if($('[data-common-datepicker]').length > 0){
		$('[data-common-datepicker]').datepicker({
			dateFormat : "yy-mm-dd"
			/*,minDate : 1*/
			/*,maxDate : maxDate*/
			,setDate : new Date()
			,nextText: "다음달"
			,prevText: "이전달"
			,closeText: "닫기"
			,currentText: "오늘"
			,dayNames: ["일","월","화","수","목","금","토"]
			,dayNamesMin: ["일","월","화","수","목","금","토"]
			,monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"]
			,monthNamesShort: ["1","2","3","4","5","6","7","8","9","10","11","12"]
			,showMonthAfterYear: true
			,yearSuffix: "년"
			,beforeShowDay: function(date){
				let day = date.getDay();
				
				if( day != 0 && day != 6){					
					return [true, ''];
				} else {
					return [false, 'data-weekend'];
				}
				
			}
			
		});
	}
	
})