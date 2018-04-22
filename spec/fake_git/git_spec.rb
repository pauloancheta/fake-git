RSpec.describe FakeGit do
  it "has a version number" do
    expect(FakeGit::VERSION).not_to be nil
  end

  it "does something useful" do
    hash_object = FakeGit.call(["hash-object", "hello"])
    expect(hash_object.class).to eq FakeGit::Priv::Object
  end

  it "returns the help message when cmd is not present" do
    hash_object = FakeGit.call()
    expect(hash_object).to eq(nil)
  end
end
