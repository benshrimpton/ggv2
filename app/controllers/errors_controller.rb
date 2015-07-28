class ErrorsController < ApplicationController 
  
  layout "errors"

  def not_found
    render template: "errors/not_found"
  end

  def unacceptable
    render template: "errors/unacceptable"
  end

  def internal_error
    render template: "errors/internal_error"
  end

end