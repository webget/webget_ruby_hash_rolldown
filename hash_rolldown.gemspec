Gem::Specification.new do |s|

  s.name              = "webget_ruby_hash_rolldown"
  s.summary           = "WebGet.com Ruby Hash#rolldown method to aggregate values by key, e.g. subtotals"
  s.version           = "1.1.6"
  s.author            = "WebGet"
  s.email             = "webget@webget.com"
  s.homepage          = "http://webget.com/"
  s.signing_key       = '/home/webget/keys/certs/webget.com.rsa.private.key.and.certificate.pem'
  s.cert_chain        = ['/home/webget/keys/certs/webget.pem']

  s.platform          = Gem::Platform::RUBY
  s.require_path      = 'lib'
  s.has_rdoc          = true
  s.files             = ['lib/hash_rolldown.rb']
  s.test_files        = ['test/unit/hash_rolldown_test.rb']

end
