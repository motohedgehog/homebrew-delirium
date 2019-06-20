class Beets < Formula
  include Language::Python::Virtualenv

  desc "Music library manager and MusicBrainz tagger"
  homepage "https://beets.readthedocs.io"
  url "https://files.pythonhosted.org/packages/3a/a8/6ac61e3ca16da6278c681381ed392bc02e6d410ea3ff3a4af34de1379b38/beets-1.4.9.tar.gz"
  sha256 "d29b432cab0c80947b5229f548762948c4dd4a430e5d02760bfeb95da3cc8054"
  head "https://github.com/beetbox/beets.git"

  option "with-absubmit", "Build with AcousticBrainz Submit plugin support"
  option "with-beatport", "Build with Beatport plugin support"
  option "with-chroma", "Build with Chromaprint plugin support"
  option "with-embyupdate", "Build with EmbyUpdate plugin support"
  option "with-fetchart", "Build with FetchArt plugin support"
  option "with-gmusic", "Build with Google Music plugin support"
  option "with-kodiupdate", "Build with KodiUpdate plugin support"
  option "with-lastfm", "Build with Last.fm plugins support"
  option "with-lyrics", "Build with Lyrics plugin support"
  option "with-mpdstats", "Build with MPDStats plugin support"
  option "with-plexupdate", "Build with PlexUpdate plugin support"
  option "with-sonosupdate", "Build with SonosUpdate plugin support"
  option "with-thumbnails", "Build with Thumbnails plugin support"

  depends_on "python"

  resource "jellyfish" do
    url "https://files.pythonhosted.org/packages/3f/80/bcacc7affb47be7279d7d35225e1a932416ed051b315a7f9df20acf04cbe/jellyfish-0.7.2.tar.gz"
    sha256 "cb09c50d7e2bb7b926fc7654762bc81f9c629e0c92ae7137bf22b34f39515286"
  end

  resource "munkres" do
    url "https://files.pythonhosted.org/packages/b1/af/366c2b607b6994aa542a9eefd7d4dc1b0abadba396ed84bbbbc17d8d257e/munkres-1.1.2.tar.gz"
    sha256 "81e9ced40c3d0ffc48be4b6da5cfdfaa49041faaaba8075b159974ec47926aea"
  end

  resource "musicbrainzngs" do
    url "https://files.pythonhosted.org/packages/63/cc/67ad422295750e2b9ee57c27370dc85d5b85af2454afe7077df6b93d5938/musicbrainzngs-0.6.tar.gz"
    sha256 "28ef261a421dffde0a25281dab1ab214e1b407eec568cd05a53e73256f56adb5"
  end

  resource "mutagen" do
    url "https://files.pythonhosted.org/packages/30/4c/5ad1a6e1ccbcfaf6462db727989c302d9d721beedd9b09c11e6f0c7065b0/mutagen-1.42.0.tar.gz"
    sha256 "bb61e2456f59a9a4a259fbc08def6d01ba45a42da8eeaa97d00633b0ec5de71c"
  end

  resource "PyYAML" do
    url "https://files.pythonhosted.org/packages/a3/65/837fefac7475963d1eccf4aa684c23b95aa6c1d033a2c5965ccb11e22623/PyYAML-5.1.1.tar.gz"
    sha256 "b4bb4d3f5e232425e25dda21c070ce05168a786ac9eda43768ab7f3ac2770955"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/dd/bf/4138e7bfb757de47d1f4b6994648ec67a51efe58fa907c1e11e350cddfca/six-1.12.0.tar.gz"
    sha256 "d16a0141ec1a18405cd4ce8b4613101da75da0e9a7aec5bdd4fa804d0e0eba73"
  end

  resource "Unidecode" do
    url "https://files.pythonhosted.org/packages/9b/d8/c1b658ed7ff6e63a745eda483d7d917eb63a79c59fcb422469b85ff47e94/Unidecode-1.0.23.tar.gz"
    sha256 "8b85354be8fd0c0e10adbf0675f6dc2310e56fda43fa8fe049123b6c475e52fb"
  end

  # Plugins that need `requests' module
  need_requests = %w[absubmit beatport chroma embyupdate fetchart gmusic lyrics thumbnails]
  # Plugins that need `beautifulsoup4' module
  need_beautifulsoup = %w[gmusic lyrics]

  if need_requests.map! { |opt| build.with? opt }.any?
    resource "certifi" do
      url "https://files.pythonhosted.org/packages/06/b8/d1ea38513c22e8c906275d135818fee16ad8495985956a9b7e2bb21942a1/certifi-2019.3.9.tar.gz"
      sha256 "b26104d6835d1f5e49452a26eb2ff87fe7090b89dfcaee5ea2212697e1e1d7ae"
    end

    resource "chardet" do
      url "https://files.pythonhosted.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz"
      sha256 "84ab92ed1c4d4f16916e05906b6b75a6c0fb5db821cc65e70cbd64a3e2a5eaae"
    end

    resource "idna" do
      url "https://files.pythonhosted.org/packages/ad/13/eb56951b6f7950cadb579ca166e448ba77f9d24efc03edd7e55fa57d04b7/idna-2.8.tar.gz"
      sha256 "c357b3f628cf53ae2c4c05627ecc484553142ca23264e593d327bcde5e9c3407"
    end

    resource "requests" do
      url "https://files.pythonhosted.org/packages/01/62/ddcf76d1d19885e8579acb1b1df26a852b03472c0e46d2b959a714c90608/requests-2.22.0.tar.gz"
      sha256 "11e007a8a2aa0323f5a921e9e6a2d7e4e67d9877e85773fba9ba6419025cbeb4"
    end

    resource "urllib3" do
      url "https://files.pythonhosted.org/packages/4c/13/2386233f7ee40aa8444b47f7463338f3cbdf00c316627558784e3f542f07/urllib3-1.25.3.tar.gz"
      sha256 "dbe59173209418ae49d485b87d1681aefa36252ee85884c31346debd19463232"
    end
  end

  if need_beautifulsoup.map! { |opt| build.with? opt }.any?
    resource "beautifulsoup4" do
      url "https://files.pythonhosted.org/packages/80/f2/f6aca7f1b209bb9a7ef069d68813b091c8c3620642b568dac4eb0e507748/beautifulsoup4-4.7.1.tar.gz"
      sha256 "945065979fb8529dd2f37dbb58f00b661bdbcbebf954f93b32fdf5263ef35348"
    end

    resource "soupsieve" do
      url "https://files.pythonhosted.org/packages/fb/9e/2e236603b058daa6820193d4d95f4dcfbbbd0d3c709bec8c6ef1b1902501/soupsieve-1.9.1.tar.gz"
      sha256 "b20eff5e564529711544066d7dc0f7661df41232ae263619dede5059799cdfca"
    end
  end

  if build.with? "beatport"
    resource "oauthlib" do
      url "https://files.pythonhosted.org/packages/ec/90/882f43232719f2ebfbdbe8b7c57fc9642a25b3df30cb70a3701ea22622de/oauthlib-3.0.1.tar.gz"
      sha256 "0ce32c5d989a1827e3f1148f98b9085ed2370fc939bf524c9c851d8714797298"
    end

    resource "requests-oauthlib" do
      url "https://files.pythonhosted.org/packages/de/a2/f55312dfe2f7a344d0d4044fdfae12ac8a24169dc668bd55f72b27090c32/requests-oauthlib-1.2.0.tar.gz"
      sha256 "bd6533330e8748e94bf0b214775fed487d309b8b8fe823dc45641ebcd9a32f57"
    end
  end

  if build.with? "chroma"
    resource "audioread" do
      url "https://files.pythonhosted.org/packages/2e/0b/940ea7861e0e9049f09dcfd72a90c9ae55f697c17c299a323f0148f913d2/audioread-2.1.8.tar.gz"
      sha256 "073904fabc842881e07bd3e4a5776623535562f70b1655b635d22886168dd168"
    end

    resource "pyacoustid" do
      url "https://files.pythonhosted.org/packages/35/76/2e51b687a9967a00e948b55b076809edc0fef8a13023309ce9ab59c28b8e/pyacoustid-1.1.7.tar.gz"
      sha256 "07394a8ae84625a0a6fef2d891d19687ff59cd955caaf48097da2826043356fd"
    end
  end

  if build.with? "discogs"
    resource "discogs-client" do
      url "https://files.pythonhosted.org/packages/80/73/4f2e9180b9b2d2033d11c343f4d475452bed2512174c8691289e42d4720c/discogs-client-2.2.2.tar.gz"
      sha256 "aeae43fb9281e27c580d1bcd484e6c309f4f3a05af3908016ee3363786ef43d8"
    end
  end

  if build.with? "gmusic"
    resource "appdirs" do
      url "https://files.pythonhosted.org/packages/48/69/d87c60746b393309ca30761f8e2b49473d43450b150cb08f3c6df5c11be5/appdirs-1.4.3.tar.gz"
      sha256 "9e5896d1372858f8dd3344faf4e5014d21849c756c8d5701f78f8a103b372d92"
    end

    resource "decorator" do
      url "https://files.pythonhosted.org/packages/ba/19/1119fe7b1e49b9c8a9f154c930060f37074ea2e8f9f6558efc2eeaa417a2/decorator-4.4.0.tar.gz"
      sha256 "86156361c50488b84a3f148056ea716ca587df2f0de1d34750d35c21312725de"
    end

    resource "future" do
      url "https://files.pythonhosted.org/packages/90/52/e20466b85000a181e1e144fd8305caf2cf475e2f9674e797b222f8105f5f/future-0.17.1.tar.gz"
      sha256 "67045236dcfd6816dc439556d009594abf643e5eb48992e36beac09c2ca659b8"
    end

    resource "gmusicapi" do
      url "https://files.pythonhosted.org/packages/4e/40/8180f6b3029e79aeb7e36b9665ea8447127a078bfbada9579c875b037da2/gmusicapi-12.1.0.tar.gz"
      sha256 "808d55d8998b8c8632fc4a746a41e7f0437b84925c4224d68ed9e060f3137582"
    end

    resource "gpsoauth" do
      url "https://files.pythonhosted.org/packages/96/a1/2b366c602ee081def4dd80624581dfa8eb23d20c5a51f8a2591c40fa8d41/gpsoauth-0.4.1.tar.gz"
      sha256 "1c3f45824d45ac3d06b9d9a0c0eccafe1052505d31ac9a698aef8b00fb0dfc37"
    end

    resource "httplib2" do
      url "https://files.pythonhosted.org/packages/5c/f3/7206894743389a4f727b73e6df4da60c9ee3cbef3f5afd82814592eafa8b/httplib2-0.13.0.tar.gz"
      sha256 "d1146939d270f1f1eb8cbf8f5aa72ff37d897faccca448582bb1e180aeb4c6b2"
    end

    resource "lxml" do
      url "https://files.pythonhosted.org/packages/da/b5/d3e0d22649c63e92cb0902847da9ae155c1e801178ab5d272308f35f726e/lxml-4.3.4.tar.gz"
      sha256 "3ce1c49d4b4a7bc75fb12acb3a6247bb7a91fe420542e6d671ba9187d12a12c2"
    end

    resource "MechanicalSoup" do
      url "https://files.pythonhosted.org/packages/58/96/5a3b6814d4d7a079b61295d9701be0515eab25a5219257f098dca4282502/MechanicalSoup-0.11.0.tar.gz"
      sha256 "2712ec0f3087cbc719c6c3dfb317a05800ff14fcdbfa67a2f9f6e07226e7a94c"
    end

    resource "mock" do
      url "https://files.pythonhosted.org/packages/2e/ab/4fe657d78b270aa6a32f027849513b829b41b0f28d9d8d7f8c3d29ea559a/mock-3.0.5.tar.gz"
      sha256 "83657d894c90d5681d62155c82bda9c1187827525880eda8ff5df4ec813437c3"
    end

    resource "oauth2client" do
      url "https://files.pythonhosted.org/packages/a6/7b/17244b1083e8e604bf154cf9b716aecd6388acd656dd01893d0d244c94d9/oauth2client-4.1.3.tar.gz"
      sha256 "d486741e451287f69568a4d26d70d9acd73a2bbfa275746c535b4209891cccc6"
    end

    resource "pbr" do
      url "https://files.pythonhosted.org/packages/fe/9c/07e2c59b987f7cb9e5877151667a27ab00f11275d9d8951c2b29dd323b01/pbr-5.3.0.tar.gz"
      sha256 "9fb1c3371344cd617eb073c6c00872e9b0e5a7fefed6cd29f327a1b26ab5c498"
    end

    resource "proboscis" do
      url "https://files.pythonhosted.org/packages/3c/c8/c187818ab8d0faecdc3c16c1e0b2e522f3b38570f0fb91dcae21662019d0/proboscis-1.2.6.0.tar.gz"
      sha256 "b822b243a7c82030fce0de97bdc432345941306d2c24ef227ca561dd019cd238"
    end

    resource "protobuf" do
      url "https://files.pythonhosted.org/packages/65/95/8fe278158433a9bc34723f9ecbdee3097fb6baefaca932ec0331a9f80244/protobuf-3.8.0.tar.gz"
      sha256 "8c61cc8a76e9d381c665aecc5105fa0f1878cf7db8b5cd17202603bcb386d0fc"
    end

    resource "pyasn1" do
      url "https://files.pythonhosted.org/packages/46/60/b7e32f6ff481b8a1f6c8f02b0fd9b693d1c92ddd2efb038ec050d99a7245/pyasn1-0.4.5.tar.gz"
      sha256 "da2420fe13a9452d8ae97a0e478adde1dee153b11ba832a95b223a2ba01c10f7"
    end

    resource "pyasn1-modules" do
      url "https://files.pythonhosted.org/packages/ec/0b/69620cb04a016e4a1e8e352e8a42717862129b574b3479adb2358a1f12f7/pyasn1-modules-0.2.5.tar.gz"
      sha256 "ef721f68f7951fab9b0404d42590f479e30d9005daccb1699b0a51bb4177db96"
    end

    resource "pycryptodomex" do
      url "https://files.pythonhosted.org/packages/8d/44/e79bc9f023ac193f265fd1cec27cd161e22ffacb2950220b09af0fe0b32a/pycryptodomex-3.8.2.tar.gz"
      sha256 "e50b15af6bbdc6b5f8bd70d818cb846b15303ffa6c371b799db561a403a21607"
    end

    resource "python-dateutil" do
      url "https://files.pythonhosted.org/packages/ad/99/5b2e99737edeb28c71bcbec5b5dda19d0d9ef3ca3e92e3e925e7c0bb364c/python-dateutil-2.8.0.tar.gz"
      sha256 "c89805f6f4d64db21ed966fda138f8a5ed7a4fdbc1a8ee329ce1b74e3c74da9e"
    end

    resource "rsa" do
      url "https://files.pythonhosted.org/packages/cb/d0/8f99b91432a60ca4b1cd478fd0bdf28c1901c58e3a9f14f4ba3dba86b57f/rsa-4.0.tar.gz"
      sha256 "1a836406405730121ae9823e19c6e806c62bbad73f890574fff50efa4122c487"
    end

    resource "validictory" do
      url "https://files.pythonhosted.org/packages/c9/c6/59d4273279df9f942f34cf45b9031c109a51d8e5682ca7975a9e1ae71080/validictory-1.1.2.tar.gz"
      sha256 "3a87b84658592f75f37d6bab77ac223774c9989dc7349c8aad19a424770835ba"
    end
  end

  if build.with? "lastgenre"
    resource "pylast" do
      url "https://files.pythonhosted.org/packages/c1/3b/05414f6c406d571604a6ee19530ba0a0bd35a8c2cae158ffac0caaa74179/pylast-3.1.0.tar.gz"
      sha256 "7eb58682beccc0052c3284aba64a9a6454b5e89706f789ebeb2403dc1045606a"
    end
  end

  if build.with? "lyrics"
    resource "langdetect" do
      url "https://files.pythonhosted.org/packages/59/59/4bc44158a767a6d66de18c4136c8aa90491d56cc951c10b74dd1e13213c9/langdetect-1.0.7.zip"
      sha256 "91a170d5f0ade380db809b3ba67f08e95fe6c6c8641f96d67a51ff7e98a9bf30"
    end
  end

  if build.with? "mpdstats"
    resource "python-mpd2" do
      url "https://files.pythonhosted.org/packages/a8/12/63bdb3ee8e0bd7dd0476e79f0f130c1caeff408a1b1e5531ae9891805f7d/python-mpd2-1.0.0.tar.bz2"
      sha256 "772fa6861273bb9f363a97987c2c45ca3965eb770570f1f02566efec9c89fc5f"
    end
  end

  if build.with? "sonosupdate"
    resource "soco" do
      url "https://files.pythonhosted.org/packages/75/f0/17abb9f43e65359fd7fb180979127d04a4035c80f420f42ca1587dbb97f9/soco-0.17.tar.gz"
      sha256 "48eea75738547f533ba8719c5c46fa9f920d7f9419884b87d21bddf24b34fc97"
    end

    resource "xmltodict" do
      url "https://files.pythonhosted.org/packages/58/40/0d783e14112e064127063fbf5d1fe1351723e5dfe9d6daad346a305f6c49/xmltodict-0.12.0.tar.gz"
      sha256 "50d8c638ed7ecb88d90561beedbf720c9b4e851a9fa6c47ebd64e99d166d8a21"
    end
  end

  if build.with? "thumbnails"
    resource "pyxdg" do
      url "https://files.pythonhosted.org/packages/47/6e/311d5f22e2b76381719b5d0c6e9dc39cd33999adae67db71d7279a6d70f4/pyxdg-0.26.tar.gz"
      sha256 "fe2928d3f532ed32b39c32a482b54136fe766d19936afc96c8f00645f9da1a06"
    end

    resource "pathlib" do
      url "https://files.pythonhosted.org/packages/ac/aa/9b065a76b9af472437a0059f77e8f962fe350438b927cb80184c32f075eb/pathlib-1.0.1.tar.gz"
      sha256 "6940718dfc3eff4258203ad5021090933e5c04707d5ca8cc9e73c94a7894ea9f"
    end
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "beets version #{version}", shell_output("#{bin}/beet version")
    assert_match "Total time:", shell_output("#{bin}/beet stats")
  end
end
