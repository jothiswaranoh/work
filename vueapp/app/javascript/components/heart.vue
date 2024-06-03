<template>
  <div>
    <!-- Heart SVG icon with dynamic fill -->
    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" :fill="getHeartColor(0)">
      <path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/>
    </svg>
    <!-- Display the result -->
    <div class="heat-header" v-if="loveResult">
      <p>result: {{ loveResult.result }}</p>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    loveResult: {
      type: Object,
      required: true,
      validator: function(value) {
        return value && value.hasOwnProperty('result') && value.hasOwnProperty('result');
      }
    }
  },
  methods: {
    getHeartColor: function(result) {
      // Use the result to determine the color of the heart icon
      const hue = Math.round((result / 100) * 3.6); // Divide by 100 and multiply by 3.6 to distribute values evenly from 0 to 360
      return `hsl(${hue}, 100%, 50%)`;
    }
  }
};
</script>

<style scoped>
.heat-header {
  width: 100%;
  padding: 10px;
  text-align: center;
}
</style>
