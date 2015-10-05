class StoreController < ApplicationController
  before_action :set_department_list,:set_cart, only: [:index]
  def index
  end
end
