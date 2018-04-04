require 'rails_helper'

describe User do
  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:first_name) }
    it { should have_secure_password }
  end

  it "creates or updates info from omniauth hash" do
    auth = {
      :provider => "google",
      :uid => "12345",
      :info => {:name=>"Billy Bob",
                :email=>"billy@example.com",
                :first_name=>"Billy",
                :last_name=>"Bob",
                :image=>"https://lh3.googleusercontent.com/-WlovucTzrcg/AAAAAAAAAAI/AAAAAAAAAAA/b6cHrPLGZsM/s50-c/photo.jpg",
                :urls=>{:google=>"https://plus.google.com/102753798395250312915"}},
      :credentials => {:token=>"jfs.124jk--sff9",
                                 :expires_at=>1522848529,
                                 :expires=>true}
    }

    user = User.create_or_update(auth)

    expect(user.uid).to eq(12345)
    expect(user.email).to eq("billy@example.com")
    expect(user.first_name).to eq("Billy")
    expect(user.last_name).to eq("Bob")
    expect(user.token).to eq("jfs.124jk--sff9")
  end
end
