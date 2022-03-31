import ipywidgets as ipw

class DropDown():
    """Helper class for dropdown widgets.
    """
    def __init__(self,
                 callback,
                 options,
                 value,
                 description,
                 dict_id = '',
                 description_width='150px',
                 layout_width='300px'):
    
        def on_value_change(change):
            callback(change['new'])
            
        self._dict_id = dict_id
        self._dropdown = ipw.Dropdown(options=options,
                                      value=value,
                                      description=description,
                                      style={'description_width': description_width},
                                      layout = {'width': layout_width},)
        self._dropdown.observe(on_value_change, names='value')
        
    @property
    def value(self):
        return self._dropdown.value
    
    @value.setter
    def value(self, value):
        self._dropdown.value = value
        
    @property
    def description(self):
        return self._dropdown.description
    
    @description.setter
    def description(self, value):
        self._dropdown.description = value
        
    @property
    def options(self):
        return self._dropdown.options
    
    @options.setter
    def options(self, value):
        self._dropdown.options = value
        
    def get_widget(self):
        return self._dropdown
    