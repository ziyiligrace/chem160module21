#!/usr/bin/python3
# Solitaire Monte Carlo simulator program
#
# This material is released under a Creative Commons License
# (Attribution-Noncommercial-Share Alike License)
# (http://creativecommons.org/licenses/by-nc-sa/3.0/) 
# with the following attribution:
# "Original version of this material was developed by 
# Prof. Michael Colvin at UC Merced"

# This program implements a simple Solataire Card game (that is fun in its
# own right) inside a Monte Carlo framework that allows one to compute
# statistics on the probability of winning

# Bring in useful modules
import random
import math
import sys

if (len(sys.argv)<4):
    sys.exit("Usage: Solitaire.py [# Faces] [# Suits] [# Trials], e.g. Solitaire.py 13 4 1000")
nfaces=int(sys.argv[1])
nsuits=int(sys.argv[2])
ntrials=int(sys.argv[3])

ncards=nfaces*nsuits
results=[]
for itrial in range(0,ntrials):
    cur=0
    deck=list(range(0,ncards))
    random.shuffle(deck)
    l=len(deck)
    while l-cur>=4:
        if (deck[cur]%nsuits)==(deck[cur+3]%nsuits): 
            deck.pop(cur+2)
            deck.pop(cur+1)
            cur=max(0,cur-2)
            l=l-2
        elif (deck[cur]//nsuits)==(deck[cur+3]//nsuits):
            deck.pop(cur+3)
            deck.pop(cur+2)
            deck.pop(cur+1)
            deck.pop(cur)
            l=l-4
            cur=max(0,cur-4)
        else:
            cur=cur+1
    results.append(len(deck))
nzeros=results.count(0)
prob=float(nzeros)/float(ntrials)
print("Winning probability = %7.4f"%(prob))
