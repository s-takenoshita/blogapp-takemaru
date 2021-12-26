namespace :notification do
  desc '利用者にメールを送る'

  # task send_mails_from_admin: :environment do
  #   NotificationFromAdminJob.perform_later('rake task test')
  # end

  task :send_mails_from_admin, ['msg'] => :environment do |task, args|
    msg = args['msg']
    if msg.present?
      NotificationFromAdminJob.perform_later(msg)
    else
      puts 'メールを送信できませんでした。ex: rails notification:send_mails_from_admin\[こんにちは\]'
    end
  end
end
