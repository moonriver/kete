module KeteTestFunctionalHelper
  module TestHelper
    private
      def new_path(attributes = {})
        { :urlified_name => 'site', :controller => @base_class.pluralize.downcase, :action => 'new' }.merge(attributes)
      end

      def create_record(attributes = {}, location = {})
        eval("post :create, { :#{@base_class.singularize.downcase} => @new_model.merge(attributes), :urlified_name => 'site', :controller => @base_class.pluralize.downcase }.merge(location)")
      end

      def edit_path(attributes = {})
        { :urlified_name => 'site', :controller => @base_class.pluralize.downcase, :action => 'edit', :id => 1 }.merge(attributes)
      end

      def update_record(attributes = {}, location = {})
        eval("post :update, { :#{@base_class.singularize.downcase} => @updated_model.merge(attributes), :urlified_name => 'site', :controller => @base_class.pluralize.downcase, :id => 1 }.merge(location)")
      end

      def assert_var_assigned?(var = @base_class.downcase.to_sym)
        assert_not_nil assigns(var)
      end

      def load_test_environment
        @controller = eval("#{@base_class.classify.pluralize}Controller.new")
        @request    = ActionController::TestRequest.new
        @response   = ActionController::TestResponse.new
      end
  end
end
