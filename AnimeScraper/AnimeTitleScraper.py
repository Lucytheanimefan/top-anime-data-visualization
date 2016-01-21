'''
Created on Jan 20, 2016

@author: lucy
'''

import requests, bs4

print('Searching for anime') # display text while downloading google page
res=requests.get('http://myanimelist.net/topanime.php')
res.raise_for_status

soup=bs4.BeautifulSoup(res.text,'html.parser')

links=soup.find_all('a',class_='hoverinfo_trigger fs14 fw-b')
numMembers=soup.find_all('div',class_='information di-ib mt4')
maxNum=len(links)

# Write to a text file
topAnimeFile=open('topAnime.txt','w')
for i in range(maxNum):
    print links[i].getText()
    print numMembers[i].getText()
    