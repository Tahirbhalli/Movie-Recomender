<template>
    <div class="text-white m-4">
      <h1 style="cursor: pointer;">{{star.name}}</h1>
      <b>Description</b> <div class="ml-3">{{star.description}}</div>

      
      <h2 class="font-weight-bold">Image of Actor</h2>
      <div class="d-flex justify-content-center">
          <img v-bind:src="star.picUrl" alt="actor image" />
      </div>
      
      </div>
</template>

<script>
import axios from 'axios'
export default {
    components:{
    },
  mounted(){
      const body={query: `query{
      star(id: ${this.$route.params.id}){
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