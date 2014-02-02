define
  load: (name, req, onload, options) ->
    name = "modules/#{name}"
    # se è modules/tmagent, esempio, deve leggere bootstrap
    splitted = name.split '/'
    switch splitted.length
      when 2
        name+= '/bootstrap'
      else
        splitted.splice 2, 0, 'controllers'
        name = splitted.join '/'
    req [name], (value) ->
      onload value
