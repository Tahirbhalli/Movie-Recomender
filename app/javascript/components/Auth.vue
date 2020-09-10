<template>
<div>
  <b-button v-b-modal.modal-1>Sign Up</b-button>

  <b-modal id="modal-1" title="Join Movizzz" hide-footer>
    <Signup v-if="this.togle"/>
    <Login v-else />
    <span v-on:click="changelink">{{this.link_title}}</span>
  </b-modal>
</div>
</template>
<script>
import Login from '../containers/Login'
import Signup from '../containers/Signup'
export default {
    components:{
        Login,
        Signup
    },
    methods:{
        changelink(){
            this.togle = !this.togle;
            this.togle ? this.link_title='Sign In' : this.link_title='Sign Up'
        }
    },
    data(){
        return{
            togle: true,
            link_title: 'Sign In',
        }
    }
}
</script>
<style scoped>
  span {
    cursor: pointer;
    color: blue;
    font-weight: bolder;
  }
</style>