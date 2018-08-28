require 'rails_helper'

RSpec.describe Product, type: :model do


	describe 'Validations' do
		context 'presence' do
			it 'should valid when product have a name' do
				# product = Product.new(name: 'Product 1')
				product = build(:product)
				expect(product).to be_valid
			end

			it 'should invalid when products name is empty' do
				# product = Product.new(name: '')
				product = build(:product, name: nil)
				expect(product).not_to be_valid
			end

			it 'should valid when product have a price' do
				product = build(:product)
				expect(product).to be_valid
			end

			it 'should invalid when products price is empty' do
				product = build(:product, price: nil)
				expect(product).not_to be_valid
			end

			it 'should valid when product have a status' do
				product = build(:product)
				expect(product).to be_valid
			end

			it 'should invalid when products status is empty' do
				product = build(:product, status: '')
				expect(product).not_to be_valid
			end
		end

		it 'should create a product with valid attributes' do
			product = build(:product)
			expect{
				product.name = 'Product 1'
			}.to change(Product, :count)
		end

		it 'should be valid when price is grather than 0' do
			product = build(:product, price: 10.0)
			expect(product).to be_valid
		end

		it 'should be invalid when price is less than 0' do
			product = build(:product, price: -10.0)
			expect(product).not_to be_valid
		end

		it 'should be valid when product belongs to a category' do
			product = build(:product)
			expect(product).to be_valid
		end

		it 'should be invalid when category relation is nil' do
			product = build(:product, category: nil)
			expect(product).not_to be_valid
		end

		it 'should not be editable when is approved' do
			product = create(:product)
			product.update_column(:status, 'Approved')

			product.name = 'Product EDITED'
			expect(product).not_to be_valid
		end

		it 'should be editable by the creator' do
		end

		it 'should not be editable by other users' do
		end

	end



end
