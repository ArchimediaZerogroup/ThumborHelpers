RSpec.describe 'ThumborHelpers::AlchemyOverrides::Picture' do

  let(:override) do

    c = Class.new do

      def url(options = {})
        "/picture/image.jpg"
      end

    end

    c.prepend ThumborHelpers::AlchemyOverrides::Picture

    c.new
  end

  it "return a string" do
    expect(override.url).to be_a String
  end

  it "when not enabled" do
    expect(override.url({ parameter: "test" })).to be == "/picture/image.jpg"
  end

  context "thumbor abilitato" do

    before(:each) do
      ThumborHelpers.setup do |c|
        c.enabled = true
        c.server_url = "thumbor.domain.tld"
        c.image_root_host = "http://domain.tld"
      end
    end

    it "ritorna la versione con thumbor " do

      expect(override.url).to be == "https://thumbor.domain.tld/unsafe/#{CGI.escape("http://domain.tld/picture/image.jpg")}"

    end

  end

end