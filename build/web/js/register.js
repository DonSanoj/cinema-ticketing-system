/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

const form = document.querySelector('form');
const password = document.getElementById('password');
const confirmPassword = document.getElementById('confirm-password');
const submitButton = form.querySelector('button');

function checkPasswordMatch() {
    if (password.value === confirmPassword.value) {
        submitButton.disabled = false;
    } else {
        submitButton.disabled = true;
    }
}

password.addEventListener('input', checkPasswordMatch);
confirmPassword.addEventListener('input', checkPasswordMatch);

