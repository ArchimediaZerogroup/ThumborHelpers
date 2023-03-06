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

  let(:image_path) { "/picture/image.jpg" }

  let(:override) do

    c = Class.new do

      attr_accessor :original_image_path

      def url(options = {})
        original_image_path
      end

    end

    c.prepend ThumborHelpers::AlchemyOverrides::Picture

    c.new.tap { |c| c.original_image_path = image_path }
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

      expect(override.url).to be == "https://thumbor.domain.tld/t_FPAjHhr3vAmKqOMt3qTmFkWJg=/#{CGI.escape("http://domain.tld#{image_path}")}"

    end

    it "posso disabilitarlo tramite option nel metodo" do
      expect(override.url(thumbor_disable: true)).to be == "/picture/image.jpg"
    end

    [
      "/picture/pippo.png",
      "/picture/pluto.jpg",
      "/picture/sdfsdf.jpeg",
      "/picture/asdfasd.png?sadfsdfasdf "
    ].each do |path|
      context "with image: #{path}" do

        let(:image_path) { path }

        it "accepted" do
          expect(override.url).to match /^https:\/\/thumbor\.domain\.tld/
        end
      end

    end

    [
      "/picture/ciao.svg"
    ].each do |path|
      context "with image: #{path}" do
        let(:image_path) { path }

        it "not accepted" do
          expect(override.url).to be == image_path
        end

      end
    end

  end
end