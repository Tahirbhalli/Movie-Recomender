<template>

 <div class="card mx-3">
         <router-link v-bind:to="`/movie/${id}`"><img v-bind:src="poster_image" class=" card-img-top pr-1 mt-1 pl-1" alt="Dara pics" /></router-link>
        <div class="card-body para">
         <p class="card-text">
           <b class="item-font"> {{ title }}</b> <br />
         <span >{{description}}</span> <br />
        Actors: <router-link v-for="actor in actors" :key="actor.id" v-bind:to="`/actor/${actor.id}`"><b style="cursor: pointer;"> {{actor.name}} </b></router-link>
        </p>                                
        <p class="card-text text-left">
          <b>Director:</b><b>{{director.name}}</b>
        </p>
      
     </div>
     <div class="container" v-if="tok !== null">
      <button v-if="istoggle" v-on:click="like" type="button" class="container btn btn-primary">Like</button>
      <button v-else v-on:click="dislike" type="button" class="btn btn-primary container">Dislike</button>
      </div>
 </div>
</template>
<script>
import axios from 'axios'
export default {
  mounted(){
    console.log(this.$store.state.likedmovies)
  },
  methods:{
    show(){
      if (this.$store.state.tokken === null) tok = 0
      else{
        this.$store.state.likedmovies.filter(movie=>{
        if(movie.id.toString() === this.$props.id)
        {
         console.log(this.$store.state.likedmovies)
          tok = 1
        }
      })
    }
    },
    dislike(){
      
      this.istoggle = !this.istoggle;
const body2= {
  query: `query{
    likedmovies(tokken: "${this.$store.state.tokken}") {
    id
    name
    posterUrl
    description
  }

  }`

}

    },
    like(){
      this.istoggle = !this.istoggle;
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
      const body={query: `query {
        likeAMovie(tokken:"${this.$store.state.tokken}",movieId:${parseInt(this.$props.id)})
      }`}
      axios.post('/graphql',body).catch(err=>console.error(err)).then(res => {
        console.log(res.data.data)
        if(res.data.data.likeAMovie === true){
          axios.post('/graphql',body1).catch(err=>console.error(err)).then(res => { 
            this.$store.dispatch('fetchLikeMovies',res.data.data.likedmovies)
            console.log('ye')
            
           // this.$store.state.likedmovies.push({id: this.$props.id})
            })
        }
      })
    }
    
  },
  data(){
    return{
    istoggle: true
    }
  }, 
  computed:{
    tok(){
      return this.$store.state.tokken
    }
  },
    props:{
      id: String,
        title: {
          type:  String,
          required: true
        },
        poster_image: {
            type: String,
            // eslint-disable-next-line no-undef
            default: require("../images/default.png")
        },
        description: String,
        genres: Array,
        director:{
            id: String,
            name: String
        },
        actors: Array,
    }
    
}
</script>
