Rails.application.routes.draw do

  mount ODataServer::Engine => "/o_data_server"

  get "/OData/OData.svc" => 'o_data_server/o_data#service'
  match "/OData/OData.svc/$metadata" => "o_data_server/o_data#metadata"
  match "/OData/OData.svc/:entityset" => "o_data_server/o_data#resource"
  match "/OData" => "o_data_server/o_data#redirect_to_service"
  match "/OData/$metadata" => "o_data_server/o_data#redirect_to_metadata"
  match "/OData/*#{ODataServer::ODataController.path_param.to_s}" => "o_data_server/o_data#redirect_to_resource"
end
#TODO why do i have to add routes in here which are also in the routes in the mountable engine??