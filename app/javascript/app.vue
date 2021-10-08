<template>

  <div id="app">
    <label for="material">材料</label>
    <input type="text" 
           name="material" 
           v-model="newMaterial" >
    
    <label for="amount">分量</label>
    <input type="text" 
           name="amount" 
           v-model= "newAmount">
    
    
      <button type = "button" v-on:click="setdata">追加</button>
           <ul>
             <li v-for="material in materials" v-bind:key="material.id">
                    手順 {{material}} 
           </li>
           <li v-for="amount in amounts" v-bind:key="amount.id">
                    分量 {{amount}}
           </li>
             </ul>
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
              setdata: function () {
                  var material = this.newMaterial;
                  this.materials.push(material);
                  this.newMaterial = '';

                  var amount = this.newAmount;
                  this.amounts.push(amount);
                  this.newAmount = '';
              },              
              delMaterial: function(material, amount) {
                  this.materials.splice(this.materials.indexOf(material), 1);
                  this.amounts.splice(this.amounts.indexOf(amount), 1);
              },

      }
}
</script>

<style scoped>
p {
  font-size: 6em;
  text-align: center;
  
}
</style>
