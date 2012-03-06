module Forms
  module Product
    include Spinach::DSL

    def title(title)
      fill_in 'product_title', with: title
    end

    def description(description)
      fill_in 'product_description', with: description
    end

    def image_url(image_url)
      fill_in 'product_image_url', with: image_url
    end

    def price(price)
      fill_in 'product_price', with: price
    end

    def valid_product
      title('Lorem Ipsum')
      description('Wibbles are fun!')
      image_url('lorem.jpg')
      price(19.95)
    end

    def create_product
      click_button 'Create Product'
    end

    def update_product
      click_button 'Update Product'
    end

    When 'I create a valid product' do
      valid_product
      create_product
    end

    When 'I delete a product' do
      click_button 'Delete'
    end

    When 'I update the product with valid attributes' do
      title('Blackcurrant Jam')
      description('Bursting with blackcurrant flavour')
      image_url('blackcurrant.jpg')
      price(3.00)
      update_product
    end

    When 'I update the product with invalid attributes' do
      title('')
      description('')
      image_url('')
      price('')
      update_product
    end

    When 'I create an invalid product' do
      title('')
      description('')
      image_url('')
      price('')
      create_product
    end

    When 'I leave the title blank' do
      valid_product
      title('')
      create_product
    end

    When 'I leave the description blank' do
      valid_product
      description('')
      create_product
    end

    When 'I leave the image URL blank' do
      valid_product
      image_url('')
      create_product
    end

    When 'I enter a price that\'s not a number' do
      valid_product
      price('foo')
      create_product
    end

    When 'I enter a price that\'s less than 0.01' do
      valid_product
      price(0)
      create_product
    end

    When 'I update the product with a blank title' do
      valid_product
      title('')
      update_product
    end

    When 'I update the product with a blank description' do
      valid_product
      description('')
      update_product
    end

    When 'I update the product with a blank image url' do
      valid_product
      image_url('')
      update_product
    end

    When 'I update the product with a price that\'s not a number' do
      valid_product
      price('foo')
      update_product
    end

    When 'I update the product with a price that\'s less than 0.01' do
      valid_product
      price(0)
      update_product
    end

    When 'I create another product' do
      valid_product
      title('Apricot Preserve')
      create_product
    end

    When 'I update the product with a taken title' do
      valid_product
      update_product
    end

    When 'I click the "Delete" button' do
      click_button('Delete')
    end

    When 'I create an invalid product' do
      fill_in 'product_title', with: ''
      fill_in 'product_description', with: ''
      fill_in 'product_image_url', with: ''
      fill_in 'product_price', with: ''

      click_button 'Create Product'
    end
  end
end
