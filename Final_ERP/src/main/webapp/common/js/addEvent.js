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
    $('#save-event').on('click', function () {

        var eventData = {
            schedule_title: editTitle.val(),
            schedule_type: editType.val(),
            schedule_startdate: editStart.val(),
            schedule_enddate: editEnd.val(),
            schedule_content: editDesc.val(),
            allDay: true
        };
        

        if (eventData.start > eventData.end) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }
		
		
        if (eventData.title === '') {
            alert('일정명은 필수입니다.');
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

        //새로운 일정 저장
        $.ajax({
            type: "get",
            url: "/schedule/insertSchedule.src1",
            data: {
                schedule_type: eventData.schedule_type,
                schedule_title: eventData.schedule_title,
                schedule_startdate: eventData.schedule_startdate,
                schedule_enddate: eventData.schedule_enddate,
                schedule_content:eventData.schedule_content
            },
            success: function (response) {
                //DB연동시 중복이벤트 방지를 위한
                //$('#calendar').fullCalendar('removeEvents');
                //$('#calendar').fullCalendar('refetchEvents');
            }
        });
    });
};