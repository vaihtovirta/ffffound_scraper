# coding: utf-8
require 'spec_helper'

describe FfffoundScaper do
  describe '#call' do
    let(:error) { FfffoundScaper::PageNumberError }

    subject do
      VCR.use_cassette('parse') { FfffoundScaper.call(page_number) }
    end

    context 'when valid page number given' do
      let(:page_number) { 1 }

      it { expect(subject.size).to eq 0 } # Rip ffffound.com :(
    end

    context 'when nil given' do
      let(:page_number) { nil }

      it { expect { subject }.to raise_error error }
    end

    context 'when zero given' do
      let(:page_number) { 0 }

      it { expect { subject }.to raise_error error }
    end
  end
end
