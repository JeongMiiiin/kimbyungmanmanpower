let chatting = {
	
	
	ws : null
	
	,init : function(){
		
		this.wsOpen();
		
		this.registEvent();
	}
	,registEvent : function(){
		let _this = this;
		
		
		$('#chattingInput').on("keypress", function(e){
			if(e.keyCode == 13 && $(this).val() != ''){ //enter press
				_this.send();
				return false;
			}
			
			if($(this).val().match('금액')
			|| $(this).val().match("0원") || $(this).val().match("1원") || $(this).val().match("2원") || $(this).val().match("3원")
			|| $(this).val().match("4원") || $(this).val().match("5원") || $(this).val().match("6원") || $(this).val().match("7원")
			|| $(this).val().match("8원") || $(this).val().match("9원") || $(this).val().match('액수') ){
				alert("금액과 관련하여 채팅할 수 없습니다");
				$(this).val('');
			}
			
		});
		
		$('#chattingSendBtn').on("click", function(){
			if($('#chattingInput').val() != ''){
				_this.send();
			} else {
				alert('보낼 메세지를 입력해주세요');
			}
		});
			
	}
	
	,wsOpen : function(){
		this.ws = new WebSocket("ws://" + location.host + "/chating/" + $("#chatSn").val() + "");
		this.wsEvt();
	}
	
	,wsEvt : function(){
		//소켓이 열리면 동작
		this.ws.onopen = function(data){
			
		}
		
		//메시지를 받으면 동작
		this.ws.onmessage = function(data) {
			let msg = data.data;
			if(msg != null && msg.trim() != ''){
				let d = JSON.parse(msg);
				if(d.type == "getId"){
					let si = d.sessionId != null ? d.sessionId : "";
					if(si != ''){
						$("#sessionId").val(si); 
					}
				}else if(d.type == "message"){
						let sendDate = d.sendDate.split(" ")[0];
						if($("#recentDate").val() != sendDate){
							let sendDay = Number(d.sendDate.split(" ")[1]);
							let dayOfWeek = "";
							switch(sendDay){
								case 0 : dayOfWeek = "일요일"; break;
								case 1 : dayOfWeek = "월요일"; break;
								case 2 : dayOfWeek = "화요일"; break;
								case 3 : dayOfWeek = "수요일"; break;
								case 4 : dayOfWeek = "목요일"; break;
								case 5 : dayOfWeek = "금요일"; break;
								default : dayOfWeek = "토요일"; break;
							}
							
							$(".chatting_contents_con").append('<li class="tc type_date"><span>'+ sendDate.split("-")[0] + '년 ' + sendDate.split("-")[1] + '월' + sendDate.split("-")[2] + '일 ' + dayOfWeek + '</span></li>');
							$("#recentDate").val(sendDate);
						}
						let sendHours = Number((d.sendDate.split(" ")[2]).split(":")[0]);
						let sendTimeText = "";
						
						if(sendHours == 12){
							sendTimeText += "오후 " + sendHours;
						} else if(sendHours == 0){
							sendTimeText += "오전 12";
						} else if(sendHours > 12){
							sendTimeText += "오후 " + (sendHours - 12);
						} else if(sendHours < 10) {
							sendTimeText += "오전 " + "0" + sendHours;
						} else {
							sendTimeText += "오전 " + sendHours;
						}
						
						let sendMinutes = (d.sendDate.split(" ")[2]).split(":")[1];
						
						sendTimeText += ":" + sendMinutes;
						
						let msg = d.msg.split(" time, ")[1];
					if(d.sessionId == $("#sessionId").val()){
						$(".chatting_contents_con").append('<li class="my_msg"><div class="col-12 chatting_contents"><span>' + msg+ '</span><span class="time">' + sendTimeText + '</span></div></li>');	
					}else{
						$(".chatting_contents_con").append('<li><div class="col-12 user_name">' + d.userName + '</div><div class="col-12 chatting_contents"><span>' + msg+ '</span><span class="time">' + sendTimeText + '</span></div></li>');
					}
						
				}else{
					console.warn("unknown type!")
				}
			}
		}
	}
	
	,send : function() {
		
		let sendDate = new Date();
		let sendYear = sendDate.getFullYear();
		let sendMonth = (sendDate.getMonth() + 1) > 9 ? (sendDate.getMonth() + 1) : '0' + (sendDate.getMonth() + 1);
		let sendDay = sendDate.getDate() > 9 ? sendDate.getDate() : '0' + sendDate.getDate();
		let sendDayOfWeek = sendDate.getDay();
		let sendHours = sendDate.getHours() > 9 ? sendDate.getHours() : '0' + sendDate.getHours();
		let sendMinutes = sendDate.getMinutes() > 9 ? sendDate.getMinutes() : '0' + sendDate.getMinutes();
		
		let option ={
			type: "message",
			userSn : $("#userSn").val(),
			chatSn: $("#chatSn").val(),
			sessionId : $("#sessionId").val(),
			userName : $("#userName").val(),
			msg : sendYear + '-' + sendMonth + '-' + sendDay + ' ' + sendDayOfWeek + ' ' + sendHours + ':' + sendMinutes + ' time, ' + $("#chattingInput").val(),
			sendDate : sendYear + '-' + sendMonth + '-' + sendDay + ' ' + sendDayOfWeek + ' ' + sendHours + ':' + sendMinutes
		};
		this.ws.send(JSON.stringify(option));
		$('#chattingInput').val("");
	};
	
	,exit : function(){
		let _this = this;
		
		let sendDate = new Date();
		let sendYear = sendDate.getFullYear();
		let sendMonth = sendDate.getMonth() > 9 ? sendDate.getMonth() : '0' + sendDate.getMonth();
		let sendDay = sendDate.getDate() > 9 ? sendDate.getDate() : '0' + sendDate.getDate();
		let sendDayOfWeek = sendDate.getDay();
		let sendHours = sendDate.getHours();
		let sendMinutes = sendDate.getMinutes() > 9 ? sendDate.getMinutes() : '0' + sendDate.getMinutes();
		
		if(confirm("나가시겠습니까?")){
			let option ={
				type: "message",
				userSn : $("#userSn").val(),
				chatSn: $("#chatSn").val(),
				sessionId : $("#sessionId").val(),
				userName : $("#userName").val(),
				msg : sendYear + '-' + sendMonth + '-' + sendDay + ' ' + sendDayOfWeek + ' ' + sendHours + ':' + sendMinutes + ' time, ' + $("#userName").val() + "님께서 나가셨습니다",
				sendDate : sendYear + '-' + sendMonth + '-' + sendDay + ' ' + sendDayOfWeek + ' ' + sendHours + ':' + sendMinutes
			}
			this.ws.send(JSON.stringify(option));
			
			_this.exitChat();
		}
		
	};
	
	,exitChat : function(){
		let params = JSON.stringify({chatSn : $("#chatSn").val(), userSn : $("#userSn").val()});
		
		$.ajax({
			url : "/personal/exitChat"
			,contentType : 'application/json; charset=UTF-8'
			,dataType : "json"
			,data : params
			,type : "post"
			,async : false
			,timeoutDelay : 90000
			,success : function(result){
				if(result.result){
					location.href = document.referrer;	
				}
			}
			,error:function(request,status,error){
    			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    		}
		});
	};
}

$(document).ready(function(){
	chatting.init();
})