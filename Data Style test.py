import plotly.graph_objects as go
import math
import numpy as np
dates = []  # x
views = []  # y
fig = go.Figure()
for i in np.arange(-math.pi, math.pi, 0.01):
    dates.append(i)
    views.append(math.sin(5*i) + i)

fig.add_trace(go.Scatter(x=dates,
                         y=views,
                         line=dict(color='rgb(94, 114, 228)',
                                   width=3))),

fig.update_layout(width=980,
                  height=483,
                  plot_bgcolor='#172b4d',
                  paper_bgcolor="#172b4d",
                  xaxis_showgrid=False,
                  yaxis_showgrid=False,
                  xaxis_zeroline=False,
                  yaxis_zeroline=False,
                  xaxis_anchor='free',
                  yaxis_anchor='free',
                  xaxis_position=0,
                  yaxis_position=0,
                  title="Total views stats",
                  title_font_color='#ffffff',
                  title_font_family='Rubik',
                  font=dict(
                      family="Rubik Light",
                      size=18,
                      color="#adb5bd"
                  ))

fig.show()
print(fig.to_html(include_plotlyjs='cdn'))
