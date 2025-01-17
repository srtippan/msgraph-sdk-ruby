require 'microsoft_kiota_abstractions'
require_relative '../microsoft_graph'
require_relative './models'

module MicrosoftGraph
    module Models
        class SearchQuery
            include MicrosoftKiotaAbstractions::AdditionalDataHolder, MicrosoftKiotaAbstractions::Parsable
            ## 
            # Stores additional data not described in the OpenAPI description found when deserializing. Can be used for serialization as well.
            @additional_data
            ## 
            # The OdataType property
            @odata_type
            ## 
            # The search query containing the search terms. Required.
            @query_string
            ## 
            # The queryTemplate property
            @query_template
            ## 
            ## Gets the additionalData property value. Stores additional data not described in the OpenAPI description found when deserializing. Can be used for serialization as well.
            ## @return a i_dictionary
            ## 
            def additional_data
                return @additional_data
            end
            ## 
            ## Sets the additionalData property value. Stores additional data not described in the OpenAPI description found when deserializing. Can be used for serialization as well.
            ## @param value Value to set for the AdditionalData property.
            ## @return a void
            ## 
            def additional_data=(value)
                @additional_data = value
            end
            ## 
            ## Instantiates a new searchQuery and sets the default values.
            ## @return a void
            ## 
            def initialize()
                @additional_data = Hash.new
            end
            ## 
            ## Creates a new instance of the appropriate class based on discriminator value
            ## @param parse_node The parse node to use to read the discriminator value and create the object
            ## @return a search_query
            ## 
            def self.create_from_discriminator_value(parse_node)
                raise StandardError, 'parse_node cannot be null' if parse_node.nil?
                return SearchQuery.new
            end
            ## 
            ## The deserialization information for the current model
            ## @return a i_dictionary
            ## 
            def get_field_deserializers()
                return {
                    "@odata.type" => lambda {|n| @odata_type = n.get_string_value() },
                    "queryString" => lambda {|n| @query_string = n.get_string_value() },
                    "queryTemplate" => lambda {|n| @query_template = n.get_string_value() },
                }
            end
            ## 
            ## Gets the @odata.type property value. The OdataType property
            ## @return a string
            ## 
            def odata_type
                return @odata_type
            end
            ## 
            ## Sets the @odata.type property value. The OdataType property
            ## @param value Value to set for the odata_type property.
            ## @return a void
            ## 
            def odata_type=(value)
                @odata_type = value
            end
            ## 
            ## Gets the queryString property value. The search query containing the search terms. Required.
            ## @return a string
            ## 
            def query_string
                return @query_string
            end
            ## 
            ## Sets the queryString property value. The search query containing the search terms. Required.
            ## @param value Value to set for the query_string property.
            ## @return a void
            ## 
            def query_string=(value)
                @query_string = value
            end
            ## 
            ## Gets the queryTemplate property value. The queryTemplate property
            ## @return a string
            ## 
            def query_template
                return @query_template
            end
            ## 
            ## Sets the queryTemplate property value. The queryTemplate property
            ## @param value Value to set for the query_template property.
            ## @return a void
            ## 
            def query_template=(value)
                @query_template = value
            end
            ## 
            ## Serializes information the current object
            ## @param writer Serialization writer to use to serialize this model
            ## @return a void
            ## 
            def serialize(writer)
                raise StandardError, 'writer cannot be null' if writer.nil?
                writer.write_string_value("@odata.type", @odata_type)
                writer.write_string_value("queryString", @query_string)
                writer.write_string_value("queryTemplate", @query_template)
                writer.write_additional_data(@additional_data)
            end
        end
    end
end
