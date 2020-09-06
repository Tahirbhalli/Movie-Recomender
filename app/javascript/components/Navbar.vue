<template>
  <b-container fluid class="navbar1">
    <b-row>
      <b-col lg="3" class="d-none d-lg-block mt-3">
        <h4 class="font-weight-bold">Moveies Recomendation</h4>
      </b-col>
      <b-col lg="7" class="col-md-9 text-center mt-3">
        <input type="search" class="form-control">
      </b-col>
      <b-col cols="2" class="mt-3 text-right">
        <button class="btn">Login</button>
      </b-col>
    </b-row>
  </b-container>
</template>

<script>
export default {
  name: 'Navbar',
}
</script>
<style scoped>
  .navbar1 {
    height: 60px;
    background-color: #17a2b8;
  }

  .img-fluid {
    height: 44px !important;
  }
</style>