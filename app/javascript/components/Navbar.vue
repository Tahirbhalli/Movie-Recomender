<template>
  <b-container fluid class="navbar1">
    <b-row>
      <b-col lg="3" class="d-none d-lg-block mt-3">
        <router-link to="/"><h4 class="font-weight-bolder badge">Movizzz Recomendation</h4></router-link>
      </b-col>
      <b-col lg="7" class="col-md-9 text-center mt-3">
        <input type="search" v-model="search" placeholder="Search movie" class="form-control">
      </b-col>
      <b-col cols="2" class="mt-3 text-right">
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