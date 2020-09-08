<template>
  <form v-on:submit="submitform">
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
    <button type="submit" class="btn btn-primary container">Submit</button>
  </form>
</template>
<script>
export default {
    methods:{
        submitform(e){
            e.preventDefault();
            console.log(this.formdata);
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