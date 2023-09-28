class RabbitmqWorker
  include Sidekiq::Worker
  sidekiq_options queue: :rabbitmq, retry: false

  def perform
    # Connect to RabbitMQ
    conn = Bunny.new(ENV['RABBITMQ_URL'])
    conn.start

    # Create a channel and a queue
    ch = conn.create_channel
    q = ch.queue('hit_logs')

    # Log a hit on RabbitMQ
    q.publish("Hit at #{Time.now}")

    # Close the connection
    conn.close
  end
end
