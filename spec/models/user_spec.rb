require 'rails_helper'

RSpec.describe User, type: :model do


  context "validations" do

    it "should have name and email and password_digest" do
      should have_db_column(:first_name).of_type(:string)
      should have_db_column(:last_name).of_type(:string)
      should have_db_column(:gender).of_type(:binary)
      should have_db_column(:birthday).of_type(:date)
      should have_db_column(:email).of_type(:string)
      should have_db_column(:password_digest).of_type(:string)
    end

    describe "validates presence of first_name, last_name, email and uniqueness of email" do
      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to validate_presence_of(:first_name) }
      it { is_expected.to validate_presence_of(:last_name) }
      it { is_expected.to validate_uniqueness_of(:email) }
    end

    describe "validates password" do
      it { is_expected.to validate_presence_of(:password) }
      it { is_expected.to validate_presence_of(:password_confirmation) }
      it { is_expected.to validate_length_of(:password).is_at_least(6).is_at_most(20) }
      it { is_expected.to validate_confirmation_of(:password) }
    end

    describe "user can be created if first name, last name, email, password are present" do
      When(:user) { User.create(
        first_name: "Melissa",
        last_name: "Saw",
        email: "melissa89@gmail.com",
        password: "123123",
        password_confirmation: "123123"
      )}

      Then { user.valid? == true }
    end

   #cant create user if one of the attributes that require presence not present
    describe "cannot create user without a first_name" do
      When(:user) { User.create(email: "stanley@gmail.com", password: "123456", password_confirmation: "123456") }
      Then { user.valid? == false }
    end

    describe "cannot create user without a last_name" do
      When(:user) { User.create(email: "stanley@gmail.com", password: "123456", password_confirmation: "123456") }
      Then { user.valid? == false }
    end

    describe "cannot create user without a email" do
      When(:user) { User.create(first_name: "Stanley",last_name: "Manly", password: "123456", password_confirmation: "123456") }
      Then { user.valid? == false }
    end

    describe "cannot be created without a password" do
      When(:user) { User.create(first_name: "Stanley",last_name: "Manly",email: "stanley@gmail.com") }
      Then { user.valid? == false }
    end

    # Format of email and uniqueness
    describe "should permit valid email only" do
      let(:user1) { User.create(first_name: "Stanley", last_name: "Haha",email: "stanley89@gmail.com", password: "123456", password_confirmation: "123456")}
      let(:user2) { User.create(first_name: "Lulu",last_name: "Haha",email: "lulu.com", password: "123456", password_confirmation: "123456") }
      let(:user3) { User.create(first_name: "Haha",last_name: "Hoho",email: "stanley89@gmail.com", password: "123456", password_confirmation: "123456") }
      
      it "sign up with valid email" do
        expect(user1).to be_valid
      end

      it "sign up with invalid email" do
        expect(user2).to be_invalid
      end 

      # uniqueness
      it "sign up with repeated email" do
        expect(user3).to be_invalid
      end 


    end

  end

end