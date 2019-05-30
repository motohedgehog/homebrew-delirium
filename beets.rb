class Beets < Formula
  include Language::Python::Virtualenv

  desc "Music library manager and MusicBrainz tagger"
  homepage "http://beets.io/"
  url "https://files.pythonhosted.org/packages/0b/94/f3a4a9e4b622c725b4ed1fb3503cccac9de7b91644648e8fb8bb9ed7b322/beets-1.4.8.tar.gz"
  sha256 "1a62195c029405f4c6b6b72842347283994af5680cce04c340929120b2c2c4a3"
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
    url "https://files.pythonhosted.org/packages/69/9f/ae6f6ad509725b71d45bb408953c850da7a2ecc3dbdad4063a825702ba29/jellyfish-0.7.1.tar.gz"
    sha256 "79a5640bb47120596c91b9030ed3164cc5a3d0bb6b15779bb82c3c21f8efa1c1"
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
    url "https://files.pythonhosted.org/packages/9f/2c/9417b5c774792634834e730932745bc09a7d36754ca00acf1ccd1ac2594d/PyYAML-5.1.tar.gz"
    sha256 "436bc774ecf7c103814098159fbb84c2715d25980175292c648f2da143909f95"
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
  need_requests = %w[absubmit beatport chroma embyupdate fetchart lyrics thumbnails]
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
      url "https://files.pythonhosted.org/packages/52/2c/514e4ac25da2b08ca5a464c50463682126385c4272c18193876e91f4bc38/requests-2.21.0.tar.gz"
      sha256 "502a824f31acdacb3a35b6690b5fbf0bc41d63a24a45c4004352b0242707598e"
    end

    resource "urllib3" do
      url "https://files.pythonhosted.org/packages/fd/fa/b21f4f03176463a6cccdb612a5ff71b927e5224e83483012747c12fc5d62/urllib3-1.24.2.tar.gz"
      sha256 "9a247273df709c4fedb38c711e44292304f73f39ab01beda9f6b9fc375669ac3"
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
      url "https://files.pythonhosted.org/packages/e6/33/46ada16d76548c2dfbcb8d06b3481df7ecd08239402b2e7f0086bffaed22/audioread-2.1.7.tar.gz"
      sha256 "f488f9e6fa1ccb09289e3db194639bc6388168b27ef27b2c62380aa1d35a3abe"
    end

    resource "pyacoustid" do
      url "https://files.pythonhosted.org/packages/db/bc/c797db70d54d52f753eb3cc301937a405d0a7507008ee0eead8251a5349f/pyacoustid-1.1.6.tar.gz"
      sha256 "762ae09cf18a715155466be23bea4a6e4fdb8fb26bc80e091d227e2150fd7469"
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
      url "https://files.pythonhosted.org/packages/67/33/29779c5aaeac796679a37bf798b3c2adbfaae7dbf13e966b0ab9c3aa06c0/httplib2-0.12.3.tar.gz"
      sha256 "a18121c7c72a56689efbf1aef990139ad940fee1e64c6f2458831736cd593600"
    end

    resource "lxml" do
      url "https://files.pythonhosted.org/packages/7d/29/174d70f303016c58bd790c6c86e6e86a9d18239fac314d55a9b7be501943/lxml-4.3.3.tar.gz"
      sha256 "4a03dd682f8e35a10234904e0b9508d705ff98cf962c5851ed052e9340df3d90"
    end

    resource "MechanicalSoup" do
      url "https://files.pythonhosted.org/packages/58/96/5a3b6814d4d7a079b61295d9701be0515eab25a5219257f098dca4282502/MechanicalSoup-0.11.0.tar.gz"
      sha256 "2712ec0f3087cbc719c6c3dfb317a05800ff14fcdbfa67a2f9f6e07226e7a94c"
    end

    resource "mock" do
      url "https://files.pythonhosted.org/packages/0c/53/014354fc93c591ccc4abff12c473ad565a2eb24dcd82490fae33dbf2539f/mock-2.0.0.tar.gz"
      sha256 "b158b6df76edd239b8208d481dc46b6afd45a846b7812ff0ce58971cf5bc8bba"
    end

    resource "oauth2client" do
      url "https://files.pythonhosted.org/packages/a6/7b/17244b1083e8e604bf154cf9b716aecd6388acd656dd01893d0d244c94d9/oauth2client-4.1.3.tar.gz"
      sha256 "d486741e451287f69568a4d26d70d9acd73a2bbfa275746c535b4209891cccc6"
    end

    resource "pbr" do
      url "https://files.pythonhosted.org/packages/11/3d/3b5bbf398535d78a8cd7cf01441a745dedda5ca69f82658f2c7672bcdcce/pbr-5.2.0.tar.gz"
      sha256 "d950c64aeea5456bbd147468382a5bb77fe692c13c9f00f0219814ce5b642755"
    end

    resource "proboscis" do
      url "https://files.pythonhosted.org/packages/3c/c8/c187818ab8d0faecdc3c16c1e0b2e522f3b38570f0fb91dcae21662019d0/proboscis-1.2.6.0.tar.gz"
      sha256 "b822b243a7c82030fce0de97bdc432345941306d2c24ef227ca561dd019cd238"
    end

    resource "protobuf" do
      url "https://files.pythonhosted.org/packages/cf/72/8c1ed9148ded82adbb76c30f958c6d456a2abc08f092b62a586bdf973b80/protobuf-3.7.1.tar.gz"
      sha256 "21e395d7959551e759d604940a115c51c6347d90a475c9baf471a1a86b5604a9"
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
      url "https://files.pythonhosted.org/packages/05/86/92b303bc4ed00451401e99e90003d5361fb054b9af9af2490b1b44caeaef/pycryptodomex-3.8.1.tar.gz"
      sha256 "9251b3f6254d4274caa21b79bd432bf07afa3567c6f02f11861659fb6245139a"
    end

    resource "python-dateutil" do
      url "https://files.pythonhosted.org/packages/ad/99/5b2e99737edeb28c71bcbec5b5dda19d0d9ef3ca3e92e3e925e7c0bb364c/python-dateutil-2.8.0.tar.gz"
      sha256 "c89805f6f4d64db21ed966fda138f8a5ed7a4fdbc1a8ee329ce1b74e3c74da9e"
    end

    resource "rsa" do
      url "https://files.pythonhosted.org/packages/cb/d0/8f99b91432a60ca4b1cd478fd0bdf28c1901c58e3a9f14f4ba3dba86b57f/rsa-4.0.tar.gz"
      sha256 "1a836406405730121ae9823e19c6e806c62bbad73f890574fff50efa4122c487"
    end

    resource "urllib3" do
      url "https://files.pythonhosted.org/packages/9a/8b/ea6d2beb2da6e331e9857d0a60b79ed4f72dcbc4e2c7f2d2521b0480fda2/urllib3-1.25.2.tar.gz"
      sha256 "a53063d8b9210a7bdec15e7b272776b9d42b2fd6816401a0d43006ad2f9902db"
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
