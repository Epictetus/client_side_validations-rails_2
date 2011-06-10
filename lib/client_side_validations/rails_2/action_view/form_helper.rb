module ClientSideValidations::Rails2::ActionView::Helpers
  module FormHelper
    def form_for(record_or_name_or_array, *args, &proc)
      html = super
      if match = html.match(/<script.+$/)
        concat(match[0])
      end
    end
  end
end

