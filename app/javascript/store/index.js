import Vue from 'vue';
import Vuex from 'vuex';
import VueApollo from 'vue-apollo';
import { fetchMovieImages, fetchMoviesList } from './queries/index';
import {
  setMovieImages, setMoviesList, settokken, setstar, setlikedmovies,
} from './mutations/index';

Vue.use(VueApollo);
Vue.use(Vuex);

export const mutations = {
  setMoviesList,
  setMovieImages,
  settokken,
  setstar,
  setlikedmovies,
  setlogout(state, tokken = null) {
    state.tokken = tokken;
  },
  setlikedstars(state, stars) {
    state.likedstars = stars;
  },
  setgenlist(state, geners) {
    state.allgeners = geners;
  },
  setlikedgen(state, likedgen) {
    state.likedgen = likedgen;
  },
};

export const actions = {
  fetchMovieImages,
  fetchMoviesList,
  fetchLikeMovies({ commit }, movies) {
    commit('setlikedmovies', movies);
  },
  CreateTokken({ commit }, tokken) {
    commit('settokken', tokken);
  },
  getstar({ commit }, star) {
    commit('setstar', star);
  },
  logout({ commit }) {
    commit('setlogout', null);
  },
  getlikedstars({ commit }, stars) {
    commit('setlikedstars', stars);
  },
  getallgeners({ commit }, allgeners) {
    commit('setgenlist', allgeners);
  },
  getalllikedgen({ commit }, likedgen) {
    commit('setlikedgen', likedgen);
  },
};

export const state = {
  allmovies: [],
  allstars: [],
  movieimages: [],
  tokken: null,
  star: null,
  likedmovies: [],
  likedstars: [],
  allgeners: [],
  likedgen: [],
};

export const store = new Vuex.Store({
  mutations,
  actions,
  state,
});
