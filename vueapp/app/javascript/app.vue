<template>
  <div id="app">
    <h1>Love Calculator App</h1>
    <!-- Listen for the 'love-calculated' event and pass the result to the Heart component -->
    <LoveCalculator @love-calculated="setLoveResult" />
    <!-- Pass the result to the Heart component -->
    <Heart :result="loveResult" />
  </div>
</template>

<script>
import LoveCalculator from './components/love.vue';
import Heart from './components/heart.vue';

export default {
  name: 'App',
  components: {
    LoveCalculator,
    Heart
  },
  data() {
    return {
      loveResult: null
    };
  },
  methods: {
    // Set the loveResult when the 'love-calculated' event is emitted
    setLoveResult(result) {
      this.loveResult = result;
    }
  }
};
</script>

<style>
/* Add your CSS styles here */
</style>
