require_relative 'spec_helper'

describe 'non-standard elasticsearch install and configure' do
  it_behaves_like 'elasticsearch user',     user: 'foo',
                                            uid: 1111,
                                            home: '/usr/local/myhomedir',
                                            shell: '/bin/sh',
                                            group: 'bar',
                                            gid: 2222

  it_behaves_like 'elasticsearch install',     dir: '/usr/local/awesome',
                                               package: 'elasticsearch',
                                               user: 'foo',
                                               group: 'bar'

  it_behaves_like 'elasticsearch configure',     dir: '/usr/local/awesome',
                                                 user: 'foo',
                                                 group: 'bar',
                                                 env: ['FOO=BAR', 'PrintGCDetails', '-Xss512k']

  it_behaves_like 'elasticsearch service', 'elasticsearch-crazy'
end

describe 'removed elasticsearch users should NOT exist' do
  describe group('deleteme') do
    it { should_not exist }
  end

  describe user('deleteme') do
    it { should_not exist }
  end
end
