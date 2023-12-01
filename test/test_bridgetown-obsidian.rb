# frozen_string_literal: true

require_relative "helper"

class TestBridgetownObsidian < Bridgetown::TestCase
  def setup
    Bridgetown.reset_configuration!
    @config = Bridgetown.configuration(
      "root_dir" => root_dir,
      "source" => source_dir,
      "destination" => dest_dir,
      "quiet" => true
    )
    @config.run_initializers! context: :static
    @site = Bridgetown::Site.new(@config)
    @site.process
  end

  describe "BridgetownObsidian" do
    before do
      @source_file = File.read(source_dir("_posts/Original Post.md"))
      @destination_file = File.read(dest_dir("original-post/index.html"))
    end

    it "checks that there's a wikilink in the source file" do
      assert_includes @source_file, "[[Linked Post]]"
    end

    it "checks that the output has the correct link" do
      assert_includes @destination_file, "<a href=\"/linked-post/\">Linked Post</a>"
    end

    it "checks that there's a wikilink with an optional title in the source file" do
      assert_includes @source_file, "[[Linked Post|optional title]]"
    end

    it "checks that the output has the correct link" do
      assert_includes @destination_file, "<a href=\"/linked-post/\">optional title</a>"
    end

    it "checks that there's an image markdown in the source file" do
      assert_includes @source_file, "![[attachments/bridge.jpg]]"
    end

    it "checks that the output has the correct image reference" do
      assert_includes @destination_file, "<img src=\"/attachments/bridge.jpg\" alt=\"\" />"
    end
  end
end
