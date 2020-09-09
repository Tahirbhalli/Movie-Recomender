<template>
    <div>
        <MovieSlider />
        <CardSlider />
        
    </div>
</template>
<script>
import MovieSlider from './MovieSlider'
import CardSlider from '../containers/StarSlider'

export default {
    
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