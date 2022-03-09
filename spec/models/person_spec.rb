require 'rails_helper'

RSpec.describe Person, type: :model do
  context 'when presence validation exists' do

    it 'is not valid without a full_name' do
      person = Person.new(
        full_name: nil,
        email: Faker::Internet.email
      ).save

      expect(person).to eq(false)
    end

    it 'is not valid withoud an email' do
      person = Person.new(
        full_name: Faker::Name.name,
        email: nil
      ).save

      expect(person).to eq(false)
    end
  end

  context 'when full_name validation exists' do
    
    it 'is not valid if less than 5 character ' do
      person = Person.new(
        full_name: "nan",
        email: Faker::Internet.email
      ).save

      expect(person).to eq(false)
    end

    it 'is not valid if more than 50 character' do
      person = Person.new(
        full_name: Faker::Name.name + Faker::Name.name + Faker::Name.name
      ).save
      
      expect(person).to eq(false)
    end
  end

  context 'when email validation exists' do
    before do
      person = Person.new(
        full_name: Faker::Name.name,
        email: "om@nan.com"
      ).save
    end

    it 'is not valid without a @ symbol' do
      person = Person.new(
        full_name: Faker::Name.name,
        email: "exampleemail"
      ).save

      expect(person).to eq(false)
    end

    it 'is not valid without unique email' do

      person = Person.new(
        full_name: Faker::Name.name,
        email: "om@nan.com"
      ).save

      expect(person).to eq(false)
    end

  end
end
