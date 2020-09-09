import Vue from 'vue'
import Vuex from 'vuex'
import VueApollo from "vue-apollo";
import {fetchMovieImages,fetchMoviesList,fetchStarList} from './queries/index'
import {setMovieImages,setMoviesList,setStarList} from './mutations/index'

Vue.use(VueApollo)
Vue.use(Vuex)

export const mutations = {
  setMoviesList,setMovieImages,setStarList

  };
  
  export const actions = {
    fetchMovieImages,fetchMoviesList,fetchStarList
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
  