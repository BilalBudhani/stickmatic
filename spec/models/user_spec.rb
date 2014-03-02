require 'spec_helper'

describe User do

  it { should have_many(:invitations) }
  it { should have_one(:invited_by) }
  it { should have_many(:packs) }
  it { should have_many(:orders) }

  it { should validate_presence_of(:provider) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:uid) }
  it { should validate_presence_of(:token) }
  it { should validate_presence_of(:email) }

  it "has a valid factory" do
    expect(FactoryGirl.create(:user)).to be_valid
  end

  context "when creating user" do
    it "should validates provider" do
      expect(FactoryGirl.build(:user, provider: nil)).not_to be_valid
    end

    it "should validates username" do
      expect(FactoryGirl.build(:user, username: nil)).not_to be_valid
    end

    it "should validates auth token" do
      expect(FactoryGirl.build(:user, token: nil)).not_to be_valid
    end

    it "should validates email" do
      expect(FactoryGirl.build(:user, email: nil)).not_to be_valid
    end

    it "should validates record" do
      user = FactoryGirl.create(:user)
      expect(User.first).to eq(user)
    end

    it "should validates created at and updated at" do
      user = FactoryGirl.create(:user)
      expect(user[:created_at].to_date).to be_a(Date)
      expect(user[:updated_at].to_date).to be_a(Date)
    end
  end

  it "should have invitecode after create" do
    expect(FactoryGirl.create(:user).invite_code).to be_present
  end

  describe "find_for_instagram_oauth" do
    let(:auth_params) { OmniAuth.config.mock_auth[:instagram] }

    context "when new user logins via instagram" do
      it "should create new user" do
        expect { User.find_for_instagram_oauth(auth_params) }.to change(User, :count).by(1)
      end
    end

    context "when old user logins via instagram" do
      before(:each) { User.find_for_instagram_oauth(auth_params) }

      it "should not create new user" do
        expect { User.find_for_instagram_oauth(auth_params) }.not_to change(User, :count).by(1)
      end
    end
  end

end