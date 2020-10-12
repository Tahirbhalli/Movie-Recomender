<template>
  <form v-on:submit="submitform">
    {{tok}}
    <div class="form-group">
      <label for="name">Name:</label>
      <input type="text" required v-model="formdata.name" class="form-control" placeholder="Enter email" id="name">
    </div>
    <div class="form-group">
      <label for="email">Email address:</label>
      <input type="email" required v-model="formdata.email" class="form-control" placeholder="Enter email" id="email">
    </div>
    <div class="form-group">
      <label for="pwd1">Password:</label>
      <input type="password" minlength="8" v-model="formdata.password" required class="form-control" placeholder="Enter password" id="pwd1">
    </div>
    <div class="form-group">
      <label for="pwd2">Re-Enter Password:</label>
      <input type="password" minlength="8" required v-model="formdata.repassword" class="form-control" placeholder="Enter password" id="pwd2">
    </div>
    <div v-if="formdata.password !== formdata.repassword" class="alert alert-danger">
      <strong>Warning</strong> Password not Matched
    </div>
    <button v-if="formdata.password === formdata.repassword" type="submit" class="btn btn-primary container">Sign UP</button>
  </form>
</template>
<script>
import axios from 'axios'
export default {
    methods:{
        submitform(e){
        e.preventDefault()
        const body={query: `mutation{
              createUser(input:{
    email: "${this.formdata.email}",
    password: "${this.formdata.password}",
    name: "${this.formdata.name}"
  })
            }`}
            axios.post('/graphql',body).catch(err => {
    console.error(err.data.data)
  })
  .then(res => {
    if(res.data.data.createUser){
    this.$store.dispatch('CreateTokken',res.data.data.createUser)
    }
  })        
        }
        },
    computed:{
      tok(){
        return this.$store.state.tokken
      }
    },
    data(){
        return{
            formdata:{
                name: '',
                email: '',
                password: '',
                repassword: ''
            }
        }
    }
}
</script>