<template>
  <div id="app">
    <Navbar />
    <router-view></router-view>
  </div>
</template>

<script>
import Navbar from './components/Navbar'
export default {
  components:{
    Navbar,
  }
}
</script>
<style scoped>
#app {
  background-color: black;
}
</style>
