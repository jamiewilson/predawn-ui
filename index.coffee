module.exports =
  config:
    colourlessIcons:
      type: 'boolean'
      default: true
      description: "Tick to force colourless tab icons"
  activate: (state) ->
    varKey = 'predawn-ui.colourlessIcons'
    self = @
    atom.config.onDidChange varKey, ({newValue, oldValue}) ->
      self.setColoured(newValue)
    @setColoured(atom.config.get(varKey))
  setColoured: (enable) ->
    tabBar = document.querySelector('.tab-bar')
    if !enable
      tabBar.className = tabBar.className.replace(/\scolourless-icons/, '')
    else
      tabBar.className = tabBar.className + " " + 'colourless-icons'
