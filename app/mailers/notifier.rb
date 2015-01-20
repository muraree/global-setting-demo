class Notifier < ActionMailer::Base
  default from: "from@example.com"

  def test_message(recipient, message)
    @message = message
    mail(:to => recipient, :subject => "Test Global setting")
  end

end
