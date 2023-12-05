/* loginform */
function pw_click(){
	var passwordField = document.getElementById("passwd");
	var eyeIcon = document.getElementById("eyeIcon");

	if (passwordField.type === "password") {
		passwordField.type = "text";
		eyeIcon.src = "../resources/images/eye.png";
	} else {
		passwordField.type = "password";
		eyeIcon.src = "../resources/images/eye.png";
	}
}