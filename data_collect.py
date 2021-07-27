from googleapiclient.discovery import build
from operator import itemgetter
import math

api_key = 'AIzaSyCZTpGs9kxHFjzrjZnrnafbn5Yww91A5s4'  # our token
youtube = build('youtube', 'v3', developerKey=api_key)


# VIEW API DOC BEFORE USE THIS FUNCTION!
# 'q' - search string, 'r_a' - amount of videos, 'o' - sorting order
def get_search_stat(question: str, res_amount: int, order: str):
    # collect videoId to get detailed information by video
    video_id = []  # contains video ids we will use later
    next_token = ''  # needed to collect next page data
    page_am = math.ceil(res_amount / 50)  # how many page we are parsing
    for i in range(page_am):
        request = youtube.search().list(  # request method that collect data
            part='snippet',  # part of returned dict
            q=question,  # search request field
            maxResults=res_amount - 50 * (page_am - (i + 1)),  # how many results per page
            order=order,
            pageToken=next_token
        )
        response = request.execute()
        for j in range(len(response['items'])):  # collecting Ids
            video_id.append(response['items'][j]['id']['videoId'])
        next_token = response['nextPageToken']  # get next page token

    full_response = []
    for v_id in video_id:
        v_request = youtube.videos().list(
            part='snippet,contentDetails,statistics',
            id=v_id
        )
        i_response = v_request.execute()
        full_response.append((i_response['items'][0]['snippet']['publishedAt'],
                              int((i_response['items'][0]['statistics']['viewCount']))))

    full_response.sort(key=itemgetter(0))
    X_Y = []
    for c in full_response:
        X_Y.append((c[0], c[1]))
    return X_Y


for i in get_search_stat('Guitar', 100, 'viewCount'):
    print(i)



