require 'microsoft_kiota_abstractions'
require_relative './models'

module MicrosoftGraph::Models
    class AndroidWorkProfileCustomConfiguration < MicrosoftGraph::Models::DeviceConfiguration
        include MicrosoftKiotaAbstractions::Parsable
        ## 
        # OMA settings. This collection can contain a maximum of 500 elements.
        @oma_settings
        ## 
        ## Instantiates a new AndroidWorkProfileCustomConfiguration and sets the default values.
        ## @return a void
        ## 
        def initialize()
            super
            @odata_type = "#microsoft.graph.androidWorkProfileCustomConfiguration"
        end
        ## 
        ## Creates a new instance of the appropriate class based on discriminator value
        ## @param parseNode The parse node to use to read the discriminator value and create the object
        ## @return a android_work_profile_custom_configuration
        ## 
        def self.create_from_discriminator_value(parse_node)
            raise StandardError, 'parse_node cannot be null' if parse_node.nil?
            return AndroidWorkProfileCustomConfiguration.new
        end
        ## 
        ## The deserialization information for the current model
        ## @return a i_dictionary
        ## 
        def get_field_deserializers()
            return super.merge({
                "omaSettings" => lambda {|n| @oma_settings = n.get_collection_of_object_values(lambda {|pn| MicrosoftGraph::Models::OmaSetting.create_from_discriminator_value(pn) }) },
            })
        end
        ## 
        ## Gets the omaSettings property value. OMA settings. This collection can contain a maximum of 500 elements.
        ## @return a oma_setting
        ## 
        def oma_settings
            return @oma_settings
        end
        ## 
        ## Sets the omaSettings property value. OMA settings. This collection can contain a maximum of 500 elements.
        ## @param value Value to set for the omaSettings property.
        ## @return a void
        ## 
        def oma_settings=(value)
            @oma_settings = value
        end
        ## 
        ## Serializes information the current object
        ## @param writer Serialization writer to use to serialize this model
        ## @return a void
        ## 
        def serialize(writer)
            raise StandardError, 'writer cannot be null' if writer.nil?
            super
            writer.write_collection_of_object_values("omaSettings", @oma_settings)
        end
    end
end