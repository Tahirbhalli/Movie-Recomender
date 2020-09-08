RSpec.describe 'geners queries', type: :request do
    describe '.resolve' do
      before do
        a = Genersofmovie.new(name: 'abc')
        a.save
      end

      it 'all movies list' do
          post '/graphql',params: {query: 'query{allgeners{id}}'}
          json = JSON.parse(response.body)
          data=json['data']['allgeners']
          expect(data.count).to eq(1) 
      end
    end
  end
  