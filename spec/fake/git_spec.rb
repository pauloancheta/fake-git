RSpec.describe Fake::Git do
  it "has a version number" do
    expect(Fake::Git::VERSION).not_to be nil
  end

  it "does something useful" do
    hash_object = Fake::Git.call(["hash-object", "hello"])
    expect(hash_object).to eq("hello")
  end

  it "returns the help message when cmd is not present" do
    hash_object = Fake::Git.call()
    expect(hash_object).to eq(nil)
  end
end
