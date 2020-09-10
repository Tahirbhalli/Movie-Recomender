<template>
    <div class="container">
        <b-button class="btn-primary container" v-on:click="clicked">{{shown}} </b-button>
    </div>
</template>
<script>
import axios from 'axios'
export default {
    beforeCreate(){
        const body={
            query: `query{
                  likedActors(tokken: "${this.$store.state.tokken}") {
                      id
            }}`
        }
        axios.post('/graphql',body).catch(err=>console.error(err)).then(res => {
            this.$store.dispatch('getlikedstars',res.data.data.likedActors)
        })

    },
    methods:{
        clicked(){
            if(this.shown === 'like') return this.like()
            else return this.dislike()
        },
        like(){
            const body ={query: `query{likeAActor(tokken: "${this.$store.state.tokken}",actorId: ${this.id})}`}
            axios.post('/graphql',body).catch(err=>console.error(err)).then(res => {
              if(res.data.data.likeAActor){
                 const body={
            query: `query{
                  likedActors(tokken: "${this.$store.state.tokken}") {
                      id
            }}`
        }
        axios.post('/graphql',body).catch(err=>console.error(err)).then(res => {
            this.$store.dispatch('getlikedstars',res.data.data.likedActors)
        })
              }  
            })

        },
        dislike(){
            const body ={query: `query{dislikeAStar(tokken: "${this.$store.state.tokken}",starId: ${this.id})}`}
            axios.post('/graphql',body).catch(err=>console.error(err)).then(res => {
              if(res.data.data.dislikeAStar){
                  const body={
            query: `query{
                  likedActors(tokken: "${this.$store.state.tokken}") {
                      id
            }}`
        }
        axios.post('/graphql',body).catch(err=>console.error(err)).then(res => {
            this.$store.dispatch('getlikedstars',res.data.data.likedActors)
        })
              }  
            })

        }
    },
    computed:{
    shown(){
        for (let index = 0; index < this.$store.state.likedstars.length; index++) {
            if(this.$store.state.likedstars[index].id === this.$props.id){
                console.log(this.$store.state.likedstars)
                return 'dislike'
            }
        }
        return 'like';
        }},
    props:{
         id: String
    },
}
</script>