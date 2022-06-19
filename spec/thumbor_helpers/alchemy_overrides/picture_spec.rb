RSpec.describe 'ThumborHelpers::AlchemyOverrides::Picture' do

  let(:enabled) { false }
  before(:each) do
    ThumborHelpers.setup do |c|
      c.enabled = enabled
      c.security_key = "1234567890123456"
      c.server_url = "https://thumbor.domain.tld"
      c.image_root_host = "http://domain.tld"
    end
  end

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
    let(:enabled) { true }
    it "ritorna la versione con thumbor " do

      expect(override.url).to be == "https://thumbor.domain.tld/t_FPAjHhr3vAmKqOMt3qTmFkWJg=/#{CGI.escape("http://domain.tld/picture/image.jpg")}"

    end

  end

end