const topNav = document.querySelector("#topNav");

const title = "ERP APPLICATION"; //메인탑 메뉴 타이틀
const tobNavClass = "sb-topnav navbar navbar-expand navbar-dark"; //메인탑 클래스 추가
const topNavStyle = "background-color: #282828; text-align: center;"; //메인탑 css 추가

const button = document.createElement("button"); //메인탑 햄버거 버튼 생성
const buttonClass = "btn btn-link btn-sm order-1 order-lg-0"; //메인탑 햄버거 버튼 클래스
const buttonId = "sidebarToggle"; //햄버거버튼 id
const buttonRef = "#"; //버튼 링크

const i = document.createElement("i"); // 햄버거버튼 아이콘
const iClass = "fas fa-bars"; //아이콘 클래스
const iStyle = "font-size:25px"; // 아이콘 크기

const mainTitle = document.createElement("a"); //메인타이틀 a태그
const mainTitleClass = "navbar-brand"; //메인타이틀 클래스
const mainTitleStyle = "width:100%"; //메인타이틀 스타일
const mainTitleText = "SourceELITE"; //메인타이틀 텍스트
const mainTitleRef = "/erp_lab/main_content.jsp"; //메인 타이틀 링크

//Top nav dom 생성
function generateTopNav() {
  topNav.classList = tobNavClass;
  topNav.style = topNavStyle;
  topNav.appendChild(button);
  button.classList = buttonClass;
  button.id = buttonId;
  button.href = buttonRef;
  button.appendChild(i);
  i.classList = iClass;
  i.style = iStyle;
  topNav.appendChild(mainTitle);
  mainTitle.classList = mainTitleClass;
  mainTitle.href = mainTitleRef;
  mainTitle.innerHTML = mainTitleText;
  mainTitle.style = mainTitleStyle;
}

generateTopNav();
