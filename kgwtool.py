import getpass
import json
import os
import platform
import sys

import requests
import shutil
import base64
from github import Github

#class KGWTool:
#    workPath = os.getcwd()
#    def __int__(self):
#        print(self.workPath)
#
#    def work(self, name):
#        os.mkdir(self.workPath + "/" + name)
#        print('创建成功')
#
#    def check(self):
#        files = os.listdir(self.workPath)
#        files.remove('DS_Store')
#        print('当前目录文件数量为:')
#        print(len(files))
#        print(files)
#
#kgwtool = KGWTool()
#
#if len(sys.argv) > 2 and sys.argv[1] == '-d':
#    kgwtool.work(sys.argv[2])
#elif len(sys.argv) > 1 and sys.argv[1] == '--check':
#    kgwtool.check()
#else:
#    print('需要入参')

# class repo:
#     def __int__(self, url, repository_url):
#         self.url = url
#         self.repository_url = repository_url
class KGWGetRepoPRTool:
    # token = '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'
    # repo = 'https://github.com/jianjunh/CoreAnimation.git'
    
    def __init__(self, token, username, reponame, prnum):
        self.token = token
        self.username = username
        self.reponame = reponame
        self.prnum = prnum

    def repo_data(self):
        url = 'https://api.github.com/user'
        headers = {
            "Authorization": "token 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", 'Accept': 'application/vnd.github.v3+json',
            'Content-Type': 'application/json'
        }
        # url = 'https://api.github.com/search/repositories?q=type:pr&sort=stars'

        url = f"https://api.github.com/search/issues?q=author:{self.username}+type:pr"

        headers = {
            "Authorization": f"token {self.token}", 'Accept': 'application/vnd.github.v3+json',
            'Content-Type': 'application/json',
        }

        r = requests.get(url, headers=headers)
        jsontext = json.loads(r.text)
        print(jsontext)
        print(jsontext['items'][0]['number'])

        pr_number = jsontext['items'][0]['number']
        # print('---------------')
        # for item in items:
        #     number = item
        # print
        # print('第二个请求开始')
        pull_request_url = f'https://api.github.com/repos/{self.username}/{self.reponame}/pulls/{pr_number}/files'
        r = requests.get(pull_request_url, headers=headers)
        jsontext1 = json.loads(r.text)
        print(jsontext1)
        print('第二个请求完成')
        filename = os.getcwd() + '/' + jsontext1[0]['filename']
        return filename

kgwtool = KGWGetRepoPRTool('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', 'jianjunh', 'CoreAnimation',4)

filename = kgwtool.repo_data()
destination = os.getcwd() + '/' + 'ScanFile'
print(destination)
shutil.move(filename, destination)
# if len(sys.argv) > 2 and sys.argv[1] == '--username':
#     kgwtool.work(sys.argv[2])
# elif len(sys.argv) > 1 and sys.argv[1] == '--check':
#     kgwtool.check()
# else:
#     print('需要配置--accesstoken --username --reponame --prnumber')