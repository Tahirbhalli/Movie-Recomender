<template>
  <b-container fluid class="navbar1">
    <b-row>
      <b-col lg="9" class="d-none d-lg-block mt-3">
        <router-link to="/"><h4 class="font-weight-bolder badge">Movizzz </h4></router-link>
      </b-col>
      
      <b-col cols="3" class="mt-3 text-right">
        <Auth v-if="tok === null" />
        <LogedUser v-else />
      </b-col>
    </b-row>
    
  </b-container>
  
</template>

<script>
import Auth from './Auth'
import LogedUser from './LogedUser'
export default {
  name: 'Navbar',
  props:{
    searchs: String
  },
  components:{
    Auth,
    LogedUser
  },
  computed:{
    tok(){
      return this.$store.state.tokken
    }
  },
  data(){
    return{
      search: '',
    }
  }
}
</script>
<style scoped>
  .navbar1 {
    height: 60px;
    background-color: #17a2b8;
  }

  button {
    background-color: greenyellow;
  }

  .img-fluid {
    height: 44px !important;
  }

  @media screen and (max-width: 1230px) {
    .d-none {
      display: none !important;
    }
  }

</style>