import os
from xml.etree import ElementTree
file_name = 'feeds.xml'


dom = ElementTree.parse(file_name)

courses = dom.findall('channel/item')

for c in courses:
    
    title = c.find('title').text
    num = c.find('description').text
    
    print('{} - {}'.format(
        title,num
    ))