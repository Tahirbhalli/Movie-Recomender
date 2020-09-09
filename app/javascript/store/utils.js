import { ApolloClient } from 'apollo-client';
import { HttpLink } from 'apollo-link-http';
import { InMemoryCache } from 'apollo-cache-inmemory';
const token = document.querySelector('[name=csrf-token]').content

export default  new ApolloClient({
  // Provide the URL to the API server.
  link: new HttpLink({ uri: '/graphql' }),
  headers: {'X-CSRF-Token': document.querySelector('meta[name=csrf-token]').getAttribute('content')},
  cache: new InMemoryCache(),
});