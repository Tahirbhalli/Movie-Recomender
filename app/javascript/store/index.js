import Vue from 'vue'
import Vuex from 'vuex'
import VueApollo from "vue-apollo";
import graphqlClient from './utils';
Vue.use(VueApollo)
import gql from 'graphql-tag';



Vue.use(Vuex)

export const mutations = {
  setmovie(state,movie){
    state.movie=movie;
  },
  setMoviesList(state, allmovies) {
    state.allmovies = allmovies;
  },

  };
  
  export const actions = {

    async fetchMovie({ commit },id) {
      const response = await graphqlClient.query({
          query: gql`query{
            movie(id: ${id}){
              id
              name
              movieImages{
                imageUrl
              }
            }
          }`
          
      })
      commit('setmovie',response.data.movie)
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
    movie: ''
  };
  
  export const store =  new Vuex.Store({
    mutations,
    actions,
    state,
  });
  

//   import Head from "next/head";
// import get from "lodash.get";
// import styled, { css } from "styled-components";
// import { gql } from "apollo-boost";
// import { useContext, useRef, useState } from "react";
// import { useQuery } from "@apollo/react-hooks";
// import { Transition } from "react-transition-group";
// import AppHeader from "./AppHeader";
// import AuthHelper from "./Development/AuthHelper";
// import Button from "./Button";
// import Container from "./Container";
// import Dashboard from "./Dashboard";
// import EditAccountant from "./EditAccountant";
// import Rejection from "./Rejection";
// import { resetScroll } from "../lib/helpers";
// import { usePrevious } from "../lib/hooks";
// import { UserContext } from "./App";
// export const SERVICE_REQUESTS = gql`
//   query ServiceRequests($id: ID!) {
//     accountant(id: $id) {
//       serviceRequests {
//         id
//       }
//     }
//   }
// `;
// export default function AccountantDashboard() {
//   const { id, status } = useContext(UserContext);
//   const { data } = useQuery(SERVICE_REQUESTS, { variables: { id } });
//   const serviceRequestsFetched = get(data, "accountant.serviceRequests", null);
//   const [stepOverride, setStepOverride] = useState(null);
//   let step, direction, hardReject, softReject, active;
//   switch (status) {
//     case "pending_interview":
//       step = 1;
//       break;
//     case "interview_scheduled":
//       step = 2;
//       break;
//     case "active":
//       active = true;
//       break;
//     case "hard_reject":
//       hardReject = true;
//       break;
//     default:
//       // "soft_reject", "inactive", "on_bench"
//       softReject = true;
//       break;
//   }
//   const subBarVariants = [
//     "",
//     "Congratulations! You’ve been selected to be interviewed. Please choose a time below to schedule your interview.",
//     "While you wait for your interview, feel free to complete your public profile.",
//   ];
//   const renderStep = stepOverride || step;
//   // prep animation direction
//   const prevStep = usePrevious(renderStep);
//   if (prevStep < renderStep) direction = "left";
//   else if (prevStep > renderStep) direction = "right";
//   else direction = "";
//   return (
//     <>
//       <Head>
//         <title>FINSYNC Services Portal | Dashboard</title>
//         <script
//           type="text/javascript"
//           src="https://static.hsappstatic.net/MeetingsEmbed/ex/MeetingsEmbedCode.js"
//         ></script>
//       </Head>
//       {/* conditional header versions */}
//       {renderStep && (
//         <AppHeader
//           steps={[
//             { label: "1. Complete Application", ref: useRef(null) },
//             { label: "2. Schedule Interview", ref: useRef(null) },
//             { label: "3. Interview and Evaluation", ref: useRef(null) },
//           ]}
//           activeStepIndex={renderStep}
//           subBarText={subBarVariants[renderStep]}
//         />
//       )}
//       {!renderStep && !active && <AppHeader skipSubBar={true} />}
//       {/* conditional body versions */}
//       {hardReject && <Rejection type="hard" />}
//       {softReject && <Rejection type="soft" />}
//       {renderStep && (
//         <>
//           <Transition in={renderStep === 1} timeout={250}>
//             {(state) => (
//               <Slide animateState={state} reverse={direction == "right"}>
//                 <div
//                   className="meetings-iframe-container"
//                   data-src="https://meetings.hubspot.com/eddiedavis/services-interview?embed=true"
//                 ></div>
//                 <ToProfile goToStep={setStepOverride} />
//               </Slide>
//             )}
//           </Transition>
//           <Transition in={renderStep === 2} timeout={250}>
//             {(state) => (
//               <Slide animateState={state} reverse={direction == "right"}>
//                 <EditAccountant />
//                 <ToInterview goToStep={setStepOverride} />
//               </Slide>
//             )}
//           </Transition>
//         </>
//       )}
//       {/* Full header and body handled within dashboard */}
//       {active && serviceRequestsFetched && (
//         <Dashboard
//           initialPage={
//             serviceRequestsFetched.length ? "workManagement" : "publicProfile"
//           }
//         />
//       )}
//       {/* Helper for QA/Dev to log out */}
//       {!active && <AuthHelper />}
//     </>
//   );
// }
// const ToInterview = ({ goToStep }) => (
//   <ToInterviewFooter>
//     <p>Did you forget to schedule your interview?</p>
//     <Button
//       dark
//       onClick={() => {
//         resetScroll();
//         goToStep(1);
//       }}
//     >
//       Schedule Interview
//     </Button>
//   </ToInterviewFooter>
// );
// const ToProfile = ({ goToStep }) => (
//   <ToProfileFooter>
//     <p>
//       To prepare for your scheduled interview, click below to complete your
//       profile.
//     </p>
//     <Button
//       green
//       onClick={() => {
//         resetScroll();
//         goToStep(2);
//       }}
//     >
//       Complete Profile
//     </Button>
//   </ToProfileFooter>
// );
// const ToInterviewFooter = styled(Container)`
//   max-width: 820px;
//   padding-bottom: 100px;
//   margin-top: 48px;
// `;
// const ToProfileFooter = styled.div`
//   margin: auto;
//   text-align: right;
//   padding-bottom: 100px;
//   p {
//     max-width: 220px;
//     margin-left: auto;
//   }
//   /* match modal width */
//   max-width: 400px;
//   padding-right: 20px;
//   @media (min-width: 412px) {
//     padding-right: 0;
//   }
//   @media (min-width: 632px) {
//     max-width: 850px;
//     padding-right: 20px;
//   }
//   @media (min-width: 862px) {
//     padding-right: 0;
//   }
// `;
// // slide animation
// const enteringStyles = css`
//   display: block;
// `;
// const enteredStyles = css`
//   display: block;
//   transform: translateX(0);
// `;
// const exitingStyles = css`
//   display: block;
//   transform: translateX(${(props) => !props.reverse && "-"}100vw);
// `;
// const exitedStyles = css`
//   display: none;
// `;
// const Slide = styled.div`
//   width: 100vw;
//   display: flex;
//   justify-content: center;
//   position: absolute;
//   transition: transform 500ms ease-in-out;
//   -webkit-transition: -webkit-transform 500ms ease-in-out;
//   transform: translateX(${(props) => props.reverse && "-"}100vw);
//   ${(props) => props.animateState == "entering" && enteringStyles}
//   ${(props) => props.animateState == "entered" && enteredStyles}
//   ${(props) => props.animateState == "exiting" && exitingStyles}
//   ${(props) => props.animateState == "exited" && exitedStyles}
// `;