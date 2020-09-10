<template>
  <div class="bg-information" id="app">
    <Navbar />
    <router-view></router-view>
    <Footer />
  </div>
</template>

<script>
import Navbar from './components/Navbar';
import Footer from './components/Footer';
export default {
  components:{
    Navbar,
    Footer
  }
}
</script>
<style scoped>
#app {
  background-color: black;
}
</style>
