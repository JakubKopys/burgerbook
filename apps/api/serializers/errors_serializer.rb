require 'jsonapi/serializable'

class ErrorsSerializer
  def initialize(renderer: JSONAPI::Serializable::Renderer.new)
    @renderer = renderer
  end

  def call(errors)
    json = @renderer.render_errors(errors)

    JSON.dump(json)
  end
end
