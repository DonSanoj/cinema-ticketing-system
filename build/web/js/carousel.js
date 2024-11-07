/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

// carousel.js
document.addEventListener('DOMContentLoaded', () => {
    const slider = document.getElementById('slider');
    const nextBtn = document.getElementById('nextBtn');
    const prevBtn = document.getElementById('prevBtn');
    let currentSlide = 0;

    // Adjust as per your slide logic
    const slideWidth = slider.children[0].offsetWidth;

    nextBtn.addEventListener('click', () => {
        currentSlide = (currentSlide + 1) % slider.children.length;
        slider.style.transform = `translateX(-${currentSlide * slideWidth}px)`;
    });

    prevBtn.addEventListener('click', () => {
        currentSlide = (currentSlide - 1 + slider.children.length) % slider.children.length;
        slider.style.transform = `translateX(-${currentSlide * slideWidth}px)`;
    });
});
