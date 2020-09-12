<template>
  <form v-on:submit="submitform">
    <div class="form-group">
      <label for="email">Email address:</label>
      <input type="email" v-model="formdata.email" required class="form-control" placeholder="Enter email" id="email">
    </div>
      <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" v-model="formdata.password" required class="form-control" placeholder="Enter password" id="pwd">
    </div>
    <button type="submit" class="btn btn-primary container">Login</button>
  </form>
</template>
<script>
import axios from 'axios'
export default {
    methods:{
        submitform(e){
          e.preventDefault();
          const body={query: `mutation{
              signinMutation(input:{
    email: "${this.formdata.email}",
    password: "${this.formdata.password}"
  })
            }`}
            axios.post('/graphql',body).catch(err => {
    console.error(err.data.data)
  })
  .then(res => {
    if(res.data.data.signinMutation){
    this.$store.dispatch('CreateTokken',res.data.data.signinMutation)}
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


  })   
        }
        },
    data(){
        return{
            formdata:{
                email: '',
                password: ''
            }
        }
    }
    
}
</script>