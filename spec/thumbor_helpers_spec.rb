RSpec.describe ThumborHelpers do
  it "has a version number" do
    expect(ThumborHelpers::VERSION).not_to be nil
  end

  it "ha la configurazione" do
    expect(described_class).to respond_to :config
    expect(described_class.config).to be_a ThumborHelpers::Config
  end

  it "possiamo eseguire il setup" do

    expect {
      described_class.setup do |c|
        c.server_url = "valore.nostro"
      end
    }.to change(described_class.config, :server_url).to('valore.nostro')

  end

end
