<template>
   <div>
  <b-dropdown id="dropdown-offset" offset="25" text="Offset Dropdown"  style="top: -9px;" class="m-2">
    <b-dropdown-item href="#">email</b-dropdown-item>
    <b-dropdown-item href="/#/resetpassword">Reset Password</b-dropdown-item>
    <b-dropdown-item href="#" v-on:click="logout">Logout</b-dropdown-item>
  </b-dropdown>
</div>
</template>
<script>
export default {
    beforeCreate(){
    },
    methods:{
      logout(){
        this.$store.dispatch('logout')
      }
    },
}
</script>