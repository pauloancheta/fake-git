RSpec.describe Fake::Git::Priv::Object do
  it "requires a certain type" do
    result = Fake::Git::Priv::Object.new(type: "blob", size: 2, content: "", index: "index")
    expect(result.type).to eq "blob"
  end
end
