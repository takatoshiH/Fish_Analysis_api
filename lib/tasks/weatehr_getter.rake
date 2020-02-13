namespace :forecast_getter do
  task run: [:environment] do
    Weather.getter("33.36,130.25")
    Tide.getter
  end
end