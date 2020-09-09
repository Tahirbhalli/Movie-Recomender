import Vue from 'vue'
import Vuex from 'vuex'
import VueApollo from "vue-apollo";
import graphqlClient from './utils';
Vue.use(VueApollo)
import gql from 'graphql-tag';



Vue.use(Vuex)

export const mutations = {
  setMovieImages(state,movieImages){
    state.movieimages=movieImages;
  },
  setMoviesList(state, allmovies) {
    state.allmovies = allmovies;
  },

  };
  
  export const actions = {
    async fetchMovieImages({ commit },id) {
      const response = await graphqlClient.query({
          query: gql`query{
            movie(id: ${id}) {
              id
              movieImages{
                imageUrl
              }
              genersofmovies{
                id
                name
              }
            }
          }`
          
      })
      commit('setMovieImages',response.data.movie)
    },
    async fetchMoviesList({ commit }) {
        const response = await graphqlClient.query({
            query: gql`query{
                allmovies {
                    id
                    name
                    description
                    posterUrl
                    director{
                      id
                      name
                    }
                    stars{
                      id
                      name
                    }
                  }
                }`,
        })
        commit('setMoviesList', response.data.allmovies);
    }
    // ...
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
  