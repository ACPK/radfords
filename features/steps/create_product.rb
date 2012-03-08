class CreateProduct < Spinach::FeatureSteps
  include Forms::Product
  include Links
  include Paths
  include Sessions

  feature 'Create product'
  Then 'there is a "New Product" link' do
    should have_selector('a', text: 'New Product')
  end

  Then 'the "New Product" page is displayed' do
    should have_selector('title', text: 'New Product')
  end

  Then 'there is a "Back" link' do
    should have_selector('a', text: 'Back')
  end

  Then 'the "Products" page is displayed' do
    should have_selector('title', text: 'Products')
  end

  Then 'I am shown a product page' do
    should have_selector('title', text: 'Lorem Ipsum')
  end

  And 'a success flash is displayed' do
    should have_selector('.success', text: 'created a new product')
  end

  Then 'I stay on the new product page' do
    should have_selector('title', text: 'New Product')
  end

  Then 'a "Title can\'t be blank" message is displayed' do
    should have_selector('li', text: 'Title can\'t be blank')
  end

  Then 'a "Description can\'t be blank" message is displayed' do
    should have_selector('li', text: 'Description can\'t be blank')
  end

  Then 'an "Image URL can\'t be blank" message is displayed' do
    should have_selector('li', text: 'Image url can\'t be blank')
  end

  Then 'a "Price is not a number" message is displayed' do
    should have_selector('li', text: 'Price is not a number')
  end

  Then 'a "Price must be greater than or equal to 0.01" message is displayed' do
    should have_selector('li', text: 'Price must be greater than or equal to 0.01')
  end

  Then 'a "Title has already been taken" message is displayed' do
    should have_selector('li', text: 'Title has already been taken')
  end

  Then 'the error count is displayed' do
    should have_selector('h2', text: '4 errors')
  end

  Then 'I am redirected to the sign in page' do
    should have_selector('title', text: 'Sign In')
  end
end
