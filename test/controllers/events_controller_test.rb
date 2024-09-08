require "test_helper"

class EventsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/events.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Event.count, data.length
  end

  test "create" do
    assert_difference "Event.count", 1 do
      post "/events.json", params: {
        name: "Test Event",
        date: DateTime.now,
        description: "this is a description of an event"
      }
      assert_response 200
    end
  end
end
