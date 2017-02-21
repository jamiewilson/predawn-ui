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

    if atom.config.get('core').useCustomTitleBar
      @adjustModalPos()

  setColoured: (enable) ->
    tabBar = document.querySelector('.tab-bar')
    if !enable
      tabBar.className = tabBar.className.replace(/\scolourless-icons/, '')
    else
      tabBar.className = tabBar.className + " " + 'colourless-icons'

  adjustModalPos: () ->
    titleBar = document.querySelector('.title-bar')
    titleBarHeight = titleBar.offsetHeight

    styleTag = document.createElement('style');
    styleTag.textContent = """
    .overlay.from-top {
      top: #{titleBarHeight}px;
    }
    """

    atomStyles = document.querySelector('atom-styles')
    atomStyles.appendChild(styleTag);
