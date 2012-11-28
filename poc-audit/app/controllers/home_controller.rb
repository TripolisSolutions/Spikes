class HomeController < ApplicationController
  def index
    @audits = Audited.audit_class.limit(100).order("id desc").all
    
  end
end
