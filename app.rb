require 'uci'
require 'sinatra'
require 'json'

UCI = Uci.new( :engine_path => '/usr/local/bin/stockfish' )

get "/" do
	send_file File.expand_path('index.html', settings.public_folder)
end

get "/position" do
	if(UCI.ready?)
		"#{params[:callback]}(#{{:board => {:ascii => UCI.board, :fen => UCI.fenstring}}.to_json})"
	else
		"#{params[:callback]}(#{{:error => "engine not ready"}.to_json})"
	end
end