/***********************************************************************************
 * 윈도우 팝업창 처리 구현
 * @param1 : 화면에 띄울 페이지 url
 * @param2 : 팝업창에 가로 길이
 * @param3 : 팝업창의 세로 길이
 * @oaram4 : 팝업창의 이름
 ***********************************************************************************/
function cmm_window_popup(url, popupwidth, popupheight, popupname)
{	//해상도(1600*1024) , 팝업창 크기(700*450)
	Top = (window.screen.height-popupheight)/3; //(1024-450)/3 => 191 [소수점은 무시]
	Left =(window.screen.width-popupwidth)/2; // /2는 가운데 정렬을 위한 것. (1600-700)/2 => 450
	if(Top<0) Top = 0; //듀얼모니터를 쓰는 경우가 아니니 -값이 나오면 해당사항이 없으므로 0으로 셋팅 -값이 나오면 화면이 안보임
	if(Left<0) Left = 0;
	options = "location=yes, fullscreen=no, status=no";
	options += ", left="+Left+", top="+Top;
	options +=", width="+popupwidth+", height="+popupheight;
	popupname = window.open(url,popupname,options);//window.open:페이지의 팝업창을 오픈하기.target:내가 팝업창을 띄울 위치 ex. 부모창, 내창, 3자 창 등등
} 