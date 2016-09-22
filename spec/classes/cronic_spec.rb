require 'spec_helper'

describe 'cronic' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "cronic class without any parameters" do
          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_class('cronic') }
          it { is_expected.to contain_file('/usr/local/bin/cronic').with(
            :ensure => 'present',
            :source => 'puppet:///modules/cronic/cronic',
            :mode   => '0755',) }

        end
      end
    end
  end

end
