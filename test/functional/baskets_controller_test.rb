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
    @default_model = { :show_privacy_controls => nil,
                       :private_default => nil,
                       :file_private_default => nil,
                       :allow_non_member_comments => nil }
    @new_model =     { :name => 'Test Basket',
                       :show_privacy_controls => true,
                       :private_default => false,
                       :file_private_default => nil,
                       :allow_non_member_comments => true }
    @updated_model = { :show_privacy_controls => nil,
                       :private_default => true,
                       :file_private_default => false,
                       :allow_non_member_comments => nil }
  end

  def test_redirect_to_basket_all
    get :show, :urlified_name => 'site'
    assert_redirect_to({ :urlified_name => 'site', :controller_name_for_zoom_class => 'topics' })
  end

  def test_index_and_list
    get :index, index_path
    assert_viewing_template 'baskets/list'
    assert_var_assigned true
    assert_equal 4, assigns(:baskets).size

    get :list, index_path({ :action => 'list' })
    assert_viewing_template 'baskets/list'
    assert_var_assigned true
    assert_equal 4, assigns(:baskets).size
  end

  def test_new
    get :new, new_path
    assert_viewing_template 'baskets/new'
    assert_var_assigned
    assert_attributes_same_as @default_model
  end

  def test_create
    create_record
    assert_var_assigned
    assert_attributes_same_as @new_model
    assert_redirect_to( edit_path({ :urlified_name => assigns(:basket).urlified_name, :id => assigns(:basket).id }) )
    assert_equal 'Basket was successfully created.', flash[:notice]
  end

  def test_edit
    get :edit, edit_path
    assert_viewing_template 'baskets/edit'
    assert_var_assigned

    get :homepage_options, edit_path({ :action => 'homepage_options' })
    assert_viewing_template 'baskets/homepage_options'
    assert_var_assigned
  end

  def test_update
    update_record
    assert_var_assigned
    assert_attributes_same_as @updated_model
    assert_redirect_to({ :urlified_name => 'site' })
    assert_equal 'Basket was successfully updated.', flash[:notice]
  end

  def test_destroy
    destroy_record({ :id => 4 }) # documentation basket
    assert_redirect_to '/'
    assert_equal 'Basket was successfully deleted.', flash[:notice]
  end
end
