module WaitForAjax
  def wait_for_ajax
    Timeout.timeout(Capybara.default_max_wait_time) do
      loop until finished_all_ajax_features?
    end
  end

  def finished_all_ajax_features?
    page.evaluate_script('jQuery.active').zero?
  end
end

Rspec.configure do |config|
  config.include WaitForAjax, type: :feature
end