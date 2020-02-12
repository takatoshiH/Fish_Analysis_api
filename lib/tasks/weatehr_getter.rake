namespace :forecast_getter do
  task run: [:environment] do
    Weather.getter
    Tide.getter
  end
end