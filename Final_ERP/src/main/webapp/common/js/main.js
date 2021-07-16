let draggedEventIsAllDay;
let activeInactiveWeekends = true;

let calendar = $('#calendar').fullCalendar({

 /** ******************
   *  OPTIONS
   * *******************/
  locale                    : 'ko',    
  timezone                  : "local", 
  nextDayThreshold          : "09:00:00",
  allDaySlot                : true,
  displayEventTime          : true,
  displayEventEnd           : true,
  firstDay                  : 0, //월요일이 먼저 오게 하려면 1
  weekNumbers               : false,
  selectable                : true,
  weekNumberCalculation     : "ISO",
  eventLimit                : true,
  views                     : { 
                                month : { eventLimit : 12 } // 한 날짜에 최대 이벤트 12개, 나머지는 + 처리됨
                              },
  eventLimitClick           : 'week', //popover
  navLinks                  : true,
  timeFormat                : 'HH:mm',
  defaultTimedEventDuration : '01:00:00',
  editable                  : true,
  minTime                   : '00:00:00',
  maxTime                   : '24:00:00',
  slotLabelFormat           : 'HH:mm',
  weekends                  : true,
  nowIndicator              : true,
  dayPopoverFormat          : 'MM/DD dddd',
  longPressDelay            : 0,
  eventLongPressDelay       : 0,
  selectLongPressDelay      : 0,  
  header                    : {
                                left   : 'prevYear, today, nextYear',
                                center : 'prev, title, next',
                                right  : 'viewWeekends, month, listWeek'
                              },
  views                     : {
                                month : {
                                  columnFormat : 'dddd'
                                },
                                agendaWeek : {
                                  columnFormat : 'M/D ddd',
                                  titleFormat  : 'YYYY년 M월 D일',
                                  eventLimit   : false
                                },
                                agendaDay : {
                                  columnFormat : 'dddd',
                                  eventLimit   : false
                                },
                                listWeek : {
                                  columnFormat : ''
                                }
                              },
  customButtons             : { //주말 숨기기 & 보이기 버튼
                                viewWeekends : {
                                  text  : '주말',
                                  click : function () {
                                    activeInactiveWeekends ? activeInactiveWeekends = false : activeInactiveWeekends = true;
                                    $('#calendar').fullCalendar('option', { 
                                      weekends: activeInactiveWeekends
                                    });
                                  }
                                }
                               },

schedule_type: -1,

  eventRender: function (event, element, view) {

    //일정에 hover시 요약
    element.popover({
      title: $('<div />', {
        class: 'popoverTitleCalendar',
        text: "[제목] " + event.title
      }).css({
        'background': event.backgroundColor,
        'color': event.textColor
      }),
      content: $('<div />', {
          class: 'popoverInfoCalendar'
        }).append('<p><strong>사원번호:</strong> ' + event.emp_no + '</p>')
        .append('<p><strong>작성자:</strong> ' + event.username + '</p>')
        .append('<p><strong>시간:</strong> ' + moment(event.start).format('YYYY-MM-DD HH:mm') + '</p>')
        .append('<p><strong>시간:</strong> ' + moment(event.end).format('YYYY-MM-DD HH:mm') + '</p>')
        .append('<div class="popoverDescCalendar"><strong>내용:</strong> ' + event.description + '</div>'),
      delay: {
        show: "800",
        hide: "50"
      },
      trigger: 'hover',
      placement: 'top',
      html: true,
      container: 'body'
    });

    return filtering(event);
  },

  /* ****************
   *  일정 받아옴 
   * ************** */
  events: function (start, end, timezone, callback) {
  	  $.ajax({
      type: "get",
      url: "../schedule/getCalendarSchedule.src1",
      data: {
        // 화면이 바뀌면 Date 객체인 start, end 가 들어옴
        startDate : moment(start).format('YYYY-MM-DD'),
        endDate   : moment(end).format('YYYY-MM-DD'),
      },
      processData: true,
      success: function (data) {
      	let  result = data;
      	let jsonDoc = JSON.parse(result);
        let fixedDate = jsonDoc.map(function (array) {
			if (array.allDay && array.start!== array.end) {
            array.end = moment(array.end).add(1, 'days'); // 이틀 이상 AllDay 일정인 경우 달력에 표기시 하루를 더해야 정상출력
          	
          }
          return array;
        });
        callback(fixedDate);
      },
      error:function(data){
        alert("에러");
      }
    });
  },

  eventAfterAllRender: function (view) {
    if (view.name == "month") $(".fc-content").css('height', 'auto');
  },



  eventDragStart: function (event, jsEvent, ui, view) {
    draggedEventIsAllDay = event.allDay;
  },

  //일정 드래그앤드롭
  eventDrop: function (event, delta, revertFunc, jsEvent, ui, view) {
    $('.popover.fade.top').remove();

    //주,일 view일때 종일 <-> 시간 변경불가
    if (view.type === 'agendaWeek' || view.type === 'agendaDay') {
      if (draggedEventIsAllDay !== event.allDay) {
        location.reload();
        return false;
      }
    }

    // 드랍시 수정된 날짜반영
    let newDates = calDateWhenDragnDrop(event);
    //드롭한 일정 업데이트
    $.ajax({
      	type: "post",
		url: "/schedule/updateDateSchedule.src1",
    	data: {
    		  schedule_no:event.id,
           	schedule_startdate:newDates.startDate,
            	schedule_enddate:newDates.endDate,
            	schedule_writer:event.emp_no,
            	schedule_type:event.type
      },
      success: function (response) {
        if(response == 0){
            		alert('일정수정 실패');
            	}else if(response == 3){
            		alert('해당 일정을 수정할 권한이 없는 사원입니다.');
            	}else{
            		alert('수정되었습니다.');
            	}
            	$('#calendar').fullCalendar('removeEvents');
                $('#calendar').fullCalendar('refetchEvents');
      }
    });

  },

  select: function (startDate, endDate, jsEvent, view) {

    $(".fc-body").unbind('click');
    $(".fc-body").on('click', 'td', function (e) {


      $("#contextMenu")
        .addClass("contextOpened")
     
     if($(window).width() <991) {
      $("#contextMenu").css({
          display: "block",
          left: e.pageX,
          top: e.pageY-73
        });
      }
      else{
        $("#contextMenu").css({
          display: "block",
          left: e.pageX-220,
          top: e.pageY-73
        });
      
      }
      
      return false;
    });

    let today = moment();

    if (view.name == "month") {
      startDate.set({
        hours: today.hours(),
        minute: today.minutes()
      });
      startDate = moment(startDate).format('YYYY-MM-DD HH:mm');
      endDate = moment(endDate).subtract(1, 'days');

      endDate.set({
        hours: today.hours() + 1,
        minute: today.minutes()
      });
      endDate = moment(endDate).format('YYYY-MM-DD HH:mm');
    } else {
      startDate = moment(startDate).format('YYYY-MM-DD HH:mm');
      endDate = moment(endDate).format('YYYY-MM-DD HH:mm');
    }

    //날짜 클릭시 카테고리 선택메뉴
    let $contextMenu = $("#contextMenu");
    $contextMenu.on("click", "a", function (e) {
      e.preventDefault();

      //닫기 버튼이 아닐때
      if ($(this).data().role !== 'close') {
        newEvent(startDate, endDate, $(this).html());
      }

      $contextMenu.removeClass("contextOpened");
      $contextMenu.hide();
    });

    $('body').on('click', function () {
      $contextMenu.removeClass("contextOpened");
      $contextMenu.hide();
    });

  },

  //이벤트 클릭시 수정이벤트
  eventClick: function (event, jsEvent, view) {
    editEvent(event);
  },
  

});

function getDisplayEventDate(event) {

  let displayEventDate;

  if (event.allDay == false) {
    let startTimeEventInfo = moment(event.start).format('HH:mm');
    let endTimeEventInfo = moment(event.end).format('HH:mm');
    displayEventDate = startTimeEventInfo + " - " + endTimeEventInfo;
  } else {
    displayEventDate = "하루종일";
  }

  return displayEventDate;
}

function filtering(event) {
  
  let show_type = true;

  let schedule_type = $('input:checkbox.filter:checked').map(function () {
    return $(this).val();
  }).get();

  show_type = schedule_type.indexOf(String(event.type)) >= 0;

  return  show_type;
}

function calDateWhenDragnDrop(event) {
  // 드랍시 수정된 날짜반영
  let newDates = {
    startDate: moment(event.start._d).format('YYYY-MM-DD'),
    endDate: moment(event.end._d).format('YYYY-MM-DD')
  }
   

  // 날짜 & 시간이 모두 같은 경우
  if(!event.end) {
    event.end = event.start;
  }

  //하루짜리 all day
  if (event.allDay && event.end === event.start) {
    newDates.startDate = moment(event.start._d).format('YYYY-MM-DD');
    newDates.endDate = newDates.startDate;
  }

  //2일이상 all day
  else if (event.allDay && event.end !== null) {
    newDates.startDate = moment(event.start._d).format('YYYY-MM-DD');
    newDates.endDate = moment(event.end._d).subtract(1, 'days').format('YYYY-MM-DD');
  }

  //all day가 아님
  else if (!event.allDay) {
    newDates.startDate = moment(event.start._d).format('YYYY-MM-DD');
    newDates.endDate = moment(event.end._d).format('YYYY-MM-DD');
  }

  return newDates;
}