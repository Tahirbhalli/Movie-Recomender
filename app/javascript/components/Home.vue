<template>
    <div>
        <MovieSlider />

        
    </div>
</template>
<script>
import MovieSlider from './MovieSlider'


export default {
    
  beforeCreate() {
    this.$store.dispatch('fetchMoviesList');
  },
    components:{
       MovieSlider,
    },
    data(){
        return{
        movielist: [
            { title: 'abc',description: 'cbcbaksj',poster_image: 'https://m.media-amazon.com/images/M/MV5BMDU2ZWJlMjktMTRhMy00ZTA5LWEzNDgtYmNmZTEwZTViZWJkXkEyXkFqcGdeQXVyNDQ2OTk4MzI@._V1_UX182_CR0,0,182,268_AL_.jpg',genres: ['action','funny'],director: {id: 1,name: 'di caprio'}},
            { title: 'abc',description: 'cbcbaksj',poster_image: 'https://m.media-amazon.com/images/M/MV5BMDU2ZWJlMjktMTRhMy00ZTA5LWEzNDgtYmNmZTEwZTViZWJkXkEyXkFqcGdeQXVyNDQ2OTk4MzI@._V1_UX182_CR0,0,182,268_AL_.jpg',genres: ['action','funny'],director: {id: 1,name: 'di caprio'}},
        ]
        }
    }
    
}
</script>