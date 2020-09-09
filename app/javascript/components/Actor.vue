<template>
    <div class="text-white m-4">
        hi I am goood
      <h1 style="cursor: pointer;">asdsad</h1>
      <b>Description</b> <div class="ml-3">{{star.description}}</div>

      
      <h2 class="font-weight-bold">Image of Actor</h2>
      <div class="d-flex justify-content-center">
          <img v-bind:src="star.picUrl" alt="actor image">
      </div>
      <div class="d-flex justify-content-center col-4">
         <Card v-for="movie in star.movies" :key="movie.id"
            v-bind:id="movie.id"
            v-bind:actors="movie.stars"
            v-bind:title="movie.name"
            v-bind:poster_image="movie.posterUrl"
            v-bind:director="movie.director"
            v-bind:description="movie.description" />
      </div>
    </div>
</template>

<script>
import { mapState } from 'vuex';
import Card from '../containers/Card'
export default {
    components:{
        Card
    },
    beforeCreate() {
    this.$store.dispatch('fetchStarList');
  },
  mounted(){
      console.log(this.$store.state.allstars)
  }
  ,
    data(){
        return{
            s: 'hi i am null'
        }
    },
    computed:{
        ...mapState['allstars'],
        star(){
            return this.$store.state.allstars[parseInt(this.$route.params.id)]
            
        }
    },
    
}
</script>