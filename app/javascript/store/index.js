import Vue from 'vue'
import Vuex from 'vuex'
import VueApollo from "vue-apollo";
import {fetchMovieImages,fetchMoviesList} from './queries/index'
import {setMovieImages,setMoviesList} from './mutations/index'

Vue.use(VueApollo)
Vue.use(Vuex)

export const mutations = {
  setMoviesList,setMovieImages

  };
  
  export const actions = {
    fetchMovieImages,fetchMoviesList
  };
  
  export const state = {
    allmovies: [],
    allstars: [],
    movieimages: []
  };
  
  export const store =  new Vuex.Store({
    mutations,
    actions,
    state,
  });
  