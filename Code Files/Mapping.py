"""
# The code is written by Jawwad Shadman Siddique | R11684947
# Date of Submission: 11 / 04 / 2020
# This Step performs mapping using GeoPandas
"""

# importing required libraries & packages

import os
import pandas as pd
import geopandas 
import numpy as np
import seaborn as sns
from matplotlib import pyplot as plt


"""
os.getcwd()
os.chdir('D:\Python Practice Programs')
os.getcwd()
"""

# Reading the dataset having data points of few states

a = pd.read_csv('Map Data.csv')

# Converting the latitude and longitude into geometry points

gdf=geopandas.GeoDataFrame(
    a, geometry = geopandas.points_from_xy(a.Longitude, a.Latitude) )

# Extracting the data of world map

world = geopandas.read_file(geopandas.datasets.get_path('naturalearth_lowres'))

# We restrict to North America for the map of USA.

ax=world[world.continent == 'North America'].plot(color='white', edgecolor='blue')

# We now plot our ``GeoDataFrame``.

gdf.plot(ax=ax, color='yellow')

plt.show()