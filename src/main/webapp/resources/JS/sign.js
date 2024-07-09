// 사용자 ID 검증
let userId = document.querySelector(".id");
let idLabel = document.getElementById("idLabel");
idLabel.textContent = ".";
idLabel.style.color = "white";
userId.addEventListener("input", validateUserId);

function validateUserId() {
    var userIdPattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{7,20}$/;
    if (userId.value.match(userIdPattern)) {
        idLabel.textContent = "사용 가능한 아이디입니다.";
        idLabel.style.color = "green";
        return true;
    } else {
        idLabel.textContent = "사용자 ID는 영문자와 숫자를 조합하여 7-20자여야 합니다.";
        idLabel.style.color = "red";
        return false;
    }
}

// 비밀번호 검증
let password = document.querySelector(".pw");
let pwLabel = document.getElementById("pwLabel");
pwLabel.textContent = ".";
pwLabel.style.color = "white";
password.addEventListener("input", validatePassword);
password.addEventListener("input", validatePasswordConfirmation);


function validatePassword() {
    var passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,25}$/;
    if (password.value.match(passwordPattern)) {
        pwLabel.textContent = "사용 가능한 비밀번호입니다.";
        pwLabel.style.color = "green";
        return true;
    } else {
        pwLabel.textContent = "비밀번호는 영문자, 숫자, 특수문자를 조합하여 8-25자여야 합니다.";
        pwLabel.style.color = "red";
        return false;
    }
}

// 비밀번호 확인 함수
let pwcheck = document.querySelector(".pwcheck");
let confirmLabel = document.getElementById("confirmLabel");
confirmLabel.textContent = ".";
confirmLabel.style.color = "white";
pwcheck.addEventListener("input", validatePasswordConfirmation);

function validatePasswordConfirmation() {
    var passwordValue = document.querySelector(".pw").value;
    var confirmPassword = document.querySelector(".pwcheck").value;
    if (passwordValue === confirmPassword) {
        confirmLabel.textContent = "비밀번호가 일치합니다.";
        confirmLabel.style.color = "green";
        return true;
    } else {
        confirmLabel.textContent = "비밀번호가 일치하지 않습니다.";
        confirmLabel.style.color = "red";
        return false;
    }
}

// 이름 검증
let name = document.querySelector(".name");
let nameLabel = document.getElementById("nameLabel");
nameLabel.textContent = ".";
nameLabel.style.color = "white";
name.addEventListener("input", validateName);

function validateName() {
    var namePattern = /^[가-힣]{2,6}$/;
    if (name.value.match(namePattern)) {
        nameLabel.textContent = "사용할 수 있는 이름입니다.";
        nameLabel.style.color = "green";
        return true;
    } else {
        nameLabel.textContent = "이름은 한글만 2-6자여야 합니다.";
        nameLabel.style.color = "red";
        return false;
    }
}

// 전화번호 검증
let phone = document.querySelector(".phone");
let phoneLabel = document.getElementById("phoneLabel");
phoneLabel.textContent = ".";
phoneLabel.style.color = "white";
phone.addEventListener("input", validatePhone);

function validatePhone() {
    var phonePattern = /^01[016789]-\d{3,4}-\d{4}$/;
    if (phone.value.match(phonePattern)) {
        phoneLabel.textContent = "올바른 전화번호 형식입니다.";
        phoneLabel.style.color = "green";
        return true;
    } else {
        phoneLabel.textContent = "올바른 전화번호 형식이 아닙니다.";
        phoneLabel.style.color = "red";
        return false;
    }
}

// 폼 제출 검증
let form = document.querySelector("form");
form.addEventListener("submit", (event) => {
    let isUserIdValid = validateUserId();
    let isPasswordValid = validatePassword();
    let isPasswordConfirmationValid = validatePasswordConfirmation();
    let isNameValid = validateName();
    let isPhoneValid = validatePhone();

    if (!isUserIdValid || !isPasswordValid || !isPasswordConfirmationValid || !isNameValid || !isPhoneValid) {
        event.preventDefault();
        alert("필드를 올바르게 입력해주세요.");
    }
});
