<template>
    <div class="text-white m-4">
      <h1 style="cursor: pointer;">{{star.name}}</h1>
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
import axios from 'axios'
import Card from '../containers/Card'

export default {
    components:{
        Card
    },
  mounted(){
      const body={query: `query{
      star(id: 1){
          id
          name
          description
          picUrl
          movies{
              id
              posterUrl
              name
              stars{
                  id
                  name
              }
            director{
              id
              name
          }

          }
      }
}`}
axios.post('/graphql',body).catch(err=>console.error(err)).then(res=>{
    this.star=res.data.data.star
})
  },
  data(){
      return{
          star: null
      }
  }
    
}
</script>