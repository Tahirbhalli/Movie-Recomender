<template>
    <div>
        <MovieSlider v-if="tok !== null" v-bind:allmovies="likedmovies" title="Recomended Movies"/>
        <MovieSlider v-bind:allmovies="allmovies"/>
        <CardSlider />
        <Generslist />

        
    </div>
</template>
<script>
import Generslist from './Generslist'
import MovieSlider from './MovieSlider'
import CardSlider from '../containers/StarSlider'
import { mapState } from 'vuex';
export default {
  computed: {
    ...mapState(['allmovies','likedmovies']),
  },
  beforeCreate() {
    this.$store.dispatch('fetchMoviesList');
  },
    components:{
       MovieSlider,
       Generslist,
       CardSlider
    },    
}
</script>