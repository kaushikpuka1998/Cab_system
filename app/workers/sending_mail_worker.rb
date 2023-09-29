class SendingMailWorker
  include Sidekiq::Worker

  def perform(*args)
    puts "You have successfully done your payment and Transaction id is #{args[0]}"
  end
end
