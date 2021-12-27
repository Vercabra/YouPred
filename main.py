from googleapiclient.discovery import build
from operator import itemgetter

import math

api_key = 'AIzaSyBAgXCdGjFqY3ftUeIsDsPk0ZsN2Y1rZ-I'  # our token
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
        X_Y.append((c[0].split("T")[0], c[1]))
    return X_Y


def video_info(key_word="planets"):

    request = youtube.search().list(  # request method that collect data
        part='snippet',  # part of returned dict
        q=key_word,  # search request field
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

    return full_video_response
