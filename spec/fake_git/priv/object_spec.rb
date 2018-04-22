RSpec.describe FakeGit::Priv::Object do
  it "requires a certain type" do
    result = FakeGit::Priv::Object.new(type: "blob", content: "", index: "index")
    expect(result.type).to eq "blob"
  end
end
