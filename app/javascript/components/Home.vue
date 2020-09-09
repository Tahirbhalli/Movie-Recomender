<template>
    <div>
        <MovieSlider v-bind:allmovies="allmovies"/>
        <CardSlider />
        
    </div>
</template>
<script>
import MovieSlider from './MovieSlider'
import CardSlider from '../containers/StarSlider'
import { mapState } from 'vuex';
export default {
  computed: {
    ...mapState(['allmovies']),
  },
  beforeCreate() {
    this.$store.dispatch('fetchMoviesList');
    //this.$store.dispatch('fetchStarList');
  },
    components:{
       MovieSlider,
       CardSlider
    },    
}
</script>