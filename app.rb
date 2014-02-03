require 'uci'
require 'sinatra'
require 'json'

UCI = Uci.new( :engine_path => '/usr/local/bin/stockfish',

				:
 )

get "/" do
	@fenstring = params[:f]
	erb :index
end

get "/position" do
	if(UCI.ready?)
		"#{params[:callback]}(#{{:board => {:ascii => UCI.board, :fen => UCI.fenstring}}.to_json})"
	else
		"#{params[:callback]}(#{{:error => "engine not ready"}.to_json})"
	end
end