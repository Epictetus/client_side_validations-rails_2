module ClientSideValidations::ActiveRecord
  class Middleware

    def self.is_unique?(finder_class, attr_name, value, params)
      column     = finder_class.columns_hash[attr_name.to_s]
      connection = finder_class.connection

      if value.nil?
        comparison_operator = "IS ?"
      elsif column.text?
        comparison_operator = "#{connection.case_sensitive_equality_operator} ?"
        value = column.limit ? value.to_s.mb_chars[0, column.limit] : value.to_s
      else
        comparison_operator = "= ?"
      end

      sql_attribute = "#{finder_class.quoted_table_name}.#{connection.quote_column_name(attr_name)}"

      if value.nil? || (params[:case_sensitive] == 'true' || !column.text?)
        condition_sql = "#{sql_attribute} #{comparison_operator}"
        condition_params = [value]
      else
        condition_sql = "LOWER(#{sql_attribute}) #{comparison_operator}"
        condition_params = [value.mb_chars.downcase]
      end

      (params[:scope] || {}).each do |scope_item, scope_value|
        condition_sql << " AND " << finder_class.send(:attribute_condition, "#{finder_class.quoted_table_name}.#{connection.quote_column_name(scope_item)}", scope_value)
        condition_params << scope_value
      end

      if params[:id]
        condition_sql << " AND #{finder_class.quoted_table_name}.#{finder_class.primary_key} <> ?"
        condition_params << params[:id]
      end

      finder_class.send(:with_exclusive_scope) do
        !finder_class.exists?([condition_sql, *condition_params])
      end
    end
  end
end
