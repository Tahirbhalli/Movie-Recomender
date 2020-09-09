<template>

 <div class="card mx-3">
         <router-link to="/movie/1"><img v-bind:src="poster_image" class=" card-img-top pr-1 mt-1 pl-1" alt="Dara pics" /></router-link>
        <div class="card-body para">
         <p class="card-text">
           <b class="item-font"> {{title}}</b> <br />
         <span >{{description}}</span> <br />
        <b> Actors: </b><span v-for="actor in actors" :key="actor">{{actor.name}}</span>
        </p>                                
        <p class="card-text text-right">
        <a class="red-color">genres[0]</a>
</p>
<p class="card-text text-right">
   <a class="red-color"><b>Director:</b>{{director.name}}</a>
</p>
      </div>
     </div>
     
</template>
<script>
export default {
    
    props:{
      id: Number,
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
