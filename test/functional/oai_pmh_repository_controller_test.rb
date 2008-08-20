require File.dirname(__FILE__) + '/../test_helper'
require 'oai_pmh_repository_controller'

# Re-raise errors caught by the controller.
class OaiPmhRepositoryController; def rescue_action(e) raise e end; end

class OaiPmhRepositoryControllerTest < ActionController::TestCase

  include KeteTestFunctionalHelper::TestHelper

  def setup
    @base_class = "OaiPmhRepository"
    load_test_environment
  end
end