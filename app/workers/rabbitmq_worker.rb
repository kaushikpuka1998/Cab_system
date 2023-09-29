class RabbitmqWorker
  include Sidekiq::Worker
  # sidekiq_options queue: :rabbitmq, retry: true, cron: '* * * * *'

  def perform
    # Connect to RabbitMQ
    puts "HELLO"
    conn = Bunny.new(ENV['RABBITMQ_URL'])
    conn.start

    # Create a channel and a queue
    ch = conn.create_channel
    q = ch.queue('hit_logs')

    # Log a hit on RabbitMQ
    q.publish("Hit at #{Time.now}")

    q.subscribe(block: true) do |delivery_info, _properties, body|
      # Process the message
      puts "Received message: #{body}"

      # Acknowledge the message to remove it from the queue
      ch.ack(delivery_info.delivery_tag)
    end
    ch.close if ch.open?
    conn.close

    Rails.logger.info('RabbitMQ worker executed successfully')
    puts "RabbitMQ worker executed successfully"
    # how add duplicate checking function here
  end
end
