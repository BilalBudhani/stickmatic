require 'spec_helper'

describe Identity do

  it { should belong_to(:user) }

  it { should validate_presence_of(:provider) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:uid) }

  it "has a valid factory" do
    expect(FactoryGirl.create(:identity)).to be_valid
  end

  context "when creating identity" do
    it "should validates provider" do
      expect(FactoryGirl.build(:identity, provider: nil)).not_to be_valid
    end

    it "should validates user_id" do
      expect(FactoryGirl.build(:identity, user_id: nil)).not_to be_valid
    end

    it "should validates record" do
      identity = FactoryGirl.create(:identity)
      expect(Identity.find(identity.id)).to eq(identity)
    end

    it "should validates created at and updated at" do
      identity = FactoryGirl.create(:identity)
      expect(identity[:created_at].to_date).to be_a(Date)
      expect(identity[:updated_at].to_date).to be_a(Date)
    end
  end

 describe "find_for_oauth" do
    let(:auth_params) { OmniAuth.config.mock_auth[:instagram] }

    context "when new user logins via instagram" do
      it "should create new Identity" do
        expect { User.find_for_oauth(auth_params) }.to change(Identity, :count).by(1)
      end
    end

    context "when old Identity logins via instagram" do
      before(:each) { User.find_for_oauth(auth_params) }

      it "should not create new Identity" do
        expect { User.find_for_oauth(auth_params) }.to change(Identity, :count).by(0)
      end
    end
  end



end