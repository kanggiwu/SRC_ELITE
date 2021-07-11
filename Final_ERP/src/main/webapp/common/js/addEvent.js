let eventModal = $('#eventModal');
let editUserName = $('#edit-username');
let modalTitle = $('.modal-title');
let editAllDay = $('#edit-allDay');
let editTitle = $('#edit-title');
let editStart = $('#edit-start');
let editEnd = $('#edit-end');
let editType = $('#edit-type');
let editColor = $('#edit-color');
let editDesc = $('#edit-desc');
let empDept = $('#emp_dept');

let addBtnContainer = $('.modalBtnContainer-addEvent');
let modifyBtnContainer = $('.modalBtnContainer-modifyEvent');


/* ****************
 *  새로운 일정 생성
 * ************** */
let newEvent = function (start, end, eventType) {
    $("#contextMenu").hide(); //메뉴 숨김

  
    modalTitle.html('일정 추가');
    editType.val(eventType).prop('selected', true);
    editTitle.val('');
    editStart.val(start);
    editEnd.val(end);
    editDesc.val('');
    
    addBtnContainer.show();
    modifyBtnContainer.hide();
    eventModal.modal('show');


    //새로운 일정 저장버튼 클릭
    $('#save-event').unbind();
    $(document).off('click').on('click','#save-event', function () {

        let eventData = {
            schedule_title: editTitle.val(),
            schedule_type: editType.val(),
            schedule_startdate: editStart.val(),
            schedule_enddate: editEnd.val(),
            schedule_content: editDesc.val(),
            backgroundcolor: editColor.val(),
            allDay: false
        };
		
		
		console.log(eventData.schedule_enddate+"일정 마감일");
		console.log(eventData.backgroundcolor+"색을 넣어본다");
		
        if (eventData.start > eventData.end) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }
		
        if (eventData.schedule_title === '') {
            alert('일정명은 필수입니다.');
            return false;
        }
        if (eventData.schedule_type === null ) {
            alert('분류는 필수입니다.');
            return false;
        }

       	let realEndDay;

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
		
		let schedule_type 		=	eventData.schedule_type;
		let schedule_title 	=	eventData.schedule_title;
		let schedule_startdate =	eventData.schedule_startdate;
		let schedule_enddate 	=	eventData.schedule_enddate;
		let schedule_content	=	eventData.schedule_content;
		let color 	=	eventData.backgroundcolor;
		let all_Day 			=	eventData.allDay;
		console.log("끝나는 날"+schedule_enddate);
        //새로운 일정 저장
        $.ajax({
            type: "post",
            url: "/schedule/insertSchedule.src1",
            data: {
                schedule_type: 			schedule_type, 		
                schedule_title: 		schedule_title, 		
                schedule_startdate: 	schedule_startdate, 
                schedule_enddate: 		schedule_enddate, 	
                backgroundcolor: 		color, 	
                allDay: 				all_Day, 				
                schedule_content:		schedule_content	
            },
            success: function (response) {
            	if(response == 0){
            		alert('일정추가 실패');
            	}else if(response == 3){
            	    let ko_type = null;
					if(event.type%10 === 0){
						ko_type = '부서';
					}else if(event.type === 1){
						ko_type = '공통';
					}else{
						ko_type = '프로젝트';
					}
            		alert(ko_type+' 일정 추가 권한이 없는 사원입니다.');
            	}else{
            		alert('일정이 추가되었습니다.');
            	}
                $('#calendar').fullCalendar('removeEvents');
                $('#calendar').fullCalendar('refetchEvents');
            }
        });
    });
};