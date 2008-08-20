require File.dirname(__FILE__) + '/../test_helper'
require 'baskets_controller'

# Re-raise errors caught by the controller.
class BasketsController; def rescue_action(e) raise e end; end

class BasketsControllerTest < ActionController::TestCase

  include KeteTestFunctionalHelper::TestHelper
  include AuthenticatedTestHelper

  def setup
    @base_class = "Basket"
    load_test_environment
    login_as(:admin)

    # hash of params to create new instance of model, e.g. {:name => 'Test Model', :description => 'Dummy'}
    @new_model =     { :name => 'Test Basket',
                       :show_privacy_controls => true,
                       :private_default => false,
                       :file_private_default => nil,
                       :allow_non_member_comments => true }
    # hash of params to update existing instance of model, e.g. {:name => 'Test Model', :description => 'Dummy'}
    @updated_model = { :show_privacy_controls => nil,
                       :private_default => true,
                       :file_private_default => false,
                       :allow_non_member_comments => nil }
  end

  def test_new
    get :new, new_path
    assert_response :success
    assert_template 'baskets/new'
    assert_var_assigned?
    assert_equal nil, assigns(:basket).show_privacy_controls
    assert_equal nil, assigns(:basket).private_default
    assert_equal nil, assigns(:basket).file_private_default
    assert_equal nil, assigns(:basket).allow_non_member_comments
  end

  def test_create
    create_record
    assert_var_assigned?
    assert_equal true, assigns(:basket).show_privacy_controls
    assert_equal false, assigns(:basket).private_default
    assert_equal nil, assigns(:basket).file_private_default
    assert_equal true, assigns(:basket).allow_non_member_comments
    assert_equal false, assigns(:basket).new_record?
    assert_response :redirect
    assert_redirected_to edit_path({ :urlified_name => assigns(:basket).urlified_name, :id => assigns(:basket).id })
  end

  def test_edit
    get :edit, edit_path
    assert_response :success
    assert_template 'baskets/edit'
    assert_var_assigned?
  end

  def test_update
    update_record
    assert_var_assigned?
    assert_equal nil, assigns(:basket).show_privacy_controls
    assert_equal true, assigns(:basket).private_default
    assert_equal false, assigns(:basket).file_private_default
    assert_equal nil, assigns(:basket).allow_non_member_comments
    assert_response :redirect
    assert_redirected_to :urlified_name => 'site'
    assert_equal 'Basket was successfully updated.', flash[:notice]
  end

end
