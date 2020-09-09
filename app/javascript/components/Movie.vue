<template>
    <div class="text-white m-4">
      <h1 style="cursor: pointer;">{{currentmovie.name}}</h1>
      <b>Description:</b> <div class="ml-3">{{currentmovie.description}}</div>
      <div class="d-flex mt-2">
          <div class="font-weight-bold mt-3">Geners:</div>
         <router-link v-for="gener in images.genersofmovies" :key="gener.id" v-bind:to="`/generes/${gener.id}`"> <div class="font-weight-bold p-3" >{{gener.name}}</div></router-link>
      </div>
      <div class="d-flex mt-2">
        <div>Director Name: </div>
        <router-link v-bind:to="`/director/${currentmovie.director.id}`">{{currentmovie.director.name}}</router-link>
      </div>
      <h2 class="font-weight-bold">Poster and Images</h2>
      <div class="container">
        <img v-bind:src="currentmovie.posterUrl" alt="image">
        <img v-for="image in images.movieImages" :key="image.imageUrl" v-bind:src="image.imageUrl" alt="oter movie image">
      </div>
    </div>
</template>
<script>
import { mapState } from 'vuex';
export default {
    beforeCreate() {
    this.$store.dispatch('fetchMovieImages',parseInt(this.$route.params.id));
  },
  computed: {
    images(){
        return this.$store.state.movieimages
    },
    currentmovie(){
        return this.$store.state.allmovies[parseInt(this.$route.params.id)]
    }
  }
}

</script>