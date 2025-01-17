require 'microsoft_kiota_abstractions'
require_relative '../microsoft_graph'
require_relative '../models/o_data_errors/o_data_error'
require_relative '../models/print'
require_relative './connectors/connectors_request_builder'
require_relative './connectors/item/print_connector_item_request_builder'
require_relative './operations/item/print_operation_item_request_builder'
require_relative './operations/operations_request_builder'
require_relative './print'
require_relative './printers/item/printer_item_request_builder'
require_relative './printers/printers_request_builder'
require_relative './services/item/print_service_item_request_builder'
require_relative './services/services_request_builder'
require_relative './shares/item/printer_share_item_request_builder'
require_relative './shares/shares_request_builder'
require_relative './task_definitions/item/print_task_definition_item_request_builder'
require_relative './task_definitions/task_definitions_request_builder'

module MicrosoftGraph
    module Print
        ## 
        # Provides operations to manage the print singleton.
        class PrintRequestBuilder < MicrosoftKiotaAbstractions::BaseRequestBuilder
            
            ## 
            # Provides operations to manage the connectors property of the microsoft.graph.print entity.
            def connectors()
                return MicrosoftGraph::Print::Connectors::ConnectorsRequestBuilder.new(@path_parameters, @request_adapter)
            end
            ## 
            # Provides operations to manage the operations property of the microsoft.graph.print entity.
            def operations()
                return MicrosoftGraph::Print::Operations::OperationsRequestBuilder.new(@path_parameters, @request_adapter)
            end
            ## 
            # Provides operations to manage the printers property of the microsoft.graph.print entity.
            def printers()
                return MicrosoftGraph::Print::Printers::PrintersRequestBuilder.new(@path_parameters, @request_adapter)
            end
            ## 
            # Provides operations to manage the services property of the microsoft.graph.print entity.
            def services()
                return MicrosoftGraph::Print::Services::ServicesRequestBuilder.new(@path_parameters, @request_adapter)
            end
            ## 
            # Provides operations to manage the shares property of the microsoft.graph.print entity.
            def shares()
                return MicrosoftGraph::Print::Shares::SharesRequestBuilder.new(@path_parameters, @request_adapter)
            end
            ## 
            # Provides operations to manage the taskDefinitions property of the microsoft.graph.print entity.
            def task_definitions()
                return MicrosoftGraph::Print::TaskDefinitions::TaskDefinitionsRequestBuilder.new(@path_parameters, @request_adapter)
            end
            ## 
            ## Provides operations to manage the connectors property of the microsoft.graph.print entity.
            ## @param id Unique identifier of the item
            ## @return a print_connector_item_request_builder
            ## 
            def connectors_by_id(id)
                raise StandardError, 'id cannot be null' if id.nil?
                url_tpl_params = @path_parameters.clone
                url_tpl_params["printConnector%2Did"] = id
                return MicrosoftGraph::Print::Connectors::Item::PrintConnectorItemRequestBuilder.new(url_tpl_params, @request_adapter)
            end
            ## 
            ## Instantiates a new PrintRequestBuilder and sets the default values.
            ## @param path_parameters Path parameters for the request
            ## @param request_adapter The request adapter to use to execute the requests.
            ## @return a void
            ## 
            def initialize(path_parameters, request_adapter)
                super(path_parameters, request_adapter, "{+baseurl}/print{?%24select,%24expand}")
            end
            ## 
            ## Get print
            ## @param request_configuration Configuration for the request such as headers, query parameters, and middleware options.
            ## @return a Fiber of print
            ## 
            def get(request_configuration=nil)
                request_info = self.to_get_request_information(
                    request_configuration
                )
                error_mapping = Hash.new
                error_mapping["4XX"] = lambda {|pn| MicrosoftGraph::Models::ODataErrors::ODataError.create_from_discriminator_value(pn) }
                error_mapping["5XX"] = lambda {|pn| MicrosoftGraph::Models::ODataErrors::ODataError.create_from_discriminator_value(pn) }
                return @request_adapter.send_async(request_info, lambda {|pn| MicrosoftGraph::Models::Print.create_from_discriminator_value(pn) }, error_mapping)
            end
            ## 
            ## Provides operations to manage the operations property of the microsoft.graph.print entity.
            ## @param id Unique identifier of the item
            ## @return a print_operation_item_request_builder
            ## 
            def operations_by_id(id)
                raise StandardError, 'id cannot be null' if id.nil?
                url_tpl_params = @path_parameters.clone
                url_tpl_params["printOperation%2Did"] = id
                return MicrosoftGraph::Print::Operations::Item::PrintOperationItemRequestBuilder.new(url_tpl_params, @request_adapter)
            end
            ## 
            ## Update print
            ## @param body The request body
            ## @param request_configuration Configuration for the request such as headers, query parameters, and middleware options.
            ## @return a Fiber of print
            ## 
            def patch(body, request_configuration=nil)
                raise StandardError, 'body cannot be null' if body.nil?
                request_info = self.to_patch_request_information(
                    body, request_configuration
                )
                error_mapping = Hash.new
                error_mapping["4XX"] = lambda {|pn| MicrosoftGraph::Models::ODataErrors::ODataError.create_from_discriminator_value(pn) }
                error_mapping["5XX"] = lambda {|pn| MicrosoftGraph::Models::ODataErrors::ODataError.create_from_discriminator_value(pn) }
                return @request_adapter.send_async(request_info, lambda {|pn| MicrosoftGraph::Models::Print.create_from_discriminator_value(pn) }, error_mapping)
            end
            ## 
            ## Provides operations to manage the printers property of the microsoft.graph.print entity.
            ## @param id Unique identifier of the item
            ## @return a printer_item_request_builder
            ## 
            def printers_by_id(id)
                raise StandardError, 'id cannot be null' if id.nil?
                url_tpl_params = @path_parameters.clone
                url_tpl_params["printer%2Did"] = id
                return MicrosoftGraph::Print::Printers::Item::PrinterItemRequestBuilder.new(url_tpl_params, @request_adapter)
            end
            ## 
            ## Provides operations to manage the services property of the microsoft.graph.print entity.
            ## @param id Unique identifier of the item
            ## @return a print_service_item_request_builder
            ## 
            def services_by_id(id)
                raise StandardError, 'id cannot be null' if id.nil?
                url_tpl_params = @path_parameters.clone
                url_tpl_params["printService%2Did"] = id
                return MicrosoftGraph::Print::Services::Item::PrintServiceItemRequestBuilder.new(url_tpl_params, @request_adapter)
            end
            ## 
            ## Provides operations to manage the shares property of the microsoft.graph.print entity.
            ## @param id Unique identifier of the item
            ## @return a printer_share_item_request_builder
            ## 
            def shares_by_id(id)
                raise StandardError, 'id cannot be null' if id.nil?
                url_tpl_params = @path_parameters.clone
                url_tpl_params["printerShare%2Did"] = id
                return MicrosoftGraph::Print::Shares::Item::PrinterShareItemRequestBuilder.new(url_tpl_params, @request_adapter)
            end
            ## 
            ## Provides operations to manage the taskDefinitions property of the microsoft.graph.print entity.
            ## @param id Unique identifier of the item
            ## @return a print_task_definition_item_request_builder
            ## 
            def task_definitions_by_id(id)
                raise StandardError, 'id cannot be null' if id.nil?
                url_tpl_params = @path_parameters.clone
                url_tpl_params["printTaskDefinition%2Did"] = id
                return MicrosoftGraph::Print::TaskDefinitions::Item::PrintTaskDefinitionItemRequestBuilder.new(url_tpl_params, @request_adapter)
            end
            ## 
            ## Get print
            ## @param request_configuration Configuration for the request such as headers, query parameters, and middleware options.
            ## @return a request_information
            ## 
            def to_get_request_information(request_configuration=nil)
                request_info = MicrosoftKiotaAbstractions::RequestInformation.new()
                request_info.url_template = @url_template
                request_info.path_parameters = @path_parameters
                request_info.http_method = :GET
                request_info.headers.add('Accept', 'application/json')
                unless request_configuration.nil?
                    request_info.add_headers_from_raw_object(request_configuration.headers)
                    request_info.set_query_string_parameters_from_raw_object(request_configuration.query_parameters)
                    request_info.add_request_options(request_configuration.options)
                end
                return request_info
            end
            ## 
            ## Update print
            ## @param body The request body
            ## @param request_configuration Configuration for the request such as headers, query parameters, and middleware options.
            ## @return a request_information
            ## 
            def to_patch_request_information(body, request_configuration=nil)
                raise StandardError, 'body cannot be null' if body.nil?
                request_info = MicrosoftKiotaAbstractions::RequestInformation.new()
                request_info.url_template = @url_template
                request_info.path_parameters = @path_parameters
                request_info.http_method = :PATCH
                request_info.headers.add('Accept', 'application/json')
                unless request_configuration.nil?
                    request_info.add_headers_from_raw_object(request_configuration.headers)
                    request_info.add_request_options(request_configuration.options)
                end
                request_info.set_content_from_parsable(@request_adapter, "application/json", body)
                return request_info
            end

            ## 
            # Get print
            class PrintRequestBuilderGetQueryParameters
                
                ## 
                # Expand related entities
                attr_accessor :expand
                ## 
                # Select properties to be returned
                attr_accessor :select
                ## 
                ## Maps the query parameters names to their encoded names for the URI template parsing.
                ## @param original_name The original query parameter name in the class.
                ## @return a string
                ## 
                def get_query_parameter(original_name)
                    raise StandardError, 'original_name cannot be null' if original_name.nil?
                    case original_name
                        when "expand"
                            return "%24expand"
                        when "select"
                            return "%24select"
                        else
                            return original_name
                    end
                end
            end
        end
    end
end
