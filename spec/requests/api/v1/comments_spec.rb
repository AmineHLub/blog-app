require 'swagger_helper'

RSpec.describe 'api/v1/comments', type: :request do
  path '/api/v1/posts/{post_id}/comments' do
    parameter name: 'post_id', in: :path, type: :string, description: 'the id for a specific post'

    get('list of comments on a single post') do
      tags 'Comments'
      response '200', 'name found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 text: { type: :string },
                 user_id: { type: :string },
                 post_id: { type: :string }
               }

        let(:post_id) do
          Post.create(title: 'test title', text: 'text test', user_id: 1, comments_counter: 0, likes_counter: 0).id
        end
        run_test!
      end

      response '404', 'post not found' do
        let(:post_id) { 'invalid post id' }
        run_test!
      end
    end

    post('create a comment for a post') do
      tags 'Comments'
      consumes 'application/json', 'application/xml'
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          text: { type: :string, example: 'This is a comment' }
        },
        required: ['text']
      }

      response '201', 'comment created' do
        let(:comment) { { text: 'This is a comment' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:comment) { { text: 'This is a comment' } }
        run_test!
      end
    end
  end
end
