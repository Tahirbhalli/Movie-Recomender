<template>
    <div>
        <MovieSlider v-bind:allmovies="gmovies" title="Recomended Movie In Geners"/>
    </div>
</template>
<script>
import axios from 'axios'
import MovieSlider from './MovieSlider'
export default {
    components:{
        MovieSlider,
    },
    data(){
        return{
            gmovies: []
        }
    },
    beforeCreate(){
        const body={
            query: `query{
                getgenmovies(genersid: ${this.$route.params.id}){
    name
    id
    description
    posterUrl
    stars{
      name
      description
    }
    director{
      name
    }
  }
            }`
        }
        axios.post('/graphql',body).catch(err=>console.error(err)).then(res=>{
            this.$data.gmovies = res.data.data.getgenmovies
          })
    }
    
}
</script>