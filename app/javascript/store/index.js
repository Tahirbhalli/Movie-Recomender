import Vue from 'vue'
import Vuex from 'vuex'
import VueApollo from "vue-apollo";
import {fetchMovieImages,fetchMoviesList} from './queries/index'
import {setMovieImages,setMoviesList,settokken,setstar} from './mutations/index'

Vue.use(VueApollo)
Vue.use(Vuex)

export const mutations = {
  setMoviesList,setMovieImages,settokken,setstar

  };
  
  export const actions = {
    fetchMovieImages,fetchMoviesList,
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
    star: null,
  };
  
  export const store =  new Vuex.Store({
    mutations,
    actions,
    state,
  });
  