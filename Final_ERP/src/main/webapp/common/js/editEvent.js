/* ****************
 *  일정 편집
 * ************** */
let editEvent = function (event, element, view) {

    $('#deleteEvent').data('id', event.id); //클릭한 이벤트 ID
    $('#deleteEvent').data('type', event.type); //클릭한 이벤트 TYPE
    $('#deleteEvent').data('schedule_writer', event.emp_no); //클릭한 이벤트 TYPE
    $('.popover.fade.top').remove();
    $(element).popover("hide");

    if (event.allDay === true) {
        editAllDay.prop('checked', true);
    } else {
        editAllDay.prop('checked', false);
    }

    if (event.end === null) {
        event.end = event.start;
    }

    if (event.allDay === true && event.end !== event.start) {
        editEnd.val(moment(event.end).subtract(1, 'days').format('YYYY-MM-DD HH:mm'))
    } else {
        editEnd.val(event.end.format('YYYY-MM-DD HH:mm'));
    }
    
    let ko_type = null;
    if (event.type === 3){
    	ko_type = '개인';
    }else if(event.type%10 === 0){
    	ko_type = '부서';
    }else if(event.type === 1){
    	ko_type = '공통';
    }else{
    	ko_type = '프로젝트';
    }
    
    modalTitle.html('일정 수정');
    editTitle.val(event.title);
    editUserName.val(event.username);
    editStart.val(event.start.format('YYYY-MM-DD HH:mm'));
    
    
    editType.val(event.type);
    editDesc.val(event.description);
    editColor.val(event.backgroundColor).css('color',event.backgroundColor);

    addBtnContainer.hide();
    modifyBtnContainer.show();
    eventModal.modal('show');

    //업데이트 버튼 클릭시
    $('#updateEvent').unbind();
    $('#updateEvent').off('click').on('click', function () {

        if (editStart.val() > editEnd.val()) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        if (editTitle.val() === '') {
            alert('일정명은 필수입니다.')
            return false;
        }

        let statusAllDay;
        let startDate;
        let endDate;
        let displayDate;

        if (editAllDay.is(':checked')) {
            statusAllDay = true;
            startDate = moment(editStart.val()).format('YYYY-MM-DD');
            endDate = moment(editEnd.val()).format('YYYY-MM-DD');
            displayDate = moment(editEnd.val()).add(1, 'days').format('YYYY-MM-DD');
        } else {
            statusAllDay = false;
            startDate = editStart.val();
            endDate = editEnd.val();
            displayDate = endDate;
        }

        eventModal.modal('hide');

        event.allDay = statusAllDay;
        event.title = editTitle.val();
        event.start = startDate;
        event.end = displayDate;
        event.type = editType.val();
        event.backgroundColor = editColor.val();
        event.description = editDesc.val();
        $("#calendar").fullCalendar('updateEvent', event);

		
        //일정 업데이트
        $.ajax({
            type: "post"
            ,url: "/schedule/updateSchedule.src1"
            ,data: {
                schedule_no:event.id,
				schedule_title:event.title,
            	schedule_content:event.description,
            	backgroundcolor:event.backgroundColor,
            	schedule_startdate:event.start,
            	schedule_enddate:event.end,
            	schedule_type:event.type,
            	allDay:event.allDay,
            	schedule_writer:event.emp_no
            },
            success: function (response) {
            	if(response == 0){
            		alert('일정수정 실패');
            	}else if(response == 3){
            		alert(ko_type+' 일정을 수정할 권한이 없는 사원입니다.');
            	}else{
            		alert('수정되었습니다.');
            	}
                $('#calendar').fullCalendar('removeEvents');
                $('#calendar').fullCalendar('refetchEvents');
            }
        });

    });
};

// 삭제버튼
$('#deleteEvent').off('click').on('click', function () {
    
    $('#deleteEvent').unbind();
    
    eventModal.modal('hide');
	let schedule_no = $(this).data('id');
	let schedule_type = $(this).data('type');
	let schedule_writer = $(this).data('schedule_writer');
	
    //삭제시
    $.ajax({
        type: "post",
        url: "/schedule/deleteSchedule.src1",
        data: {
            schedule_no:schedule_no,
            schedule_type:schedule_type,
            schedule_writer:schedule_writer
        },
        success: function (response) {
        	if(response == 0){
        		alert('일정삭제 실패.');
        	}else if(response == 3){
            	alert('일정을 삭제할 권한이 없는 사원입니다.');
            		
            }else{
        		alert('삭제되었습니다.');
        		$("#calendar").fullCalendar('removeEvents', $(this).data('id'));
        	}
            $('#calendar').fullCalendar('removeEvents');
            $('#calendar').fullCalendar('refetchEvents');
        }
    });

});