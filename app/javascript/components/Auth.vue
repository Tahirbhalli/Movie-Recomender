<template>
<div>
  <b-button v-b-modal.modal-1>Sign Up</b-button>

  <b-modal id="modal-1" title="Join Movizzz">
    <Signup v-if="this.togle"/>
    <Login v-else />
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
        
    },
    data(){
        return{
            togle: true,
            title: 'Sign Up',
        }
    }
}
</script>