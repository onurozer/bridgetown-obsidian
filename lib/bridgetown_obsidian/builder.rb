# frozen_string_literal: true

module BridgetownObsidian
  class Builder < Bridgetown::Builder
    def build
      Bridgetown.logger.info "Hello world! 🥳"
    end
  end
end

BridgetownObsidian::Builder.register