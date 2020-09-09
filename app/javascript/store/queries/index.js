import gql from 'graphql-tag';
import graphqlClient from '../utils';
export async function fetchMovieImages({ commit },id) {
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
  }
export async function fetchMoviesList({ commit }) {
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
  export async function SignUp({commit},name,email,password){
    const response = await graphqlClient.mutate({
        mutation: gql`mutation {
          createUser(input: {
            email: ${email},
            password: ${password},
            name: ${name},
          })}{
            createUser
          }
        }`
      })
      commit('settokken',response.data.createUser)
    }