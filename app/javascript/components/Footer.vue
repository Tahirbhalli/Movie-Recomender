<template>
   <div class="d-flex justify-content-center border-top">
    <form v-on:submit="formsubmit" class="col-6 float-right text-white mt-5">
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" v-model="formdata.name" class="form-control" placeholder="Enter password" id="name">
        </div>
        <div class="form-group">
            <label for="email">Email address:</label>
            <input type="email" v-model="formdata.email" class="form-control" placeholder="Enter email" id="email">
        </div>
        <div class="form-group">
            <label for="email">Comment:</label>
            <textarea v-model="formdata.comment" class="form-control" rows="5" id="comment"></textarea>
        </div>
  
        <button type="submit" class="btn btn-primary container">Leave Message</button>
    </form>
    </div>
</template>
<script>
export default {
    methods:{
        formsubmit(e){
            e.preventDefault();
            this.formdata.name = null
            this.formdata.email = null
            this.formdata.comment = null
        }
    },
    data(){
        return {
            formdata:{
                name: null,
                email: null,
                comment: null,
            }
        }
    }
}
</script>