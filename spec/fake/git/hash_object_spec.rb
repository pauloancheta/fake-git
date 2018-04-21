RSpec.describe Fake::Git::HashObject do
  subject {
    Fake::Git::HashObject.new.call("hello world")
  }

  it "returns an Object" do
    expect(subject.class).to eq Fake::Git::Priv::Object
    expect(subject.type).to eq "blob"
    expect(subject.content).to eq "hello world"
    expect(subject.index.length).to eq 40
  end
end
