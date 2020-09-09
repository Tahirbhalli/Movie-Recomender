import Vue from 'vue'
import Vuex from 'vuex'
import VueApollo from "vue-apollo";
import {fetchMovieImages,fetchMoviesList,fetchStarList,SignUp} from './queries/index'
import {setMovieImages,setMoviesList,setStarList,settokken} from './mutations/index'

Vue.use(VueApollo)
Vue.use(Vuex)

export const mutations = {
  setMoviesList,setMovieImages,setStarList,settokken,

  };
  
  export const actions = {
    fetchMovieImages,fetchMoviesList,fetchStarList,
    CreateTokken({commit},tokken){
      commit('settokken',tokken)
    }
  };
  
  export const state = {
    allmovies: [],
    allstars: [],
    movieimages: [],
    tokken: null
  };
  
  export const store =  new Vuex.Store({
    mutations,
    actions,
    state,
  });
  