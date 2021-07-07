from googleapiclient.discovery import build
import matplotlib.pyplot as plt
import pandas as pd
from operator import itemgetter
import json


api_key = 'AIzaSyCZTpGs9kxHFjzrjZnrnafbn5Yww91A5s4'  # our token

youtube = build('youtube', 'v3', developerKey=api_key)

request = youtube.search().list(  # request method that collect data
    part='snippet',  # part of returned dict
    q='resident evil village',  # search parameter
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

view_sr = pd.Series(views, dates)
view_sr.plot()
plt.show()
# dat_vie_dict =   # suppose to be respond

print(list(zip(dates, views)))

