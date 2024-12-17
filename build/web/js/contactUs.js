/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

alertify.set('notifier', 'position', 'top-center');
alertify.set('notifier', 'delay', 5);

const btn = document.getElementById('email_send');

document.getElementById('form')
        .addEventListener('submit', function (event) {
            event.preventDefault();

            btn.value = 'Sending...';

            const serviceID = 'service_sxv3dc4';
            const templateID = 'template_iucu9xp';

            emailjs.sendForm(serviceID, templateID, this)
                    .then(() => {
                        btn.value = 'Send Email';
                        this.reset();
                        alertify.success('Email sent successfully!');

                    }, (err) => {
                        btn.value = 'Send Email';
                        alert(JSON.stringify(err));
                        alertify.success('Failed to send email. Please try again.');
                    });
        });

