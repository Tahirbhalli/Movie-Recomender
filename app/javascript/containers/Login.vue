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
export default {
    methods:{
        submitform(e){
          e.preventDefault();
          console.log(this.formdata)
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