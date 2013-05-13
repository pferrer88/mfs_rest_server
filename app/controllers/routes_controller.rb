class RoutesController < InheritedResources::Base
  respond_to :json
  
  def index
    @routes = Route.includes( :stops => 
      {:contract=>
        [
          {:location => :contacts}, 
          { :contract_services=>[:service,{:contract_components => :component}] }, 
          :customer
        ]
      }
    )
     
    respond_with @routes.to_json(:include => 
      {:stops => 
        {:include => 
          {:contract => 
            {:include => 
              {:location => {:include=> :contacts}, 
              :contract_services => {:include=> 
                {:contract_components => {:include => :component}, :service=>{}} 
              }, 
              :customer => {} } 
            } 
          } 
        } 
      }
    )
    
    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.json { render json: @routes }
    # end
  end
end
