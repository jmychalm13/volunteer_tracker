require "test_helper"

class VolunteerHoursControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/volunteer_hours.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal VolunteerHour.count, data.length
  end

  test "create" do
    assert_difference "VolunteerHour.count", 1 do
      post "/volunteer_hours.json", params: {
        user_id: User.first.id,
        event_id: Event.first.id,
        hours: 5,
        date: DateTime.now
      }
      assert_response 200
    end
  end

  test "show" do
    get "/volunteer_hours/#{VolunteerHour.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "user_id", "event_id", "hours", "date"], data.keys
  end
end
