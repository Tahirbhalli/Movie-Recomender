<template>
    <div class="container">
        <button class="btn btn-primary container" v-on:click="clicked">{{shown}}</button>
        
    </div>
</template>
<script>
import axios from 'axios'
export default {
    data(){
        return {togle: true}
    },
    computed:{
    shown(){
        for (let index = 0; index < this.$store.state.likedmovies.length; index++) {
            if(this.$store.state.likedmovies[index].id === this.$props.id){
                return 'dislike'
            }
        }
        return 'like';
        }},
    props:{
        id: String
    },
    methods:{
        clicked(){
            if(this.shown === 'like') return this.like()
            else return this.dislike()
        },
        dislike(){
 const body3={query: `query {
        dislikeAMovie(tokken:"${this.$store.state.tokken}",movieId:${parseInt(this.$props.id)})
      }`
  }
  axios.post('/graphql',body3).catch(err=>console.error(err)).then(res => {
    if(res.data.data.dislikeAMovie){
      const body1= {
  query: `query{
    likedmovies(tokken: "${this.$store.state.tokken}") {
    id
    name
    posterUrl
    description
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
      axios.post('/graphql',body1).catch(err=>console.error(err)).then(res => { 
            this.$store.dispatch('fetchLikeMovies',res.data.data.likedmovies)
      })

    }
  })

},
    like(){
      const body={query: `query {
        likeAMovie(tokken:"${this.$store.state.tokken}",movieId:${parseInt(this.$props.id)})
      }`}
      axios.post('/graphql',body).catch(err=>console.error(err)).then(res => {
        if(res.data.data.likeAMovie === true){
          const body1= {
  query: `query{
    likedmovies(tokken: "${this.$store.state.tokken}") {
    id
    name
    posterUrl
    description
  }

  }`

}
  axios.post('/graphql',body1).catch(err=>console.error(err)).then(res => { 
    this.$store.dispatch('fetchLikeMovies',res.data.data.likedmovies)
  })
}
      })
    }
    
    },
    
}

</script>