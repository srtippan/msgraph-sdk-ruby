require 'microsoft_kiota_abstractions'
require_relative '../../../../../../../../../../../../microsoft_graph'
require_relative '../../../../../../../../../../../../models/o_data_errors/o_data_error'
require_relative '../../../../../../../../../../../groups'
require_relative '../../../../../../../../../../item'
require_relative '../../../../../../../../../sites'
require_relative '../../../../../../../../item'
require_relative '../../../../../../../onenote'
require_relative '../../../../../../section_groups'
require_relative '../../../../../item'
require_relative '../../../../sections'
require_relative '../../../item'
require_relative '../../pages'
require_relative '../item'
require_relative './onenote_patch_content'

module MicrosoftGraph::Groups::Item::Sites::Item::Onenote::SectionGroups::Item::Sections::Item::Pages::Item::OnenotePatchContent
    ## 
    # Provides operations to call the onenotePatchContent method.
    class OnenotePatchContentRequestBuilder
        
        ## 
        # Path parameters for the request
        @path_parameters
        ## 
        # The request adapter to use to execute the requests.
        @request_adapter
        ## 
        # Url template to use to build the URL for the current request builder
        @url_template
        ## 
        ## Instantiates a new OnenotePatchContentRequestBuilder and sets the default values.
        ## @param pathParameters Path parameters for the request
        ## @param requestAdapter The request adapter to use to execute the requests.
        ## @return a void
        ## 
        def initialize(path_parameters, request_adapter)
            raise StandardError, 'path_parameters cannot be null' if path_parameters.nil?
            raise StandardError, 'request_adapter cannot be null' if request_adapter.nil?
            @url_template = "{+baseurl}/groups/{group%2Did}/sites/{site%2Did}/onenote/sectionGroups/{sectionGroup%2Did}/sections/{onenoteSection%2Did}/pages/{onenotePage%2Did}/microsoft.graph.onenotePatchContent"
            @request_adapter = request_adapter
            path_parameters = { "request-raw-url" => path_parameters } if path_parameters.is_a? String
            @path_parameters = path_parameters if path_parameters.is_a? Hash
        end
        ## 
        ## Invoke action onenotePatchContent
        ## @param body The request body
        ## @param requestConfiguration Configuration for the request such as headers, query parameters, and middleware options.
        ## @return a Fiber of void
        ## 
        def post(body, request_configuration=nil)
            raise StandardError, 'body cannot be null' if body.nil?
            request_info = self.to_post_request_information(
                body, request_configuration
            )
            error_mapping = Hash.new
            error_mapping["4XX"] = lambda {|pn| MicrosoftGraph::Models::ODataErrors::ODataError.create_from_discriminator_value(pn) }
            error_mapping["5XX"] = lambda {|pn| MicrosoftGraph::Models::ODataErrors::ODataError.create_from_discriminator_value(pn) }
            return @request_adapter.send_async(request_info, nil, error_mapping)
        end
        ## 
        ## Invoke action onenotePatchContent
        ## @param body The request body
        ## @param requestConfiguration Configuration for the request such as headers, query parameters, and middleware options.
        ## @return a request_information
        ## 
        def to_post_request_information(body, request_configuration=nil)
            raise StandardError, 'body cannot be null' if body.nil?
            request_info = MicrosoftKiotaAbstractions::RequestInformation.new()
            request_info.url_template = @url_template
            request_info.path_parameters = @path_parameters
            request_info.http_method = :POST
            unless request_configuration.nil?
                request_info.add_headers_from_raw_object(request_configuration.headers)
                request_info.add_request_options(request_configuration.options)
            end
            request_info.set_content_from_parsable(self.request_adapter, "application/json", body)
            return request_info
        end

        ## 
        # Configuration for the request such as headers, query parameters, and middleware options.
        class OnenotePatchContentRequestBuilderPostRequestConfiguration
            
            ## 
            # Request headers
            attr_accessor :headers
            ## 
            # Request options
            attr_accessor :options
        end
    end
end