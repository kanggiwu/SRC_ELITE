var eventModal = $('#eventModal');

var modalTitle = $('.modal-title');
var editAllDay = $('#edit-allDay');
var editTitle = $('#edit-title');
var editUserName = $('#edit-username');
var editStart = $('#edit-start');
var editEnd = $('#edit-end');
var editType = $('#edit-type');
var editColor = $('#edit-color');
var editDesc = $('#edit-desc');

var addBtnContainer = $('.modalBtnContainer-addEvent');
var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');

/**********************************************************************
 * 예약이 겹치면 실패페이지로 넘어가고 거기서 다시 메인서비스로 이동하자. forward
 **********************************************************************/

/* ****************
 *  새로운 일정 생성
 * ************** */
var newEvent = function (start, end, eventType) {

	//alert('eventType: '+eventType);
	var color = '';
	//회의실에 맞게 색깔들어가기
	if(eventType == '제1회의실'){
		//alert('eventType if: '+eventType);
		color = "#"+$("#edit-color option:eq(0)").val();
	}
	else if(eventType == '제2회의실'){
		color = "#"+$("#edit-color option:eq(1)").val();
	}
	else if(eventType == '제3회의실'){
		color = "#"+$("#edit-color option:eq(2)").val();
	}
	else if(eventType == '제4회의실'){
		color = "#"+$("#edit-color option:eq(3)").val();
	}
	alert('color: '+color);
	
    $("#contextMenu").hide(); //메뉴 숨김

    modalTitle.html('새로운 일정');
    editType.val(eventType).prop('selected', true);
    editTitle.val('');
    editUserName.val('');
    //editColor.val(color).prop('selected', true);
    editColor.val(color).css('color',color);
    editStart.val(start);
    editEnd.val(end);
    editDesc.val('');
    
    addBtnContainer.show();
    modifyBtnContainer.hide();
    eventModal.modal('show');

//    /******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/
//    var eventId = 1 + Math.floor(Math.random() * 1000);
//    /******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/

    //새로운 일정 저장버튼 클릭
    $('#save-event').unbind();
    $('#save-event').on('click', function () {
    	alert('start: '+editStart.val());
        alert('end: '+editEnd.val());
        alert('bgColor: '+editColor.val());
        var eventData = {
  //          _id: eventId,
            title: editTitle.val(),
            start: editStart.val(),
            end: editEnd.val(),
            description: editDesc.val(),
            type: editType.val(),
            username: editUserName.val(),
            backgroundColor: editColor.val(),
  //          textColor: '#ffffff',
            allDay: false
        };

        if (eventData.start > eventData.end) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        if (eventData.title === '') {
            alert('일정명은 필수입니다.');
            return false;
        }

        var realEndDay;

        if (editAllDay.is(':checked')) {
            eventData.start = moment(eventData.start).format('YYYY-MM-DD');
            //render시 날짜표기수정
            eventData.end = moment(eventData.end).add(1, 'days').format('YYYY-MM-DD');
            //DB에 넣을때(선택)
            realEndDay = moment(eventData.end).format('YYYY-MM-DD');

            eventData.allDay = true;
        }

        $("#calendar").fullCalendar('renderEvent', eventData, true);
        eventModal.find('input, textarea').val('');
        editAllDay.prop('checked', false);
        eventModal.modal('hide');

        //새로운 일정 저장
        $.ajax({
            type: "get",
            url: "conAddRoom.erp?cfr_title="+eventData.title+"&cfr_memo="+eventData.description+
            "&cfr_sdate="+eventData.start+"&cfr_edate="+eventData.end+
            "&cfr_type="+eventData.type+"&cfr_allday="+eventData.allDay+"&cfr_bgcolor="+eventData.backgroundColor,
//            data: {
//                //.....
//            },
            success: function (response) {
            	if(response == 0){
            		alert("회 의 실 예 약 실 패");
            	}else{
            		alert("회 의 실 예 약 성 공");
            	}
                //DB연동시 중복이벤트 방지를 위한
                $('#calendar').fullCalendar('removeEvents');
                $('#calendar').fullCalendar('refetchEvents');
            }
        });
    });
};