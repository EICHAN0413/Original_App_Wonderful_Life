import Vue from 'vue';
import MaterialComponent from '../components/material.vue';


document.addEventListener('DOMContentLoaded', () => {
   const material =  new Vue({
        el: '#material',
        components: { MaterialComponent },
        template: '<MaterialComponent/>',
    });

})

