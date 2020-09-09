import Vue from 'vue'
import Vuex from 'vuex'
import VueApollo from "vue-apollo";
import graphqlClient from './utils';
Vue.use(VueApollo)
import gql from 'graphql-tag';



Vue.use(Vuex)

export const mutations = {
    setBook(state, book) {
        state.book = book;
      },
      setMoviesList(state, allmovies) {
        state.allmovies = allmovies;
      },
    // ...
  };
  
  export const actions = {
    async fetchMoviesList({ commit }) {
        const response = await graphqlClient.query({
            query: gql`query{
                allmovies {
                    id
                    name
                    description
                    posterUrl
                    director{
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
    movie: null,
    allmovies: [],
  };
  
  export const store =  new Vuex.Store({
    mutations,
    actions,
    state,
  });
  