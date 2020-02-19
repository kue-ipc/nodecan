require "application_system_test_case"

class HardwareTypesTest < ApplicationSystemTestCase
  setup do
    @hardware_type = hardware_types(:one)
  end

  test "visiting the index" do
    visit hardware_types_url
    assert_selector "h1", text: "Hardware Types"
  end

  test "creating a Hardware type" do
    visit hardware_types_url
    click_on "New Hardware Type"

    fill_in "Category", with: @hardware_type.category
    fill_in "Code", with: @hardware_type.code
    fill_in "Description", with: @hardware_type.description
    fill_in "Name", with: @hardware_type.name
    fill_in "Order", with: @hardware_type.order
    click_on "Create Hardware type"

    assert_text "Hardware type was successfully created"
    click_on "Back"
  end

  test "updating a Hardware type" do
    visit hardware_types_url
    click_on "Edit", match: :first

    fill_in "Category", with: @hardware_type.category
    fill_in "Code", with: @hardware_type.code
    fill_in "Description", with: @hardware_type.description
    fill_in "Name", with: @hardware_type.name
    fill_in "Order", with: @hardware_type.order
    click_on "Update Hardware type"

    assert_text "Hardware type was successfully updated"
    click_on "Back"
  end

  test "destroying a Hardware type" do
    visit hardware_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hardware type was successfully destroyed"
  end
end
