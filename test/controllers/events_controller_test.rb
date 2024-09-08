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

  test "show" do
    get "/events/#{Event.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "date", "description"], data.keys
  end

  test "update" do
    event = Event.first
    patch "/events/#{event.id}.json", params: {
      name: "updated name"
    }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "updated name", data["name"]

  end
end
