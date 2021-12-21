require 'erb'

class Pet
  def self.call(env)
    new(env).response.finish
  end

  def initialize(env)
    @req = Rack::Request.new(env)
    @hangry = 100
    @sleep = 100
    @happy = 100
    @drink = 0
    @params = %w[hangry sleep happy drink]
  end

  def change_params(req, arr)
    Rack::Response.new do |response|
      (0..3).each do |i|
        need = @params[i]
        if req.cookies[need.to_s].to_i <= 0
          arr[i] = 0 if (arr[i]).negative?
        elsif req.cookies[need.to_s].to_i + arr[i] > 100
          arr[i] = 100 - req.cookies[need.to_s].to_i if (arr[i]).positive?
        end
      end
      response.set_cookie(@params[0], req.cookies[(@params[0]).to_s].to_i + arr[0])
      response.set_cookie(@params[1], req.cookies[(@params[1]).to_s].to_i + arr[1])
      response.set_cookie(@params[2], req.cookies[(@params[2]).to_s].to_i + arr[2])
      response.set_cookie(@params[3], req.cookies[(@params[3]).to_s].to_i + arr[3]) if req.cookies[(@params[3]).to_s].to_i < 100

      response.redirect('/start')
    end
  end

  def response
    case @req.path
    when '/'
      Rack::Response.new(render('form.html.erb'))

    when '/initialize'
      Rack::Response.new do |response|
        response.set_cookie('hangry', @hangry)
        response.set_cookie('sleep', @sleep)
        response.set_cookie('happy', @happy)
        response.set_cookie('drink', @drink)
        response.set_cookie('name', @req.params['name'])
        response.redirect('/start')
      end

    when '/exit'
      Rack::Response.new('Game Over', 404)
      Rack::Response.new(render('end.html.erb'))

    when '/start'
      if get('drink') >= 100
        Rack::Response.new(render('perfect.html.erb'))
      elsif get('hangry') <= 0 || get('sleep') <= 0 || get('happy') <= 0
        Rack::Response.new('Game Over', 404)
        Rack::Response.new(render('end.html.erb'))
      else
        Rack::Response.new(render('index.html.erb'))
      end

    when '/change'
      arrhangry = [5, -4, -1, -5]
      arrsleep = [-4, 5, -1, -5]
      arrhappy = [-5, -5, 5, -5]
      arrbeer = [-5, -5, -5, 5]
      arralkohol = [-5, -5, -5, 10]
      return change_params(@req, arrhangry) if @req.params['hangry']
      return change_params(@req, arrsleep)  if @req.params['sleep']
      return change_params(@req, arrhappy)  if @req.params['happy']
      return change_params(@req, arrbeer) if @req.params['bear']
      return change_params(@req, arralkohol)  if @req.params['vodka']
      return change_params(@req, arralkohol)  if @req.params['wiskie']

    when '/help'
      Rack::Response.new(render('help.html.erb'))

    else
      Rack::Response.new('Not Found', 404)
    end
  end

  def render(template)
    path = File.expand_path("../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end

  def name
    name = @req.cookies['name'].delete(' ')
    name.empty? ? 'Володя' : @req.cookies['name']
  end

  def get(attr)
    @req.cookies[attr.to_s].to_i
  end
end
