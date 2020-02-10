namespace :forecast_getter do
  task run: [:environment] do
    Weather.getter
  end
end