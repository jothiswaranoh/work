<template>
  <div>
    <h1>Love Calculator</h1>
    <form @submit.prevent="calculateLove">
      <label for="fname">First Name:</label>
      <input type="text" v-model="fname" id="fname" required>
      <label for="sname">Second Name:</label>
      <input type="text" v-model="sname" id="sname" required>
      <button type="submit">Calculate</button>
    </form>
    <div v-if="result">
      <p>Percentage: {{ result.percentage }}</p>
      <p>Result: {{ result.result }}</p>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      fname: '',
      sname: '',
      result: null
    };
  },
  methods: {
    async calculateLove() {
      try {
        const response = await axios.get('https://love-calculator.p.rapidapi.com/getPercentage', {
          params: {
            fname: this.fname,
            sname: this.sname
          },
          headers: {
            'X-RapidAPI-Key': '41c6e6cc1fmsh26d1ecce7576a00p1e127ejsncc8337e2d319',
            'X-RapidAPI-Host': 'love-calculator.p.rapidapi.com'
          }
        });
        this.result = response.data;
        // Emit an event containing the result
        this.$emit('love-calculated', this.result);
      } catch (error) {
        console.error(error);
      }
    }
  }
};
</script>

<style>
</style>
