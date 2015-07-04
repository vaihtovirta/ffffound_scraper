# coding: utf-8
require 'spec_helper'

describe FfffoundParser do
  describe 'parse and receive images' do
    it 'returns array of images' do
      image_list = FfffoundParser.find(1).image_list
      expect(image_list.count).to eq 25
    end
  end

  describe 'invalid page number' do
    it 'raises an exception with float' do
      expect{ FfffoundParser.find(1.2) }.to raise_error(StandardError)
    end

    it 'raises an exception with string' do
      expect{ FfffoundParser.find('1') }.to raise_error(StandardError)
    end

    it 'raises an exception with string' do
      expect{ FfffoundParser.find(nil) }.to raise_error(StandardError)
    end
  end
end
