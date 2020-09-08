<template>
    <div>
        
        <Card
        title="cast away"
        description="A cowboy doll is profoundly threatened and jealous when a new spaceman figure supplants him as top toy in a boy's room."
        v-bind:genres="['tahir','ahmad']"
        v-bind:director="{id: 1,name: 'umair butt'}"
        v-bind:actors="[{id: 1,name: 'di caprio'},{id: 1,name: 'di caprio'}]"
        v-bind:poster_image="'https://m.media-amazon.com/images/M/MV5BMDU2ZWJlMjktMTRhMy00ZTA5LWEzNDgtYmNmZTEwZTViZWJkXkEyXkFqcGdeQXVyNDQ2OTk4MzI@._V1_UX182_CR0,0,182,268_AL_.jpg'"

        />
        <Card v-for="movie in movielist" :key="movie.name"
        v-bind:title="movie.name"
        description="A cowboy doll is profoundly threatened and jealous when a new spaceman figure supplants him as top toy in a boy's room."
        v-bind:genres="['tahir','ahmad']"
        v-bind:director="{id: 1,name: 'umair butt'}"
        v-bind:actors="[{id: 1,name: 'di caprio'},{id: 1,name: 'di caprio'}]"
        v-bind:poster_image="'https://m.media-amazon.com/images/M/MV5BMDU2ZWJlMjktMTRhMy00ZTA5LWEzNDgtYmNmZTEwZTViZWJkXkEyXkFqcGdeQXVyNDQ2OTk4MzI@._V1_UX182_CR0,0,182,268_AL_.jpg'"

        />
    </div>
</template>
<script>
import Card from '../containers/Card'
export default {
    components:{
        Card,
    },
    data(){
        return{
        movielist: [
            { title: 'abc',description: 'cbcbaksj',poster_image: 'https://m.media-amazon.com/images/M/MV5BMDU2ZWJlMjktMTRhMy00ZTA5LWEzNDgtYmNmZTEwZTViZWJkXkEyXkFqcGdeQXVyNDQ2OTk4MzI@._V1_UX182_CR0,0,182,268_AL_.jpg',genres: ['action','funny'],director: {id: 1,name: 'di caprio'}},
            { title: 'abc',description: 'cbcbaksj',poster_image: 'https://m.media-amazon.com/images/M/MV5BMDU2ZWJlMjktMTRhMy00ZTA5LWEzNDgtYmNmZTEwZTViZWJkXkEyXkFqcGdeQXVyNDQ2OTk4MzI@._V1_UX182_CR0,0,182,268_AL_.jpg',genres: ['action','funny'],director: {id: 1,name: 'di caprio'}},
        ]
        }
    }
    
}
</script>