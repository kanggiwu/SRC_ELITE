// 사이드메뉴
// collapsed = 트리메뉴 사용여부
// collapseData = 첫번째 트리메뉴 정보
// subData = 두번째 트리메뉴 정보

const sideNavMainTitleApi = [
  {
    id: "group",
    title: "공지사항",
    className: "",
    ref: "/notice/getAllNoticeList.src1",
    onClick: "#",
    collapsed: false,
  },
  {
    id: "myservice",
    title: "마이 페이지",
    
    icon: "fa-user",
    collapsed: true,
    subMenu: false,
    ref: "#",
    collapseData: [
      {
        id: "goto",
        title: "내 정보 조회",
        className: "",
        ref: "/mypage/getMyInfo.src1",
        onClick: "",
        collapsed: false,
      },
      {
        id: "salary",
        title: "급여조회",
        className: "",
        ref: "../mypage/getMySalary.src1",
        onClick: "",
        collapsed: false,
      },
    ],
  },
  {
    id: "group",
    title: "조직도",
    className: "",
    ref: "/humanresource/getOrganizationChart.src1",
    onClick: "",
    collapsed: false,
  },
  {
    id: "personal",
    title: "일정",
    className: "",
    ref: "/myService/empSchedule.jsp",
    onClick: "",
    collapsed: false,
  },
  {
    id: "approval",
    title: "회계",//전자결제
    className: "",
    icon: "fas fa-edit",
    ref: "#",
    onClick: "",
    collapsed: true,
    collapseData: [
        {
          id: "approval_my",
          title: "급여 정산",//"내 결제함",
          className: "",
          ref: "#",
          onClick: "",
        },
        {
          id: "approval_form",
          title: "수익관리",//"결재양식",
          className: "",
          ref: "#",
          onClick: "",
        },
        {
          id: "approval_send",
          title: "지출관리",//"결재신청",
          className: "",
          ref: "#",
          onClick: "",
        },
        {
        id: "approval_wb",
        title: "손익조회",//"휴지통",
        className: "",
        ref: "#",
        onClick: "",
        },
        {
        id: "approval_wb",
        title: "월말정산",//"휴지통",
        className: "",
        ref: "#",
        onClick: "",
        },
        ],
      },
      
      
  {
    id: "rank",
    title: "인사",
    className: "",
    ref: "#",
    onClick: "",
    collapsed: true,
    collapseData: [
      {
        id: "group",
        title: "조직도 수정",
        className: "",
        ref: "../humanresource/getOrganizationChart.src1",
        onClick: "",
      },
      {
        id: "management",
        title: "사원관리",
        className: "",
        ref: "/humanresource/getEmployeeList.src1",
        onClick: "",
      },
    ],
  },
  {
    id: "conference",
    title: "전자결재", //conference
    icon: "fas fa-calendar",
    collapsed: true,
    collapseData: [
      {
        id: "dispatch",
        title: "신청",//"파견사원",
        className: "",
        ref: "#",
        onClick: "",
      },
      {
        id: "admin",
        title: "발신함",//"관리자",
        className: "",
        ref: "#",
        onClick: "location.href='../work/manager_log.jsp'",
        collapsed: false,
      },
      {
        id: "department",
        title: "수신함",//"부서일정",
        className: "",
        ref: "../work/deptEmp.erp",
        onClick: "",
        collapsed: false,
        
      },
    ]
  },
  {
    id: "chat",
    title: "프로젝트 관리",//"Chat",
    icon: "fas fa-comments",
    ref: "/projecthistory/getProjectHistoryList.src1",
    collapsed: false,
  },
];

//정보수정,로그아웃 버튼
const avatarBoxButtonApi = [
  {
    text: "출근",
    classname: "avatar_button btn btn-info",
    id: "avatarBoxButton_edit",
    ref: "/main/insertAttendanceTime.src1",
  },
  {
    text: "로그아웃",
    classname: "avatar_button btn btn-danger",
    id: "avatarBoxButton_logout",
    ref: "/main/logout.src1",
  },
];

const sideNav = document.querySelector("#layoutSidenav_nav");

const nav = document.createElement("nav"); //네비게이션 wrapper
const navClasslist = "sb-sidenav accordion sb-sidenav-dark"; //네비게이션 wrapper class
const navId = "sidenavAccordion"; //네비게이션 wrapper id
const navStyle = "background-color: #323232;"; //네비게이션 wrapper style

const avatarBoxCreate = document.createElement("div"); //네비게이션 아바타 warpper
const avatarBoxClassname = "avatar_box"; //네비게이션 아바타 warpper class

const avatarBoxImage = document.createElement("img"); //네비게이션 아바타 img
const avatarBoxImageSrc = "../common/img/woma.png"; //네비게이션 아바타 img src
const avatarBoxImageAlt = "Avatar"; //네비게이션 아바타 img alt
const avatarBoxImageClassname = "avatar"; //네비게이션 아바타 img class

const avatarButtonBoxCreate = document.createElement("div"); //네비게이션 아바타 button
const avatarButtonBoxClassname = "avatar_button_box"; //네비게이션 아바타 button class

const mainMenuWrapper = document.createElement("div");
const mainMenuWrapperClassname = "sb-sidenav-menu";

const mainMenuBox = document.createElement("nav");
const mainMenuBoxClassName = "nav";

const mainMenuTextBoxClassname = "sb-nav-link-icon";

//side nav dom 생성
function generateSideNav() {
  sideNav.appendChild(nav);

  nav.classList = navClasslist;
  nav.id = navId;
  nav.style = navStyle;
  nav.appendChild(avatarBoxCreate);

  avatarBoxCreate.classList = avatarBoxClassname;
  //avatarBoxCreate.appendChild(avatarBoxImage);
  //avatarBoxImage.src = avatarBoxImageSrc;
  //avatarBoxImage.alt = avatarBoxImageAlt;
  //avatarBoxImage.classList = avatarBoxImageClassname;

  avatarBoxCreate.appendChild(avatarButtonBoxCreate);
  avatarButtonBoxCreate.classList = avatarButtonBoxClassname;

  avatarBoxButtonApi.map((val) => {
    const avatarButton = document.createElement("button");
    const buttonAction = () => {
      window.location.href = val.ref;
    };
    avatarButton.addEventListener("click", buttonAction);
    avatarButton.classList = val.classname;
    avatarButton.id = val.id;
    avatarButton.innerHTML = val.text;
    avatarButton.click = "d";
    avatarButtonBoxCreate.appendChild(avatarButton);
  });

  nav.appendChild(mainMenuWrapper);
  mainMenuWrapper.classList = mainMenuWrapperClassname;
  mainMenuWrapper.appendChild(mainMenuBox);
  mainMenuBox.classList = mainMenuBoxClassName;

  sideNavMainTitleApi.map((val) => {
    const mainMenu = document.createElement("div");
    if (val.collapsed === true && val.collapseData) {
      const enbleCollapse = `<a class="nav-link collapsed" href=${val.ref} id="enbleCollapse" data-toggle="collapse" data-target="#${val.id}" aria-expanded="false" aria-controls="collapseLayouts">`;
      const mainMenuIcon = `<div class="sb-nav-link-icon"><i class="fas ${val.icon}"></i></div>`;
      const mainMenuText = `${val.title}<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div></a>`;

      //서브메뉴 사용안할때 반환
      const falseSubBox = `<div class="collapse" id=${val.id} aria-labelledby=${val.id} data-parent="#sidenavAccordion"><nav class="sb-sidenav-menu-nested nav">`;
      const filterSubFalse = val.collapseData.filter((val) => {
        return !val.collapsed;
      });
      const falseSubMenuText = filterSubFalse.map((data) => {
        const subMenuContents = ` <a class="nav-link ${data.className}" href=${data.ref}>${data.title}</a>`;
        return subMenuContents;
      });

      //서브메뉴 사용할때 반환
      const filterSubTrue = val.collapseData.filter((val) => {
        return val.collapsed === true;
      });
      const trueSubBox = `<div class="collapse" id=${val.id} aria-labelledby=${val.id} data-parent="#sidenavAccordion"><nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">`;
      const trueSubMenuText = filterSubTrue.map((data) => {
        const trueSubMenuTexts = `<a class="nav-link collapsed" href=${data.ref} data-toggle="collapse" data-target="#${data.id}" aria-expanded="false" aria-controls=${data.id}>${data.title}<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div></a>`;
        const truesub_2 = `<div class="collapse" id="${data.id}" aria-labelledby=${data.id} data-parent="#sidenavAccordionPages"><nav class="sb-sidenav-menu-nested nav">`;
        const truesub_3 = data.subData.map((data) => {
          return `<a class="nav-link" href=${data.ref}>${data.title}</a>`;
        });
        return (
          trueSubMenuTexts + truesub_2 + truesub_3.join("") + `</nav></div>`
        );
      });
      const enalbeCollapse =
        enbleCollapse +
        mainMenuIcon +
        mainMenuText +
        trueSubBox +
        trueSubMenuText.join("") +
        `</nav></div>` +
        falseSubBox +
        falseSubMenuText.join("");
      mainMenuBox.appendChild(mainMenu);
      mainMenu.innerHTML = enalbeCollapse;
    } else {
      const disableCollapse = `<a class="nav-link" href=${val.ref}><div class="sb-nav-link-icon"><i class="fas ${val.icon}"></i></div>${val.title}</a>`;
      mainMenuBox.appendChild(mainMenu);
      mainMenu.innerHTML = disableCollapse;
    }
  });
}

generateSideNav();

//사이드 메인타이틀 생성