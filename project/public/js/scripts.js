//Sign up form
document.getElementById('signup-btn').addEventListener('click', function() {document.querySelector('.bg-modal').style.display = 'flex';});

document.querySelector('#exit-btn').addEventListener('click', function() {document.querySelector('.bg-modal').style.display = 'none';});

//Forgot password form
document.getElementById('forgot-password').addEventListener('click', function() {document.querySelector('.forgot-password-container').style.display = 'flex';});

document.querySelector('#exit-btn-password').addEventListener('click', function() {document.querySelector('.forgot-password-container').style.display = 'none';});

document.querySelector('.resetPasswordButton').addEventListener('click', function(){
  var email = document.querySelector('.resetPasswordEmail').value,
  pattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;

  if(email == ""){
    alert("Field cannot be empty.")
  }
  else if(email.match(pattern)){
    alert("A password reset link was sent. Click the link in the email to create a new password.")
    return true;
  }
})
