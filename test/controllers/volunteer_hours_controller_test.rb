require "test_helper"

class VolunteerHoursControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/volunteer_hours.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal VolunteerHour.count, data.length
  end
end
