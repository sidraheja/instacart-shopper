require 'active_model_serializers/register_jsonapi_renderer'

ActiveModel::Serializer.config.adapter = ActiveModel::Serializer::Adapter::JsonApi
