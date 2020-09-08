<template>
  <div class="container">
   <div class="card img-fluid" style="width: 500px; height: 200px;">
    <img class="card-img-top" v-bind:src="poster_image" alt="Card image" style="width: 100%; height: 400px;">
    <div class="card-img-overlay">
      <h4 class="card-title">{{title}}</h4>
      <p class="card-text">{{description}}</p>
      <!--router-link to=""></router-link-->
      <div class="d-flex">
          <span  v-for="g in genres" :key=g class="p-2 text-primary" style="cursor: pointer;">{{g}}</span>
      </div>
      <div class="d-flex">
          <span class="p-2 text-primary" style="cursor: pointer;">{{director.name}}</span>
      </div>
      <div class="d-flex">
          <span v-for="actor in actors" :key="actor.id" class="p-2 text-primary" style="cursor: pointer;">{{actor.name}}</span>
      </div>
    </div>
  </div>
</div>

</template>
<script>
export default {
    
    props:{
        title: {
          type:  String,
          required: true
        },
        poster_image: {
            type: String,
            default: require("../images/default.png")
        },
        description: String,
        genres: Array,
        director:{
            id: Number,
            name: String
        },
        actors: Array
    }
    
}
</script>