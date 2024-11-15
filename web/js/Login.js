/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

document.querySelectorAll('.toggle-password').forEach(toggle => {
    toggle.addEventListener('click', function() {
        const passwordInput = this.previousElementSibling;
        passwordInput.type = passwordInput.type === 'password' ? 'text' : 'password';
        this.textContent = passwordInput.type === 'password' ? 'Hide' : 'Show';
    });
});

