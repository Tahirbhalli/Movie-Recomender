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
    <button type="submit" class="btn btn-primary container">Submit</button>
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
    this.$store.dispatch('CreateTokken',res.data.data.signinMutation)
    console.log(res.data.data.signinMutation)
  })
            console.log(this.$store.state.tokken);         
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