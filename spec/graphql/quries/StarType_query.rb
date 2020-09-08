RSpec.describe 'Star queries', type: :request do
  describe '.resolve' do
    before :each do
      Star.create(name: 'abc')
    end
    it 'get star with param' do
      post '/graphql', params: { query: 'query{star(id: 1){id}}' }
      json = JSON.parse(response.body)
      data = json['data']['star']['id']
      expect(data).to eq('1')
    end
    it 'all star list' do
      post '/graphql',params: {query: 'query{allstars{id}}'}
      json = JSON.parse(response.body)
      data = json['data']['allstars']
      expect(data.count).to eq(1)
    end
  end
end
