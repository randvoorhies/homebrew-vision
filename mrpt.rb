require 'formula'

class Mrpt < Formula
  homepage 'http://www.mrpt.org/'
  url 'https://github.com/jlblancoc/mrpt/archive/1.1.0.tar.gz'
  head 'https://github.com/jlblancoc/mrpt.git'
  sha1 '7ab7fd48fa9932c746b9d95d3723bc8c911f342e'

  depends_on 'cmake' => :build
  depends_on 'wxmac' => 'disable-monolithic'

  def patches
    # Hacks around OpenGL and GLUT ambiguities by using system installed GLUT headers
    "https://gist.githubusercontent.com/randvoorhies/9283072/raw/mrpt_osx_glut_patch.diff"
  end

  def install
    mkdir 'build' do
      system "cmake", "..", *std_cmake_args
      system "make install"
    end
  end

end

