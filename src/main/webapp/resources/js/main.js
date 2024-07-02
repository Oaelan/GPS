/**
 * 
 */
// main.js

function toggleMenu() {
  const slideMenu = document.getElementById('slideMenu');
  if (slideMenu.style.left === '-250px') {
    slideMenu.style.left = '0';
  } else {
    slideMenu.style.left = '-250px';
  }
}

function closeMenu() {
  const slideMenu = document.getElementById('slideMenu');
  slideMenu.style.left = '-250px';
}

function selectFloor(floor) {
    // 버튼 텍스트 변경
    document.getElementById('dropbtn').textContent = floor;
    
    // 드롭다운 메뉴 숨기기
    document.querySelector('.dropdown-content').style.display = 'none';
}

// 드롭다운 버튼 클릭 시 메뉴 토글
document.querySelector('.dropbtn').addEventListener('click', function() {
    const dropdownContent = document.querySelector('.dropdown-content');
    if (dropdownContent.style.display === 'block') {
        dropdownContent.style.display = 'none';
    } else {
        dropdownContent.style.display = 'block';
    }
});

//사용자 메뉴 열기
function openUserMenu() {
    document.getElementById('userMenu').style.right = '0';
}

// 사용자 메뉴 닫기
function closeUserMenu() {
    document.getElementById('userMenu').style.right = '-250px';
}


