<template>
    <table class="table text-capitalize text-white">
        <tr class="success">
            <td>Geners id</td>
            <td>Geners name</td>
       
        </tr>
        <tr class="bg-success" v-for="g in allgeners" :key="g.id">
            <td><router-link v-bind:to="`/generes/${g.id}`">{{g.id}}</router-link></td>
            <td><router-link v-bind:to="`/generes/${g.id}`">{{g.name}}</router-link></td>
        </tr>
    </table>
</template>
<script>
import axios from 'axios';
export default {
    beforeCreate(){
        const body={
            query: `query{
                allgeners {
                id
                name
                }
            }`
        }
        axios.post('/graphql',body).catch(err=>console.error(err)).then(res => {
            this.$store.dispatch('getallgeners',res.data.data.allgeners)
        })
    },
    computed:{
        allgeners(){
            return this.$store.state.allgeners
        },
        tok(){
            return this.$store.state.tokken
        }
    }
}
</script>