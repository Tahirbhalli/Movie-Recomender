<template>
    <div class="card mx-3">
         <router-link v-bind:to="`/actor/${star.id}`"><img v-bind:src="star.picUrl" class=" card-img-top pr-1 mt-1 pl-1" alt="Dara pics" /></router-link>
        <div class="card-body para">
         <p class="card-text">
           <b class="item-font"> {{star.name}}</b> <br />
         <span >{{star.description}}</span> <br />
        Movies: <router-link v-for="movie in star.movies" :key="movie.id" v-bind:to="`/movie/${parseInt(movie.id-1)}`"><b style="cursor: pointer;"> {{movie.name}} </b></router-link>
        </p>
     </div>
     <LikeDislikeActor v-bind:id="star.id" v-if="tok !== null"/>
 </div>
</template>
<script>
import LikeDislikeActor from './LikeDislikeActor'
export default {
  computed:{
    tok(){
      return this.$store.state.tokken
    },
  },
  methods:{
    
  },
  props:{
      star: Object,
     
  },
  components:{
    LikeDislikeActor
  }
  
}
</script>