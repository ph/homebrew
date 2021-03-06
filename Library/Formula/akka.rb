require 'formula'

class Akka < Formula
  homepage 'http://akka.io/'
  url 'http://download.akka.io/downloads/akka-2.0.4.tgz'
  sha1 'd29e223745cf7d4f73ebc03a0d51296118553e6d'

  def install
    # Remove Windows files
    rm "bin/akka.bat"

    # Translate akka script
    inreplace "bin/akka" do |s|
      s.gsub! /^declare AKKA_HOME=.*$/, "declare AKKA_HOME=#{libexec}"
    end

    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/akka"
  end
end
