RSpec.describe 'movei queries', type: :request do
  describe '.resolve' do
    before do
      a = Director.new(name: 'abc')
      a.movies.create(name: 'abc') if a.save
    end

    it 'get movie with param' do
      post '/graphql', params: { query: 'query{movie(id: 1){id}}' }
      json = JSON.parse(response.body)
      data = json['data']['movie']['id']
      expect(data).to eq('1')
    end
    it 'all movies list' do
        post '/graphql',params: {query: 'query{allmovies{id}}'}
        json = JSON.parse(response.body)
        data=json['data']['allmovies']
        expect(data.count).to eq(1) 
    end
  end
end
