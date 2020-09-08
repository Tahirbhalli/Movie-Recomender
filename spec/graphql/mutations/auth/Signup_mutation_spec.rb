module Mutations
  module Auth
    RSpec.describe 'SignUP', type: :request do
      before :each do
        User.create(name: 'dumy name', email: 'dummy@testing.com', password: '123456789')
      end
      it 'create a user' do
        post '/graphql', params: { query: query(name: 'tahir ahmad', email: 'thibhalli16@gmail.com', password: '1234567890') }
        expect(User.where(name: 'tahir ahmad').exists?).to eq(true)
      end
      def encode_tokken(payload = {})
        exp = 24.hours.from_now
        payload[:exp] = exp.to_i
        JWT.encode(payload, Rails.application.secrets.secret_key_base)
      end

      def decode_tokken(token)
        decoded = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
        HashWithIndifferentAccess.new decoded
      end

      def query(name:, email:, password:)
        <<~GQL
          mutation{
            createUser(input:{
              email: "#{email}",
              password: "#{password}",
              name: "#{name}"
            })
          }
        GQL
      end
    end
  end
end
