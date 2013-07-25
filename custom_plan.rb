require 'zeus/rails'

class CustomPlan < Zeus::Rails
  def test_environment
    require 'minitest/unit'
    MiniTest::Unit.class_variable_set('@@installed_at_exit', true)
    super
  end
end

Zeus.plan = CustomPlan.new
