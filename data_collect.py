from googleapiclient.discovery import build
from operator import itemgetter
import math
from threading import Thread

api_key = 'AIzaSyAB12XFfEMPLXv19T-Z22IeM6jijzKf-hk'  # our token
youtube = build('youtube', 'v3', developerKey=api_key)


# Processing video's data by id
def process_by_id(video_id: list):
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


# VIEW API DOC BEFORE USE THIS FUNCTION! ALL RESULTS SORTED BY DATE
# 'q' - search string, 'r_a' - amount of videos, 'o' - sorting order
def get_search_stat(question: str, res_amount: int, order: str, time_range=('1970-01-01T00:00:00Z', '2970-01-01T00:00'
                                                                                                    ':00Z')):
    # collect videoId to get detailed information by video
    video_id = []  # contains video ids we will use later
    next_token = ''  # needed to collect next page data
    page_am = math.ceil(res_amount / 50)  # how many page we are parsing
    total = 0
    for i in range(page_am):
        request = youtube.search().list(  # request method that collect data
            part='snippet',  # part of returned dict
            q=question,  # search request field
            maxResults=res_amount - 50 * (page_am - (i + 1)),  # how many results per page
            order=order,
            pageToken=next_token,
            type='video',
            publishedAfter=time_range[0],
            publishedBefore=time_range[1]
        )
        response = request.execute()
        if i == 0:
            total = response['pageInfo']['totalResults']
        for j in range(len(response['items'])):  # collecting Ids
            video_id.append(response['items'][j]['id']['videoId'])
        if response['pageInfo']['resultsPerPage'] >= 50:
            next_token = response['nextPageToken']  # get next page token
    return process_by_id(video_id), total


def get_stats_by_year(question: str):
    pass


print(len(get_search_stat('Guitar', 500, 'viewCount', time_range=('2018-01-01T00:00:00Z', '2018-01-31T00:00:00Z'))[0]))





