<template>
    <div class="mx-auto col-6 m-4 text-white">
        <div v-if="reset">
            <div class="alert alert-success">
  <strong>Success!</strong> You Successfully updated your password
</div>
        </div>
            <form v-else v-on:submit="submitform">
    <div class="form-group">
      <label for="oldpassword">old password:</label>
      <input type="password" v-model="formdata.oldpassword" required class="form-control" minlength="8" placeholder="Enter password" id="email">
    </div>            
    <div class="form-group">
      <label for="password">New password:</label>
      <input type="password" v-model="formdata.password" required class="form-control" minlength="8" placeholder="Enter password" id="email">
    </div>
      <div class="form-group">
      <label for="pwd">Re-Password:</label>
      <input type="password" v-model="formdata.repassword" required class="form-control" minlength="8" placeholder="Re-Password" id="pwd">
    </div>
    <div v-if="togle" class="alert alert-danger">
      <strong>Warning</strong> Password not Matched
    </div>
    <button type="submit" class="btn btn-primary container">Reset</button>
  </form>

    </div>
</template>
<script>
import axios from 'axios';
import { mapState } from 'vuex';
export default {
    computed:{
        ...mapState['tokken'],
        token(){
      return this.$store.state.tokken
    }
    },
    methods:{
        submitform(e){
            const body={query: `mutation{
              resetPassword(input:{
                  tokken: "${this.$store.state.tokken}"
    oldpassword: "${this.formdata.oldpassword}",
    newpassword: "${this.formdata.repassword}",
  })
            }`}
        
            e.preventDefault();
            if(this.formdata.password !== this.formdata.repassword){
                this.togle = true;
                this.formdata.repassword=''
                this.formdata.password=''
            }else{
                
                this.togle = false
                axios.post('/graphql',body).catch(err=> console.error(err))
                .then(res => {
                    if (res.data.data.resetPassword === true)
                    {
                        this.reset = true
                    }

  })
            }
        }
    },
    data(){
        return{
            togle: false,
            reset: false,
            formdata:{
                password: '',
                repassword: '',
                oldpassword: '',

            }
        }
    }
    
}
</script>