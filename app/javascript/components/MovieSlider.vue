<template>
    <section class="d-none d-md-block d-lg-block d-xl-block">
        <h1 class="m-4 font-weight-bold text-capitalize text-white">All Movies</h1>
            <div class="m-5 row">
                <div id="carouselExampleInterval2" class="carousel slide m-5" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <div class="card-group flex">
                                <Card v-for="index in 3" :key="parseInt(index)"
                                v-bind:id="(index*slide).toString()"
                                v-bind:actors="allmovies[index*slide].stars"
                                v-bind:title="allmovies[index*slide].name"
                                v-bind:poster_image="allmovies[index*slide].posterUrl"
                                v-bind:director="allmovies[index*slide].director"
                                v-bind:description="allmovies[index*slide].description"
                                />
                            </div>
                        </div>
                    </div>
                    <a v-on:click="clickLeft" class="carousel-control-prev" href="#carouselExampleInterval2" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon arrow-left"   aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a v-on:click="clickRight" class="carousel-control-next" href="#carouselExampleInterval2"  role="button" data-slide="next">
                        <span class="carousel-control-next-icon arrow-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
    </section>
</template>
<script>
import Card from '../containers/Card'
export default {
    props:{
        allmovies: Array,
    },
    components:{
        Card,
    },
    data(){
        return {
            slide: 1,      
        }
    },
    methods:{
        clickRight(e){
            e.preventDefault();
            this.slide === 46 ? this.slide : this.slide += 1;
        },
        clickLeft(e){
            e.preventDefault();
            this.slide === 1 ? this.slide : this.slide -= 1;
            
        }
    }
}
</script>
<style scoped>
.item-font {
  font-size: 1.2em;
}

.arrow-left {
  background-size: 50px;
  height: 50px;
  left: -50px;
  position: absolute;
}

.arrow-right {
  right: -50px;
  background-size: 50px;
  height: 50px;
  position: absolute;
}

.add-item-icon {
  display: inline-block;
  opacity: 1;
  margin-top: 3px;
  border: 1px solid #888;
}

.add-item-icon img {
  height: 22px;
  width: 26px;
}
</style>