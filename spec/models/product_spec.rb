# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  nome        :string
#  price       :float
#  status      :string
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validações' do
    it 'Nome é obrigatório' do
      product = FactoryBot.build(:product)
      product.nome = nil
      expect(product.valid?).to be_falsey
    end

    it 'Price é obrigatório' do
      product = FactoryBot.build(:product)
      product.price = nil
      expect(product.valid?).to be_falsey
    end

    it 'O preço do produto não pode ser menor que zero' do
      product = FactoryBot.build(:product)
      product.price = -1.5
      expect(product.valid?).to be_falsey
    end
  end

  describe 'Callbacks' do
    it 'Os produtos são sempre criados com status Pendente' do
      product = FactoryBot.build(:product)
      product.save
      expect(product.status).to eq('pendente')
    end
  end

  describe 'Methods' do
    it 'does something' do
      
    end
  end
end
