//Set new password
document.querySelector('.newPassword-btn').onclick = function(){

  var password = document.querySelector('.password'
  ).value,
  confirmPassword = document.querySelector('.confirmPassword').value;

  if(password == "" || confirmPassword == ""){
    alert("Fields cannot be empty.")
  }
  else if(password != confirmPassword){
    alert("Password didn't match. Try again.")
    return false;
  }
  else if(password == confirmPassword){
    alert("New password changed successfully.")
    return true;
  }
}