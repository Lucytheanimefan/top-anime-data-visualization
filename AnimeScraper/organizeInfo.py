'''
Created on Jan 20, 2016

@author: lucy
'''
myText=open('topAnime.txt','r')
lines=myText.read().split('\n')
lines=[line.strip(' ')for line in lines] # eliminate spaces in each array element

# Get episodes
for i in range(2,len(lines),6):
    print lines[i]

# Get Date
for j in range(3,len(lines),6):
    print lines[j]
    
# Get number of members
for k in range(4,len(lines),6):
    print lines[k]