# frozen_string_literal: true

require_relative "./helper"

class TestBridgetownObsidian < Bridgetown::TestCase
  def setup
    Bridgetown.reset_configuration!
    @config = Bridgetown.configuration(
      "root_dir"    => root_dir,
      "source"      => source_dir,
      "destination" => dest_dir,
      "quiet"       => true
    )
    @config.run_initializers! context: :static
    @site = Bridgetown::Site.new(@config)
    @site.process

  end

  describe "BridgetownObsidian" do
    before do
      @contents = File.read(dest_dir("index.html"))
    end

    it "outputs the sample Liquid tag" do
      assert_includes @contents, "Testing this plugin"
    end
  end
end
