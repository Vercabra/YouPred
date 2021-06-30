from googleapiclient.discovery import build
import matplotlib.pyplot as plt
import pandas as pd


api_key = 'AIzaSyCZTpGs9kxHFjzrjZnrnafbn5Yww91A5s4'  # our token

youtube = build('youtube', 'v3', developerKey=api_key)


request = youtube.search().list(  # request method that collect data
    part='snippet',  # part of returned dict
    q='Planets',  # search parameter
    maxResults='50',
    order='date'
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
        full_video_response.append((i_response['items'][0]['snippet']['title'],
                                    i_response['items'][0]['snippet']['publishedAt'],
                                    int((i_response['items'][0]['statistics']['viewCount']))))  # collecting only needed

dates = []
views = []
for i in full_video_response:
    dates.append(i[1][:10])
    views.append(i[2])


view_sr = pd.Series(views, dates)
view_sr.plot()
plt.show()
print(view_sr)