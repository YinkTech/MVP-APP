require 'application_system_test_case'

class ExternalsTest < ApplicationSystemTestCase
  setup do
    @external = externals(:one)
  end

  test 'visiting the index' do
    visit externals_url
    assert_selector 'h1', text: 'Externals'
  end

  test 'should create external' do
    visit externals_url
    click_on 'New external'

    fill_in 'Amount', with: @external.amount
    fill_in 'Company name', with: @external.company_name
    fill_in 'Product name', with: @external.product_name
    fill_in 'Quantity', with: @external.quantity
    click_on 'Create External'

    assert_text 'External was successfully created'
    click_on 'Back'
  end

  test 'should update External' do
    visit external_url(@external)
    click_on 'Edit this external', match: :first

    fill_in 'Amount', with: @external.amount
    fill_in 'Company name', with: @external.company_name
    fill_in 'Product name', with: @external.product_name
    fill_in 'Quantity', with: @external.quantity
    click_on 'Update External'

    assert_text 'External was successfully updated'
    click_on 'Back'
  end

  test 'should destroy External' do
    visit external_url(@external)
    click_on 'Destroy this external', match: :first

    assert_text 'External was successfully destroyed'
  end
end
