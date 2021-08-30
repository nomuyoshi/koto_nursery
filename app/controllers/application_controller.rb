class ApplicationController < ActionController::API
  def snakelize_params
    params.deep_transform_keys!(&:underscore)
  end
end
