class ActiveModel::Validations::NumericalityValidator
  CHECKS = { :greater_than => :>, :greater_than_or_equal_to => :>=,
             :equal_to => :==, :less_than => :<, :less_than_or_equal_to => :<=,
             :odd => :odd?, :even => :even? }.freeze
end
