RSpec.describe FakeGit::HashObject do
  subject {
    FakeGit::HashObject.new.call("hello world")
  }

  it "returns an Object" do
    expect(subject.class).to eq FakeGit::Priv::Object
    expect(subject.type).to eq "blob"
    expect(subject.content).to eq "hello world"
    expect(subject.index.length).to eq 40
  end
end
