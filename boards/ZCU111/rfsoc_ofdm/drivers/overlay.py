__author1__ = 'Lewis McLaughlin'
__author2__ = 'Douglas Allan'
__organisation__ = 'The University of Strathclyde'
__date__ = '26th February 2021'
__version_name__ = ''
__version_number__ = '0.2'
__channels__ = 'Single-Channel'
__board__ = 'ZCU111'
__release__ = 'development'
__info__ = 'PYNQ on RFSoC: OFDM Transmit and Receive'
__support__ = '<a href="https://github.com/strath-sdr/rfsoc_ofdm" target="_blank" rel="noopener noreferrer">https://github.com/strath-sdr/rfsoc_ofdm</a>'

about = ''.join(['<br><b>', __info__, '</b><br>', __channels__, ' ', __board__,
                 ' ', __release__, '<br>', 'Version ', __version_number__,
                 ': ', __version_name__, '<br>Date: ', __date__, '<br><br>',
                 '<b>Authors</b>: <br>', __author1__, '<br>', __author2__,
                 '<br><br>', '<b>Organisation:</b> <br>', __organisation__,
                 '<br><br>', '<b>Support</b>:<br>', __support__])

from pynq import Overlay
import xrfdc
import xrfclk
import os
import numpy as np
import ipywidgets as ipw

from .ofdm_rx import *
from .ofdm_tx import *
from .sdr_plots import HWFreqPlot, IQFreqPlot, IQTimePlot, IQConstellationPlot
from .dma_timer import DmaTimer

class TimerRegistry():
    """Helper class to track active timer threads.
    This can be used to help safely stop any orphaned DMA timers.
    Orphans appear when a cell is re-run while its DMA timer is active.
    """
    def __init__(self):
        self.registry = dict()

    def register_timers(self, key, timers):
        """Register a list of timers with the registry.
        This will safely stop any timers that were previously registered with
        the same key.
        key: String name for this timer group
        timers: List of DmaTimer objects
        """
        if key in self.registry:
            [timer.stop() for timer in self.registry[key]]
        self.registry[key] = timers


class OfdmOverlay(Overlay):
    def __init__(self, bitfile_name=None, init_rf_clks=True, **kwargs):
        
        if bitfile_name is None:
            this_dir = os.path.dirname(__file__)
            bitfile_name = os.path.join(this_dir, 'bitstream', 'rfsoc_ofdm.bit')
        
        super().__init__(bitfile_name, **kwargs)
        
        # Start up LMX clock
        if init_rf_clks:
            xrfclk.set_all_ref_clks(384)
            
        self.fc = 2450
        
        # Extact in-use dataconverter objects with friendly names
        self.rf = self.usp_rf_data_converter_0
        self.dac_tile = self.rf.dac_tiles[1]
        self.dac_block = self.dac_tile.blocks[1]

        self.adc_tile = self.rf.adc_tiles[1]
        self.adc_block = self.adc_tile.blocks[0]
              
        self.dac_tile.DynamicPLLConfig(1, 384, 3072)
        self.dac_block.NyquistZone = 2
        self.dac_block.MixerSettings = {
            'CoarseMixFreq':  xrfdc.COARSE_MIX_BYPASS,
            'EventSource':    xrfdc.EVNT_SRC_IMMEDIATE,
            'FineMixerScale': xrfdc.MIXER_SCALE_1P0,
            'Freq':           -self.fc,
            'MixerMode':      xrfdc.MIXER_MODE_C2R,
            'MixerType':      xrfdc.MIXER_TYPE_FINE,
            'PhaseOffset':    0.0
        }
        self.dac_block.UpdateEvent(xrfdc.EVENT_MIXER)
        self.dac_tile.SetupFIFO(True)
        
        self.adc_tile.DynamicPLLConfig(1, 384, 3072)
        self.adc_block.NyquistZone = 2
        self.adc_block.MixerSettings = {
            'CoarseMixFreq':  xrfdc.COARSE_MIX_BYPASS,
            'EventSource':    xrfdc.EVNT_SRC_TILE,
            'FineMixerScale': xrfdc.MIXER_SCALE_1P0,
            'Freq':           self.fc,
            'MixerMode':      xrfdc.MIXER_MODE_R2C,
            'MixerType':      xrfdc.MIXER_TYPE_FINE,
            'PhaseOffset':    0.0
        }
        self.adc_block.UpdateEvent(xrfdc.EVENT_MIXER)
        self.adc_tile.SetupFIFO(True)
        
        self.timers = TimerRegistry()
        
        self.ofdm_rx
        self.ofdm_tx
        
    def resync(self):
        self.ofdm_tx.ofdm_tx.enable = 0
        self.ofdm_rx.ofdm_rx.enable = 0

        self.ofdm_rx.ofdm_rx.reset = 1
        self.ofdm_tx.ofdm_tx.reset = 1
        self.ofdm_rx.ofdm_rx.reset = 0
        self.ofdm_tx.ofdm_tx.reset = 0
        
        self.ofdm_tx.ofdm_tx.mod = self.ofdm_tx.mod

        self.ofdm_rx.ofdm_rx.enable = 1
        self.ofdm_tx.ofdm_tx.enable = 1
        
    def on_tx_carrier_change(self, change):
        # DAC NCO is -ve on even Nyquist
        self.dac_block.MixerSettings['Freq'] = -1*change['new']  
        self.adc_block.UpdateEvent(xrfdc.EVENT_MIXER)
        self.adc_tile.SetupFIFO(True)
        
    def on_rx_carrier_change(self, change):
        # ADC NCO is +ve on even Nyquist
        self.adc_block.MixerSettings['Freq'] = change['new']
        self.adc_block.UpdateEvent(xrfdc.EVENT_MIXER)
        self.adc_tile.SetupFIFO(True)
        
    def carrier_frequency(self):
        self.tx_carrier_ipw = ipw.BoundedFloatText(
            min=1536,
            max=3072,
            value=self.fc,
            description='Tx Carrier (MHz):',
            disabled=False,
            style={'description_width': 'initial'}
        )
        self.rx_carrier_ipw = ipw.BoundedFloatText(
            min=1536,
            max=3072,
            value=self.fc,
            description='Rx Carrier (MHz):',
            disabled=False,
            style={'description_width': 'initial'}
        )
        self.tx_carrier_ipw.observe(self.on_tx_carrier_change, names='value')
        self.rx_carrier_ipw.observe(self.on_rx_carrier_change, names='value')
        
        return ipw.HBox([self.tx_carrier_ipw, self.rx_carrier_ipw])
        
    def on_modulation_change(self, change):
        self.ofdm_tx.set_modulation(change['new'])
        
    def modulation_type(self):
        options= ['BPSK', 
                  'QPSK', 
                  '8-PSK', 
                  '16-QAM', 
                  '32-QAM', 
                  '64-QAM', 
                  '128-QAM', 
                  '256-QAM', 
                  '512-QAM',
                  '1024-QAM']
        
        self.mod_type_ipw = ipw.Dropdown(
            options=options,
            value='64-QAM',
            description='Select Modulation Scheme: ',
            disabled=False,
            layout=ipw.Layout(width='auto'),
            style={'description_width': 'initial'},
        )
        
        self.mod_type_ipw.observe(self.on_modulation_change, names='value')
        
        return self.mod_type_ipw
        
    def plot_group(self, group_name, domains, get_time_data, fs=None, get_freq_data=None, get_const_data=None, y_range=None):
        """Create a group of plots for a given set of data generators.
            
        group_name: String name for plot group (used to register timers with
                    the TimerRegistry)
        domains:    List of plot types to generate. Select from:
                    ['time','time-binary','frequency','constellation'].
        fs:         Sampling frequency. Used for time axis scaling
        get_time_data: Callback function that returns a buffer of time domain
                       samples
        get_freq_data: Optional callback that returns a buffer of frequency
                       domain samples. When not specified, a software FFT will
                       be performed on the get_time_data callback instead.
        get_const_data: Optional callback that returns a buffer of time-domain
                        data for any constellation plots. When not specified,
                        the get_time_data callback will be used.
        """
        plots = []
        
        def many(f, n=4):
            return np.concatenate([f() for _ in range(n)])
        
        for domain in domains:
            
            if domain=='frequency':
                
                # HW accelerated FFT
                if get_freq_data != None:
                    f_plot = HWFreqPlot(
                                [get_freq_data() for _ in range(4)],
                                fs, animation_period=100, w=700)
                    f_dt = DmaTimer(f_plot.add_frame, get_freq_data, 0.3)
                # SW FFT
                else:
                    f_plot = IQFreqPlot(
                                [many(get_time_data) for _ in range(4)],
                                fs, x_range=(-0.5e6,0.5e6), animation_period=100, w=700)
                    f_dt = DmaTimer(f_plot.add_frame, lambda:many(get_time_data), 0.3)
                plots.append(dict(title='Frequency domain', plot=f_plot, control=f_dt))
            
            elif domain=='time' or domain=='time-binary':
                if domain=='time-binary':
                    iq_plot = IQTimePlot(many(get_time_data, n=10), fs, w=700, scaling=1, y_range=y_range)
                    iq_plot.set_line_mode(lines=True, markers=True, shape='hvh')
                    iq_plot.get_widget().layout.yaxis.dtick=1
                else:
                    iq_plot = IQTimePlot(many(get_time_data), fs, w=700)
                    iq_plot.set_line_mode(markers=False)
                iq_dt = DmaTimer(iq_plot.add_data, get_time_data, 0.05)
                plots.append(dict(title='Time domain', plot=iq_plot, control=iq_dt))
            
            elif domain=='constellation':
                c_plot = IQConstellationPlot(many(get_const_data or get_time_data, n=1), h=550, fade=True)
                c_dt = DmaTimer(c_plot.add_data, get_const_data or get_time_data, 0.2)
                plots.append(dict(title='Constellation', plot=c_plot, control=c_dt,
                                  layout=ipw.Layout(width='550px', margin='auto')))
                
        self.timers.register_timers(group_name, list(map(lambda tab: tab['control'], plots)))
        return OfdmOverlay.tab_plots(plots)
        
    @staticmethod
    def tab_plots(tabs):
        """Helper function to generate a Tab widget given a list of definitions.
        tabs: A list of dicts describing a single tab. Each element needs three
              keys: 'plot' with a SdrPlot object, 'control' with a DmaTimer
                    object, and 'title' with a string.
        """
        widgets = []
        titles  = []

        for tab in tabs:
            widgets.append(ipw.VBox([
                tab['plot'].get_widget(),tab['control'].get_widget()
                ],layout=tab.get('layout',ipw.Layout())))
            titles.append(tab['title'])

        tab_widget = ipw.Tab(widgets)
        for i, title in enumerate(titles):
            tab_widget.set_title(i, title)
        
        OfdmOverlay._tab_load_resizer_callback(tab_widget)

        return tab_widget

    @staticmethod
    def _tab_load_resizer_callback(tabs):
        """Helper function to handle relative widths for plots in hidden tabs"""
        
        out = ipw.Output()
        display(out)

        @out.capture()
        def callback(change):
            plot = tabs.children[change['new']].children[0]
            plot.layout.autosize = False
            plot.layout.autosize = True

        tabs.observe(callback, names='selected_index')

    def _tx_display_generator(self):
        plot_tx_sym = self.plot_group(
            'tx_sym', ['time-binary'], self.ofdm_tx.get_tx_sym, fs=1e6
        )
        plot_tx_2M = self.plot_group(
            'tx_2M', ['time-binary'], self.ofdm_tx.get_tx_2M, fs=2e6, y_range=[-0.3,0.3]
        )
        tx_display_widgets = [plot_tx_sym.children[0], plot_tx_2M.children[0]]
        tx_display_tab_name = ['Symbols', 'Interpolated']
        tx_display_tab = ipw.Tab(children=tx_display_widgets,
                                layout=ipw.Layout(height='initial',
                                                width='initial'))
        for i in range(0, len(tx_display_widgets)):
                tx_display_tab.set_title(i, tx_display_tab_name[i])
        return tx_display_tab

    def _rx_display_generator(self):
        plot_rx_constellation = self.plot_group(
            'rx_demod',             # Plot group's ID
            ['constellation'],      # List of plot types chosen from:
                                    # ['time','time-binary','frequency','constellation']
            self.ofdm_rx.get_demod, # Function to grab a buffer of samples
        )
        rx_display_widgets = [plot_rx_constellation.children[0]]
        rx_display_tab_name = ['Constellation']
        rx_display_tab = ipw.Tab(children=rx_display_widgets,
                                layout=ipw.Layout(height='initial',
                                                width='initial'))
        for i in range(0, len(rx_display_widgets)):
                rx_display_tab.set_title(i, rx_display_tab_name[i])
        return rx_display_tab

    def _common_control_generator(self):
        fc_widgets = self.carrier_frequency()
        mod_widgets = self.modulation_type()
        return ipw.VBox([fc_widgets, mod_widgets])
        
    def _ofdm_generator(self):
        tx_display_widget = self._tx_display_generator()
        rx_display_widget = self._rx_display_generator()
        common_control_widget = self._common_control_generator()
        control_accordion = ipw.Accordion(children=[common_control_widget])
        tx_display_accordion = ipw.Accordion(children=[tx_display_widget])
        control_accordion.set_title(0, 'System Control')
        tx_display_accordion.set_title(0, 'Transmitter Visualisation')
        side_bar = ipw.VBox([control_accordion, tx_display_accordion])
        main_app = ipw.Accordion(children=[rx_display_widget])
        main_app.set_title(0, 'Receiver Visualisation')
        return ipw.HBox([side_bar, main_app])

    def ofdm_demonstrator_application(self):
        app = self._ofdm_generator()
        self.resync()
        return app