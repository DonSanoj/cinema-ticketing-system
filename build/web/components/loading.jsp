<%-- 
    Document   : loading
    Created on : Nov 13, 2024, 12:21:30 PM
    Author     : shayanhennedige
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ABC Cinema Loading Animation</title>
<script src="https://cdn.tailwindcss.com"></script>
<style>
  /* Keyframes for wave effect on logo */
  @keyframes wave {
    0%, 100% {
      transform: translateY(0);
    }
    50% {
      transform: translateY(-10px);
    }
  }

  /* Keyframes for fading effect on loading text */
  @keyframes fade {
    0% {
      opacity: 0.5;
    }
    100% {
      opacity: 1;
    }
  }

  /* Keyframes for loading bar animation */
  @keyframes load {
    0% {
      width: 0;
    }
    50% {
      width: 100%;
    }
    100% {
      width: 0;
    }
  }

  /* Applying animations */
  .wave {
    animation: wave 3s infinite ease-in-out;
  }

  .fade {
    animation: fade 1.5s infinite alternate;
  }

  .loading-bar {
    animation: load 2s infinite;
  }
</style>
</head>
<body class="bg-[#000025] flex items-center justify-center h-screen overflow-hidden">

<div class="logo-container flex flex-col items-center text-white">
  <img src="2-removebg-preview.png" alt="ABC Cinema Logo" class="logo w-36 wave">
  <div class="loading-text mt-2 text-lg tracking-widest fade">Loading...</div>
  <div class="loading-bar-container w-36 h-0.5 bg-white/20 mt-3 rounded overflow-hidden">
    <div class="loading-bar h-full bg-white"></div>
  </div>
</div>

<script>
  // JavaScript placeholder if further interactivity is needed
  setTimeout(() => {
    console.log("Loaded!");
    // Additional actions, like redirect, can be added here
  }, 3000);
</script>

</body>
</html>
