namespace :rabbitmq do
  desc 'Enqueue RabbitmqWorker'
  task enqueue: :environment do
    RabbitmqWorker.perform_async
  end
end
