<template>

 <div class="card mx-3">
         <router-link v-bind:to="`/movie/${id}`"><img v-bind:src="poster_image" class=" card-img-top pr-1 mt-1 pl-1" alt="Dara pics" /></router-link>
        <div class="card-body para">
         <p class="card-text">
           <b class="item-font"> {{ title }}</b> <br />
         <span >{{description}}</span> <br />
        Actors: <router-link v-for="actor in actors" :key="actor.id" v-bind:to="`/actor/${actor.id}`"><b style="cursor: pointer;"> {{actor.name}} </b></router-link>
        </p>                                
        <p class="card-text text-left">
          <b>Director:</b><b>{{director.name}}</b>
        </p>
     </div>
 </div>
</template>
<script>
export default {
    
    props:{
      id: String,
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
            id: String,
            name: String
        },
        actors: Array,
    }
    
}
</script>
