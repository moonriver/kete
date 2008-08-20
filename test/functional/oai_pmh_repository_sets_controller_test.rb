require File.dirname(__FILE__) + '/../test_helper'
require 'oai_pmh_repository_sets_controller'

# Re-raise errors caught by the controller.
class OaiPmhRepositorySetsController; def rescue_action(e) raise e end; end

class OaiPmhRepositorySetsControllerTest < ActionController::TestCase

  include KeteTestFunctionalHelper::TestHelper

  def setup
    @base_class = "OaiPmhRepositorySets"
    load_test_environment
  end
end
