RSpec.describe 'User queries', type: :request do
  before :each do
    User.create(name: 'dumy name', email: 'dummy@testing.com', password: '123456789')
  end
  it 'get first users' do
    post '/graphql', params: { query: firstuser }
    json = JSON.parse(response.body)
    data = json['data']['user']['id']
    expect(data).to eq('1')
  end
  def firstuser()
    <<~GQL
      query{
          user{
              id
          }
        }
    GQL
  end
end
