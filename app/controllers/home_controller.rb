class HomeController < ApplicationController
  
  def index
    @petitions = Petition.all.order( 'government_response_at desc' )
  end
end
