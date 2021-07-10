from googleapiclient.discovery import build
import pandas as pd
from operator import itemgetter
import plotly.express as px
import plotly.graph_objects as go


api_key = 'AIzaSyCZTpGs9kxHFjzrjZnrnafbn5Yww91A5s4'  # our token

youtube = build('youtube', 'v3', developerKey=api_key)

srh_request = ''
request = youtube.search().list(  # request method that collect data
    part='snippet',  # part of returned dict
    q=srh_request,  # search request field
    maxResults='50',
    order='viewCount'
)

response = request.execute()  # making from request response dict
search_id = []  # video id, needed to get video statistics

for j in range(50):  # to get each video search result's id
    search_res_id = response['items'][j]['id']
    search_id.append(search_res_id.get('videoId'))

full_video_response = []  # the results with statistics
for i in search_id:
    if type(i) is str:  # getting results by video_id
        request = youtube.videos().list(
            part='snippet,contentDetails,statistics',
            id=str(i)
        )
        i_response = request.execute()
        full_video_response.append((int(i_response['items'][0]['snippet']['publishedAt'][0:4] +
                                        i_response['items'][0]['snippet']['publishedAt'][5:7] +
                                        i_response['items'][0]['snippet']['publishedAt'][8:10]),
                                    i_response['items'][0]['snippet']['title'],
                                    i_response['items'][0]['snippet']['publishedAt'],
                                    int((i_response['items'][0]['statistics']['viewCount']))))  # collecting only needed

full_video_response.sort(key=itemgetter(0))  # sorting by date
dates = []  # x
views = []  # y
for i in full_video_response:  # appending x and y coordinates
    dates.append(i[2][:10])
    views.append(i[3])

fig = go.Figure()


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


print(fig.to_html(include_plotlyjs='cdn'))


