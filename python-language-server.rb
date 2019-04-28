class PythonLanguageServer < Formula
  include Language::Python::Virtualenv

  desc "Python implementation of the Language Server Protocol"
  homepage "https://github.com/palantir/python-language-server"
  url "https://files.pythonhosted.org/packages/aa/f9/d7f993a363ab7e6085dd6468999301fb31821ddbe8c14e7c43f358eb574c/python-language-server-0.26.1.tar.gz"
  sha256 "1a746a4031938df03ee546fa4760895b6a6e420a07d58161b064945add6449ef"

  option "with-rope", "Build with Rope completions and refactoring support"
  option "with-pyflakes", "Build with Pyflakes linter support"
  option "with-mccabe", "Build with McCabe complexity linter support"
  option "with-pycodestyle", "Build with pycodestyle linter support"
  option "with-pydocstyle", "Build with pydocstyle linter support"
  option "with-autopep8", "Build with autopep8 code formatter"
  option "with-yapf", "Build with YAPF code formatter"
  option "with-mypy", "Build with mypy type checker support"
  option "with-isort", "Build with isort import sort formatter support"
  option "with-black", "Build with Black code formatter"

  depends_on "python"

  if %w[autopep8 yapf black].map { |formatter| build.with? formatter }.count(true) > 1
    odie "Options --with-autopep8, --with-yapf and --with-black are mutually exclusive."
  end

  resource "future" do
    url "https://files.pythonhosted.org/packages/90/52/e20466b85000a181e1e144fd8305caf2cf475e2f9674e797b222f8105f5f/future-0.17.1.tar.gz"
    sha256 "67045236dcfd6816dc439556d009594abf643e5eb48992e36beac09c2ca659b8"
  end

  resource "jedi" do
    url "https://files.pythonhosted.org/packages/96/fb/e99fc0442f8a0fa4bf5d34162c2d98131489017f661bf8a331857844b145/jedi-0.13.3.tar.gz"
    sha256 "2bb0603e3506f708e792c7f4ad8fc2a7a9d9c2d292a358fbbd58da531695595b"
  end

  resource "parso" do
    url "https://files.pythonhosted.org/packages/79/52/70d0bb8a1f4b1475a603b4b1484bb351edda30846996fc93fe1976948fef/parso-0.4.0.tar.gz"
    sha256 "2e9574cb12e7112a87253e14e2c380ce312060269d04bd018478a3c92ea9a376"
  end

  resource "pluggy" do
    url "https://files.pythonhosted.org/packages/a7/8c/55c629849c64e665258d8976322dfdad171fa2f57117590662d8a67618a4/pluggy-0.9.0.tar.gz"
    sha256 "19ecf9ce9db2fce065a7a0586e07cfb4ac8614fe96edf628a264b1c70116cf8f"
  end

  resource "python-jsonrpc-server" do
    url "https://files.pythonhosted.org/packages/5a/b4/08d7ff047bb83f9f3549fe34c0f0db917c79020e419426a55cedcf404730/python-jsonrpc-server-0.1.2.tar.gz"
    sha256 "09b418e3b1ba9032aecc7aefdd185511dd230fb8dacf18ec195d14dfd89d9e54"
  end

  if build.with? "rope"
    resource "rope" do
      url "https://files.pythonhosted.org/packages/fc/18/df49bd6937eb20c90d69292120d6228b509e8e2d2107bd5755ec4c259de3/rope-0.14.0.tar.gz"
      sha256 "c5c5a6a87f7b1a2095fb311135e2a3d1f194f5ecb96900fdd0a9100881f48aaf"
    end
  end

  if build.with? "pyflakes"
    resource "pyflakes" do
      url "https://files.pythonhosted.org/packages/52/64/87303747635c2988fcaef18af54bfdec925b6ea3b80bcd28aaca5ba41c9e/pyflakes-2.1.1.tar.gz"
      sha256 "d976835886f8c5b31d47970ed689944a0262b5f3afa00a5a7b4dc81e5449f8a2"
    end
  end

  if build.with? "mccabe"
    resource "mccabe" do
      url "https://files.pythonhosted.org/packages/06/18/fa675aa501e11d6d6ca0ae73a101b2f3571a565e0f7d38e062eec18a91ee/mccabe-0.6.1.tar.gz"
      sha256 "dd8d182285a0fe56bace7f45b5e7d1a6ebcbf524e8f3bd87eb0f125271b8831f"
    end
  end

  if build.with?("pycodestyle") || build.with?("autopep8")
    resource "pycodestyle" do
      url "https://files.pythonhosted.org/packages/1c/d1/41294da5915f4cae7f4b388cea6c2cd0d6cd53039788635f6875dfe8c72f/pycodestyle-2.5.0.tar.gz"
      sha256 "e40a936c9a450ad81df37f549d676d127b1b66000a6c500caa2b085bc0ca976c"
    end
  end

  if build.with? "pydocstyle"
    resource "pydocstyle" do
      url "https://files.pythonhosted.org/packages/e1/e6/a0669df17a97e462915a10a7d6c567658b60eceddebf62a3fb9975c00196/pydocstyle-3.0.0.tar.gz"
      sha256 "5741c85e408f9e0ddf873611085e819b809fca90b619f5fd7f34bd4959da3dd4"
    end

    resource "six" do
      url "https://files.pythonhosted.org/packages/dd/bf/4138e7bfb757de47d1f4b6994648ec67a51efe58fa907c1e11e350cddfca/six-1.12.0.tar.gz"
      sha256 "d16a0141ec1a18405cd4ce8b4613101da75da0e9a7aec5bdd4fa804d0e0eba73"
    end

    resource "snowballstemmer" do
      url "https://files.pythonhosted.org/packages/20/6b/d2a7cb176d4d664d94a6debf52cd8dbae1f7203c8e42426daa077051d59c/snowballstemmer-1.2.1.tar.gz"
      sha256 "919f26a68b2c17a7634da993d91339e288964f93c274f1343e3bbbe2096e1128"
    end
  end

  if build.with? "autopep8"
    resource "autopep8" do
      url "https://files.pythonhosted.org/packages/5b/ba/37d30e4263c51ee5a655118ac8c331e96a4e45fd4cea876a74b87af9ffc1/autopep8-1.4.3.tar.gz"
      sha256 "33d2b5325b7e1afb4240814fe982eea3a92ebea712869bfd08b3c0393404248c"
    end
  end

  if build.with? "yapf"
    resource "yapf" do
      url "https://files.pythonhosted.org/packages/0c/ad/1dd7e729e9d707c602267ed9a6ca9b771a507862f85456bf18f5fff8f0d1/yapf-0.27.0.tar.gz"
      sha256 "34f6f80c446dcb2c44bd644c4037a2024b6645e293a4c9c4521983dd0bb247a1"
    end
  end

  if build.with? "mypy"
    resource "mypy" do
      url "https://files.pythonhosted.org/packages/ba/57/302f578708db7e059e793888238971f78b9219cd55f44148b435d71831c0/mypy-0.701.tar.gz"
      sha256 "5764f10d27b2e93c84f70af5778941b8f4aa1379b2430f85c827e0f5464e8714"
    end

    resource "mypy_extensions" do
      url "https://files.pythonhosted.org/packages/c2/92/3cc05d1206237d54db7b2565a58080a909445330b4f90a6436302a49f0f8/mypy_extensions-0.4.1.tar.gz"
      sha256 "37e0e956f41369209a3d5f34580150bcacfabaa57b33a15c0b25f4b5725e0812"
    end

    resource "pyls-mypy" do
      url "https://files.pythonhosted.org/packages/4a/89/e4317bbdb0cedf47ff2795e0dbd9101fdf7fbbae991697b48e842aca115f/pyls-mypy-0.1.6.tar.gz"
      sha256 "3fcc427e0a82673e2baf6fc71a64c89590507ef7d9b2ecdff4f5e877f8e7d394"
    end

    resource "typed-ast" do
      url "https://files.pythonhosted.org/packages/a6/4e/ff9d7b7091e2308d2cdb04a1a317e13f293f4408990ee4a52b7028657917/typed-ast-1.3.4.tar.gz"
      sha256 "68c362848d9fb71d3c3e5f43c09974a0ae319144634e7a47db62f0f2a54a7fa7"
    end
  end

  if build.with? "isort"
    resource "isort" do
      url "https://files.pythonhosted.org/packages/10/48/ca938f1b3ffeb3534da5d0dfdb8ebbdc6e95b743781b7503fb3532dd1fea/isort-4.3.17.tar.gz"
      sha256 "268067462aed7eb2a1e237fcb287852f22077de3fb07964e87e00f829eea2d1a"
    end

    resource "pyls-isort" do
      url "https://files.pythonhosted.org/packages/5e/ed/ba84b3f19b704a900e49baa09c527d1b08d694492a1e94df34e6fd00aca5/pyls-isort-0.1.1.tar.gz"
      sha256 "5bad833dab833c4e8d61172428c6ff16e4d334d986fe5dd809aa55c2e7e4fb7f"
    end
  end

  if build.with? "black"
    resource "appdirs" do
      url "https://files.pythonhosted.org/packages/48/69/d87c60746b393309ca30761f8e2b49473d43450b150cb08f3c6df5c11be5/appdirs-1.4.3.tar.gz"
      sha256 "9e5896d1372858f8dd3344faf4e5014d21849c756c8d5701f78f8a103b372d92"
    end

    resource "attrs" do
      url "https://files.pythonhosted.org/packages/cc/d9/931a24cc5394f19383fbbe3e1147a0291276afa43a0dc3ed0d6cd9fda813/attrs-19.1.0.tar.gz"
      sha256 "f0b870f674851ecbfbbbd364d6b5cbdff9dcedbc7f3f5e18a6891057f21fe399"
    end

    resource "black" do
      url "https://files.pythonhosted.org/packages/89/07/aebb10fb8f2ffbac672dfbebffa724643bc84cf012a57737a622d1dabddb/black-19.3b0.tar.gz"
      sha256 "68950ffd4d9169716bcb8719a56c07a2f4485354fec061cdd5910aa07369731c"
    end

    resource "click" do
      url "https://files.pythonhosted.org/packages/f8/5c/f60e9d8a1e77005f664b76ff8aeaee5bc05d0a91798afd7f53fc998dbc47/Click-7.0.tar.gz"
      sha256 "5b94b49521f6456670fdb30cd82a4eca9412788a93fa6dd6df72c94d5a8ff2d7"
    end

    resource "pyls-black" do
      url "https://files.pythonhosted.org/packages/e2/c9/8bc5fc9fb66773851ee4ce9b4e6daca5b572d2dd1dc6f9bfbd5eb2fa8ad9/pyls-black-0.4.4.tar.gz"
      sha256 "ba6364e92acfad97fb9b68928f90f5b266932e1da44ab0652606e4e91a5f4587"
    end

    resource "toml" do
      url "https://files.pythonhosted.org/packages/b9/19/5cbd78eac8b1783671c40e34bb0fa83133a06d340a38b55c645076d40094/toml-0.10.0.tar.gz"
      sha256 "229f81c57791a41d65e399fc06bf0848bab550a9dfd5ed66df18ce5f05e73d5c"
    end
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "Python Language Server", shell_output("#{bin}/pyls --help")
  end
end
