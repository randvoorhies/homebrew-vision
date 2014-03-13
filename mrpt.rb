require 'formula'

class Mrpt < Formula
  homepage 'http://www.mrpt.org/'
  url 'https://github.com/jlblancoc/mrpt/archive/1.1.0.tar.gz'
  head 'https://github.com/jlblancoc/mrpt.git'
  sha1 '7ab7fd48fa9932c746b9d95d3723bc8c911f342e'

  depends_on 'cmake' => :build
  depends_on 'wxmac' => 'disable-monolithic'
  depends_on 'gcc49'

  def install
    mkdir 'build' do
      system "cmake", "..", "-DCMAKE_CXX_COMPILER=g++-4.9", "-DCMAKE_C_COMPILER=gcc-4.9", "-DBUILD_XSENS_MT3=OFF", "-DBUILD_XSENS_MT4=OFF", *std_cmake_args
      system "make install"
    end
  end

end

