FactoryBot.define do
  factory :spot do
    name { "サンプルスポット" }
    main_visual {  Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg'), 'image/jpg') }
    infomation { "サンプルスポット、いい場所です" }
    address { "hoge県huga市hunga" }
  end
end
