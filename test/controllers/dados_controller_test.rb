require 'test_helper'

class DadosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dado = dados(:one)
  end

  test "should get index" do
    get dados_url, as: :json
    assert_response :success
  end

  test "should create dado" do
    assert_difference('Dado.count') do
      post dados_url, params: { dado: { temperatura: @dado.temperatura, umidade: @dado.umidade } }, as: :json
    end

    assert_response 201
  end

  test "should show dado" do
    get dado_url(@dado), as: :json
    assert_response :success
  end

  test "should update dado" do
    patch dado_url(@dado), params: { dado: { temperatura: @dado.temperatura, umidade: @dado.umidade } }, as: :json
    assert_response 200
  end

  test "should destroy dado" do
    assert_difference('Dado.count', -1) do
      delete dado_url(@dado), as: :json
    end

    assert_response 204
  end
end
