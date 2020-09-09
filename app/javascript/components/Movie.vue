<template>
    <div>
        
    </div>
</template>
<script>
import { mapState } from 'vuex';
export default {
    beforeCreate() {
    this.$store.dispatch('fetchMovie',1);
  },
    computed: {
        ...mapState(['movie']),
        movies(){
            for (let index = 0; index < this.$store.state.allmovies.length; index++) {
                if (this.$store.state.allmovies[index].id.toString() === this.$route.params.id.toString()){
                    return this.$store.state.allmovies[index]
                }
                
            }
            
        }
  }
}
</script>