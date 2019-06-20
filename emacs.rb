class Emacs < Formula
  desc "GNU Emacs text editor"
  homepage "https://www.gnu.org/software/emacs/"
  url "https://ftp.gnu.org/gnu/emacs/emacs-26.2.tar.xz"
  mirror "https://ftpmirror.gnu.org/emacs/emacs-26.2.tar.xz"
  sha256 "151ce69dbe5b809d4492ffae4a4b153b2778459de6deb26f35691e1281a9c58e"

  bottle do
    sha256 "dc49de7034346e692662d10ebacd75ea257d61ebba6f57699b855f158e4a7eda" => :mojave
    sha256 "de836e0766066201968c2dd0ef25ff4458ee532a61dc4ed9d7d8fb284b395b8d" => :high_sierra
    sha256 "6b07616447d66a8066c08591400dc8fed75d44bf51f81de2e1208635e03204c6" => :sierra
  end

  devel do
    url "https://alpha.gnu.org/gnu/emacs/pretest/windows/emacs-27/emacs-27.0.50_2019-06-08.tar.gz"
    sha256 "0ecdb0fb05a30fe6356fb7ee9ce34ff86fea7f2751b90b13e74ccd209fa19c1f"

    version "27.0.50"
  end

  head do
    url "https://github.com/emacs-mirror/emacs.git"

    depends_on "autoconf" => :build
    depends_on "gnu-sed" => :build
    depends_on "texinfo" => :build
  end

  option "with-cocoa", "Build a Cocoa version of emacs"
  option "with-ctags", "Don't remove the ctags executable that emacs provides"
  option "without-libxml2", "Don't build with libxml2 support"
  option "with-modules", "Compile with dynamic modules support"
  option "with-multicolor-fonts", "Compile with multicolor fonts support"
  option "with-imagemagick", "Compile with ImageMagick support"

  depends_on "pkg-config" => :build
  depends_on "gnutls"
  depends_on "dbus" => :optional
  depends_on "librsvg" => :optional
  depends_on "mailutils" => :optional

  if build.with? "multicolor-fonts"
    stable do
      patch do
        url "https://gist.githubusercontent.com/ylectric/e68cb72a0b2f134ad4ce29cd1ab40eeb/raw/d228500d9b924ebb1e6c4937d29be4ee5805757c/0001-Bring-multicolor-fonts-back-on-macOS.patch"
        sha256 "94d5f6ba90c754a0a5178be7b684773e04d7f7818559e819d7ed2671d68c86a2"
      end
    end
  end

  if build.with? "imagemagick"
    # Emacs 26 does not support ImageMagick 7:
    # Reported on 2017-03-04: https://debbugs.gnu.org/cgi/bugreport.cgi?bug=25967
    stable { depends_on "imagemagick@6" }
    devel { depends_on "imagemagick" }
    head { depends_on "imagemagick" }
  end

  def install
    args = %W[
      --disable-dependency-tracking
      --disable-silent-rules
      --enable-locallisppath=#{HOMEBREW_PREFIX}/share/emacs/site-lisp
      --infodir=#{info}/emacs
      --prefix=#{prefix}
      --with-gnutls
      --without-x
    ]

    if build.with? "libxml2"
      args << "--with-xml2"
    else
      args << "--without-xml2"
    end

    if build.with? "dbus"
      args << "--with-dbus"
    else
      args << "--without-dbus"
    end

    # Note that if ./configure is passed --with-imagemagick but can't find the
    # library it does not fail but imagemagick support will not be available.
    # See: https://debbugs.gnu.org/cgi/bugreport.cgi?bug=24455
    if build.with? "imagemagick"
      args << "--with-imagemagick"
    else
      args << "--without-imagemagick"
    end

    args << "--with-modules" if build.with? "modules"
    args << "--with-rsvg" if build.with? "librsvg"
    args << "--without-pop" if build.with? "mailutils"

    if build.head?
      ENV.prepend_path "PATH", Formula["gnu-sed"].opt_libexec/"gnubin"
      system "./autogen.sh"
    end

    if build.with? "cocoa"
      args << "--with-ns" << "--disable-ns-self-contained"
    else
      args << "--without-ns"
    end

    system "./configure", *args
    system "make"
    system "make", "install"

    if build.with? "cocoa"
      prefix.install "nextstep/Emacs.app"

      # Replace the symlink with one that avoids starting Cocoa.
      (bin/"emacs").unlink # Kill the existing symlink
      (bin/"emacs").write <<~EOS
        #!/bin/bash
        exec #{prefix}/Emacs.app/Contents/MacOS/Emacs "$@"
      EOS
    end

    # Follow MacPorts and don't install ctags from Emacs. This allows Vim
    # and Emacs and ctags to play together without violence.
    if build.without? "ctags"
      (bin/"ctags").unlink
      (man1/"ctags.1.gz").unlink
    end
  end

  plist_options :manual => "emacs"

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>KeepAlive</key>
      <true/>
      <key>Label</key>
      <string>#{plist_name}</string>
      <key>ProgramArguments</key>
      <array>
        <string>#{opt_bin}/emacs</string>
        <string>--fg-daemon</string>
      </array>
      <key>RunAtLoad</key>
      <true/>
    </dict>
    </plist>
  EOS
  end

  test do
    assert_equal "4", shell_output("#{bin}/emacs --batch --eval=\"(print (+ 2 2))\"").strip
  end
end
