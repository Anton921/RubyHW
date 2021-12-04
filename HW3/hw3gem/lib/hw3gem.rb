require 'sanitize'

module Hw3Gem
  def makeHTML(stats, hp, info)
    file = File.open('index.html', 'w')

    file.puts("
    <!DOCTYPE html>
    <head>
        <title> Your pet </title>
    </head>
    <body>
        <h1>Показники</h1>
        <hr/>
        <h3>")

    if stats >= 161 && hp == 1
      file.puts('<h1>😀</h1>')
    elsif stats < 161 && hp == 1
      file.puts('<h1>😐</h1>')
    else
      file.puts('<h1>💀</h1>')
    end

    file.puts(info)
    file.write("
      </h3>
    </body>
    </html>
      ")

    Sanitize.document(file,
      :allow_doctype => true,
      :elements => ['html']
    )

    file.close
  end
end
