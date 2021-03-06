require 'spec_helper'

describe FipeApi::Vehicle do
  it 'should initialize properly' do
    v = FipeApi::Vehicle.new(FipeApi::Vehicle::CAR, "Car")
    expect(v.id).to eq FipeApi::Vehicle::CAR
    expect(v.name).to eq "Car"
    expect(v.name_id).to eq "carro"
  end

  it 'should get all vehicles' do
    vehicles = FipeApi::Vehicle.all
    expect(vehicles.length).not_to eq 0
    vehicles.each do |v|
      expect(v).to be_a FipeApi::Vehicle
    end
  end

  it 'should return all tables initialized for a specific vehicle' do
    v = FipeApi::Vehicle.new(FipeApi::Vehicle::CAR, "Car")
    tables = v.get_tables
    expect(tables.length).not_to eq 0
    tables.each do |v|
      expect(v).to be_a FipeApi::Table
      expect(v.id).not_to eq nil
      expect(v.month).not_to eq nil
      expect(v.year).not_to eq nil
    end
  end

  it 'should return all brands initialized for a specific vehicle' do
    v = FipeApi::Vehicle.new(FipeApi::Vehicle::CAR, "Car")
    tables = v.get_tables
    brands = v.get_brands(tables.first)
    expect(brands.length).not_to eq 0
    brands.each do |v|
      expect(v).to be_a FipeApi::Brand
      expect(v.id).not_to eq nil
      expect(v.name).not_to eq nil
      expect(v.table).to be_a FipeApi::Table
      expect(v.vehicle).to be_a FipeApi::Vehicle
    end
  end
end
