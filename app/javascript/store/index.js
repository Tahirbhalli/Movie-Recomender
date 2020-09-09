import Vue from 'vue'
import Vuex from 'vuex'
import VueApollo from "vue-apollo";
import {fetchMovieImages,fetchMoviesList,fetchStarList} from './queries/index'
import {setMovieImages,setMoviesList,setStarList,settokken,setstar} from './mutations/index'

Vue.use(VueApollo)
Vue.use(Vuex)

export const mutations = {
  setMoviesList,setMovieImages,setStarList,settokken,setstar

  };
  
  export const actions = {
    fetchMovieImages,fetchMoviesList,fetchStarList,
    CreateTokken({commit},tokken){
      commit('settokken',tokken)
    },
    getstar({commit},star){
      commit('setstar',star)
    }
  };
  
  export const state = {
    allmovies: [],
    allstars: [],
    movieimages: [],
    tokken: null,
    star: null
  };
  
  export const store =  new Vuex.Store({
    mutations,
    actions,
    state,
  });
  