require 'rails_helper'

RSpec.describe DetailsController, type: :controller do
  let(:item) {FactoryBot.create(:item)}
  describe 'GET #index' do
    
    it 'リクエストが成功すると' do
      get :index
        expect(response.status).to eq 200
    end
    it 'indexのテンプレートで表示される内容' do
      get :index
      expect(response).to render_template :index
    end
  end

end
