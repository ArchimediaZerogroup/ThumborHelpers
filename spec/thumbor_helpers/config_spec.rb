RSpec.describe 'ThumborHelpers::Config' do

  it "alla creazione viene richiamata la configurazione di thumbor" do
    expect_any_instance_of(ThumborHelpers::Config).to receive(:reconfigure_thumbor)
    ThumborHelpers::Config.new
  end

  it "enabled?"do
    expect(ThumborHelpers::Config.new).not_to be_enabled
  end

end