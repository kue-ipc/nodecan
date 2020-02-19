require "application_system_test_case"

class OperatingSystemsTest < ApplicationSystemTestCase
  setup do
    @operating_system = operating_systems(:one)
  end

  test "visiting the index" do
    visit operating_systems_url
    assert_selector "h1", text: "Operating Systems"
  end

  test "creating a Operating system" do
    visit operating_systems_url
    click_on "New Operating System"

    fill_in "Description", with: @operating_system.description
    fill_in "End of life", with: @operating_system.end_of_life
    fill_in "Name", with: @operating_system.name
    fill_in "Order", with: @operating_system.order
    click_on "Create Operating system"

    assert_text "Operating system was successfully created"
    click_on "Back"
  end

  test "updating a Operating system" do
    visit operating_systems_url
    click_on "Edit", match: :first

    fill_in "Description", with: @operating_system.description
    fill_in "End of life", with: @operating_system.end_of_life
    fill_in "Name", with: @operating_system.name
    fill_in "Order", with: @operating_system.order
    click_on "Update Operating system"

    assert_text "Operating system was successfully updated"
    click_on "Back"
  end

  test "destroying a Operating system" do
    visit operating_systems_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Operating system was successfully destroyed"
  end
end
