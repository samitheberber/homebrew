require 'formula'

class AppscaleTools < Formula
  homepage 'http://www.appscale.com/'
  url 'https://github.com/AppScale/appscale-tools/archive/1.11.0.tar.gz'
  sha1 'ea4321e25ec6e073f31b32f2656ceb4433a6ed12'
  head 'https://github.com/AppScale/appscale-tools.git'

  depends_on 'swig' => :build
  depends_on 'ssh-copy-id'
  depends_on :python => %w(termcolor SOAPpy boto argparse oauth2client httplib2)
  depends_on :python => [
    'yaml' => 'pyyaml',
    'apiclient' => 'google-api-python-client',
    'gflags' => 'python-gflags'
  ]

  def install
    prefix.install %w(bin lib templates LICENSE README.md)

    onoe "You need to have ssh-key" unless File.exists?(File.join(ENV['HOME'], ".ssh", "id_rsa"))
  end

  test do
    system "appscale", "help"
  end
end
