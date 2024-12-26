<template>
    <div class="bg-black flex items-center justify-center h-screen">
      <div class="text-center">
        <h1 class="typed-text text-4xl font-bold text-green-600"></h1>
        <p class="text-lg mt-4 text-white">Todo está configurado correctamente.</p>
      </div>
    </div>
  </template>
  
  <script>
  import Typewriter from 'typewriter-effect/dist/core';
  
  export default {
    name: 'Welcome',
  
    mounted() {
      this.initTypewriter();
    },
  
    methods: {
      initTypewriter() {
        const element = document.querySelector('.typed-text');
  
        if (element) {
          const typewriter = new Typewriter(element, {
            loop: false,
            delay: 75,
          });
  
          typewriter
            .typeString("Hola, soy tu nombre")
            .pauseFor(2000)
            .deleteAll()
            .typeString("Bienvenido a mi portfolio")
            .start();
        }
      },
    },
  };
  </script>
  
  <style scoped>
    ::v-deep .Typewriter__cursor {
        color: gray;
    }
  </style>
  