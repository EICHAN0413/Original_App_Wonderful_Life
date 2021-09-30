<template>
  <div id ="material">
    <label for="material">材料</label>
    <input type="text" 
           name="material" 
           v-model="newMaterial" >
    
    <label for="amount">分量</label>
    <input type="text" 
           name="amount" 
           v-model= "newAmount">
    
    <button type = "button"
           v-on:click="setMaterial">追加</button>
           <li v-for="material in materials" v-bind:key="material.id">
                    ID {{material.id}} /
                    名前 {{material}} /
                    分量 {{amount}} /
                </li>
  </div>
  </template>

  <script>
      export default {
          data () {
              return {
                  materials: [] ,
                  newMaterial: null,
                  amounts: [] ,
                  newAmount: null,
              }
          },
          methods: {
              setMaterial: function () {
                  var material = this.newMaterial;
                  this.materials.push(material);
                  this.newMaterial = '';

                  var amount = this.newAmount;
                  this.amount.push(amount);
                  this.newAmount = '';
              },              
              delMaterial: function(material) {
                  this.materials.splice(this.materials.indexOf(material), 1);
                  
              },
      }
    }
  </script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>

   
