require "test_helper"

class ClientesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get clientes_new_url
    assert_response :success
  end

  test "should get create" do
    get clientes_create_url
    assert_response :success
  end
end
