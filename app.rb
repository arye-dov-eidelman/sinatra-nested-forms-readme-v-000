require_relative 'config/environment'

class App < Sinatra::Base

  get '/' do
    erb :newstudent
  end

  post '/student' do
    puts params
    @student = Student.new(params[:student])
   
    params[:student][:courses].each do |details|
      Course.new(details)
    end
   
    @courses = Course.all
   
    erb :student
  end

end
