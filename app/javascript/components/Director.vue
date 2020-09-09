<template>
    <div class="text-white m-4">
      <h1 style="cursor: pointer;">{{star.name}}</h1>
      <b>Description</b> <div class="ml-3">{{star.description}}</div>

      
      <h2 class="font-weight-bold">Image of Actor</h2>
      <div class="d-flex justify-content-center">
          <img v-bind:src="star.picUrl" alt="actor image" />
      </div>
      
      </div>
</template>
<script>
export default {
    
}
</script>