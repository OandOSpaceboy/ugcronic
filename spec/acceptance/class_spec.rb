require 'spec_helper_acceptance'

describe 'cronic class' do
  context 'default parameters' do
    # Using puppet_apply as a helper
    it 'should work idempotently with no errors' do
      pp = <<-EOS
      class { 'cronic': }
      EOS

      # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes  => true)
    end

    describe file('/usr/local/bin/cronic') do
      it { should exist }
      it { should be_file }
      it { should be_mode 755 }
      it { should be_owned_by 'root'}
      it { should be_grouped_into 'staff'}
    end

  end
end
