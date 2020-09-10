<template>
    <div>
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
    ...mapState(['allmovies']),
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