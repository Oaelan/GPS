/**
 * 
 */
	// 주민등록번호 유효성 검사식
	document.addEventListener("DOMContentLoaded", function() {
    const p_id = document.querySelector(".p_id");
    const p_idLabel = document.getElementById("p_idLabel");

    p_idLabel.textContent = ".";
    p_idLabel.style.color = "white";

    p_id.addEventListener("blur", () => {
        if (isValidResidentRegistrationNumber(p_id.value)) {
            p_idLabel.textContent = "올바른 주민등록번호 형식입니다.";
            p_idLabel.style.color = "green";
        } else {
            p_idLabel.textContent = "-를 포함해서 입력해주세요 ex) 990101-4567890";
            p_idLabel.style.color = "red";
        }
    });

    function isValidResidentRegistrationNumber(rrn) {
        const pattern = /^\d{6}-\d{7}$/;
        if (!pattern.test(rrn)) {
            return false;
        }

        rrn = rrn.replace("-", "");

        if (rrn.length !== 13) {
            return false;
        }

        const weight = [2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5];
        let sum = 0;

        for (let i = 0; i < 12; i++) {
            sum += parseInt(rrn[i], 10) * weight[i];
        }

        const checkDigit = (11 - (sum % 11)) % 10;

        return checkDigit === parseInt(rrn[12], 10);
    }

    // 환자 연락처 유효성 검사식
    const p_phone = document.querySelector(".p_phone");
    const p_phoneLabel = document.getElementById("p_phoneLabel");

    p_phoneLabel.textContent = ".";
    p_phoneLabel.style.color = "white";
    
    p_phone.addEventListener("blur", () => {
        const phonePattern = /^01[016789]-\d{3,4}-\d{4}$/;
        if (phonePattern.test(p_phone.value)) {
            p_phoneLabel.textContent = "올바른 전화번호 형식입니다.";
            p_phoneLabel.style.color = "green";
        } else {
            p_phoneLabel.textContent = "-를 포함해서 입력해주세요";
            p_phoneLabel.style.color = "red";
        }
    });

    // 보호자 연락처 유효성 검사식
    const p_subPhone = document.querySelector(".p_subPhone");
    const p_subPhoneLabel = document.getElementById("p_subPhoneLabel");

    p_subPhoneLabel.textContent = ".";
    p_subPhoneLabel.style.color = "white";

    p_subPhone.addEventListener("blur", () => {
        const subPhonePattern = /^01[016789]-\d{3,4}-\d{4}$/;
        if (subPhonePattern.test(p_subPhone.value)) {
            p_subPhoneLabel.textContent = "올바른 전화번호 형식입니다.";
            p_subPhoneLabel.style.color = "green";
        } else {
            p_subPhoneLabel.textContent = "-를 포함해서 입력해주세요";
            p_subPhoneLabel.style.color = "red";
        }
    });
});
	
	document.addEventListener("DOMContentLoaded", function() {
	    // 입원번호 유효성 검사식
	    const p_no = document.querySelector(".p_no");
	    const p_noLabel = document.getElementById("p_noLabel");

	    p_noLabel.textContent = ".";
	    p_noLabel.style.color = "white";

	    p_no.addEventListener("blur", () => {
	        if (isValidAdmissionNumber(p_no.value)) {
	            p_noLabel.textContent = "올바른 입원번호 형식입니다.";
	            p_noLabel.style.color = "green";
	        } else {
	            p_noLabel.textContent = "입원번호는 6자리 숫자여야 합니다.";
	            p_noLabel.style.color = "red";
	        }
	    });

	    function isValidAdmissionNumber(admissionNumber) {
	        // 입원번호는 6자리 숫자여야 한다고 가정
	        const pattern = /^\d{6}$/;
	        return pattern.test(admissionNumber);
	    }
	});

