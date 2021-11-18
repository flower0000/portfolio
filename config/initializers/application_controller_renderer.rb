# Be sure to restart your server when you modify this file.

# ActiveSupport::Reloader.to_prepare do
#   ApplicationController.renderer.defaults.merge!(
#     http_host: 'example.org',
#     https: false
#   )
# end

#Refile用Secletkey。これが無いと画像投稿できない
Refile.secret_key = 'fae41a9b6fb6655f6215255858565774741015613bf622287b6e33eebf98205b2ee24e0865f8187f25c83ddb55457f6b42ca85b203b9b76590f6280c000e756b'
