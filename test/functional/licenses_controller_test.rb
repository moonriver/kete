require File.dirname(__FILE__) + '/../test_helper'
require 'licenses_controller'

# Re-raise errors caught by the controller.
class LicensesController; def rescue_action(e) raise e end; end

class LicensesControllerTest < ActionController::TestCase

  include KeteTestFunctionalHelper::TestHelper
  include AuthenticatedTestHelper

  fixtures :licenses

  def setup
    @base_class = "License"
    @assignment_var = "record" # singular, lowercase
    load_test_environment
    login_as(:admin)

    # hash of params to create new instance of model, e.g. {:name => 'Test Model', :description => 'Dummy'}
    @new_model =     { :name => 'License1',
                       :description => 'License1' }
    @updated_model = { :name => 'License2',
                       :description => 'License2' }
  end

  def test_index
    get :index, index_path
    assert_viewing_template 'licenses/list'
    assert_var_assigned true
    assert_equal 4, assigns(:records).size
  end

  def test_show
    get :show, show_path({ :id => licenses(:one).id })
    assert_viewing_template 'licenses/show'
    assert_var_assigned 
  end

  def test_new
    get :new, new_path
    assert_viewing_template 'licenses/create_form'
    assert_var_assigned
  end

  def test_create
    create_record
    assert_var_assigned
    assert_attributes_same_as @new_model
    assert_redirect_to( index_path )
  end

  def test_edit
    get :edit, edit_path({ :id => licenses(:one).id })
    assert_viewing_template 'licenses/update_form'
    assert_var_assigned
  end

  def test_update
    update_record( {}, { :id => licenses(:one).id } )
    assert_var_assigned
    assert_attributes_same_as @updated_model
    assert_redirect_to( index_path )
  end

  def test_destroy
    destroy_record({ :id => licenses(:one).id })
    assert_redirect_to( index_path )
  end
end
