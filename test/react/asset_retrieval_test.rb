require 'test_helper'

LOADED_CODE = <<eos
console.log('This file is being loaded elsewhere.');
eos

class AssetRetrievalTest < ActionDispatch::IntegrationTest
  test 'asset pipeline should load assets when Sprockets directives are used' do
    get '/assets/load_with_sprockets_directive.js'
    assert_response :success

    assert_equal LOADED_CODE.gsub(/\s/, ''), @response.body.gsub(/\s/, '')
  end

  test 'asset pipeline should load assets when require_asset is used' do
    get '/assets/load_with_require_asset.js'
    assert_response :success

    assert_equal LOADED_CODE.gsub(/\s/, ''), @response.body.gsub(/\s/, '')
  end
end
