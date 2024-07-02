/**
 * 
 */

		// 사용자 ID 검증
	let userId = document.querySelector(".id");
	console.log(userId);
	let idLabel = document.getElementById("idLabel");
	idLabel.textContent = ".";
	idLabel.style.color = "white";
	userId.addEventListener("blur", () => {
	    var userIdPattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{5,20}$/;
	    if (userId.value.match(userIdPattern)) {
	        idLabel.textContent = "사용 가능한 아이디입니다.";
	        idLabel.style.color = "green";
	    } else {
	        idLabel.textContent = "사용자 ID는 영문자와 숫자를 조합하여 5-20자여야 합니다.";
	        idLabel.style.color = "red";
	    }
	});
	
	// 비밀번호 검증
	let password = document.querySelector(".pw");
	console.log(password);
	let pwLabel = document.getElementById("pwLabel");
	pwLabel.textContent = ".";
	pwLabel.style.color = "white";
	password.addEventListener("blur", () => {
	    var passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,25}$/;
	    if (password.value.match(passwordPattern)) {
	        pwLabel.textContent = "사용 가능한 비밀번호입니다.";
	        pwLabel.style.color = "green";
	    } else {
	        pwLabel.textContent = "비밀번호는 영문자, 숫자, 특수문자를 조합하여 8-25자여야 합니다.";
	        pwLabel.style.color = "red";
	    }
	});
	
	// 비밀번호 확인 함수
	let pwcheck = document.querySelector(".pwcheck");
	let confirmLabel = document.getElementById("confirmLabel");
	confirmLabel.textContent = ".";
	confirmLabel.style.color = "white";
	pwcheck.addEventListener("blur", () => {
	    var passwordValue = document.querySelector(".pw").value;
	    var confirmPassword = document.querySelector(".pwcheck").value;
	    if (passwordValue === confirmPassword) {
	        confirmLabel.textContent = "비밀번호가 일치합니다.";
	        confirmLabel.style.color = "green";
	    } else {
	        confirmLabel.textContent = "비밀번호가 일치하지 않습니다.";
	        confirmLabel.style.color = "red";
	    }
	});
	
	// 이름 검증
	let name = document.querySelector(".name");
	console.log(name);
	let nameLabel = document.getElementById("nameLabel");
	nameLabel.textContent = ".";
	nameLabel.style.color = "white";
	name.addEventListener("blur", () => {
	    var namePattern = /^[가-힣]{2,6}$/;
	    if (name.value.match(namePattern)) {
	        nameLabel.textContent = "사용할 수 있는 이름입니다.";
	        nameLabel.style.color = "green";
	    } else {
	        nameLabel.textContent = "이름은 한글만 2-6자여야 합니다.";
	        nameLabel.style.color = "red";
	    }
	});
	
	// 전화번호 검증
	let phone = document.querySelector(".phone");
	let phoneLabel = document.getElementById("phoneLabel");
	console.log(phone);
	phoneLabel.textContent = ".";
	phoneLabel.style.color = "white";
	
	phone.addEventListener("blur", () => {
	    var phonePattern = /^01[016789]-\d{3,4}-\d{4}$/;
	    if (phone.value.match(phonePattern)) {
	        phoneLabel.textContent = "올바른 전화번호 형식입니다.";
	        phoneLabel.style.color = "green";
	    } else {
	        phoneLabel.textContent = "올바른 전화번호 형식이 아닙니다.";
	        phoneLabel.style.color = "red";
	    }
	});
