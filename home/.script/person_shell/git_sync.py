#!/usr/bin/env python3
# Author: ChengYi
# Mail: chengyi818@foxmail.cn
# created time: Thu 17 Jan 2019 09:46:05 AM CST
import threading
import subprocess
from multiprocessing import Process


repo_path_list = [
    '/home/chengyi/code/github/linux_kernel_all',
    '/home/chengyi/code/github/kata',
    '/home/chengyi/.homesick/repos/dotfiles',
    '/home/chengyi/code/github/Fat-Cheng-s-xv6-journey',
    '/home/chengyi/code/github/my_xv6'
]


class gitThread(threading.Thread):
    def __init__(self, repo_path):
        threading.Thread.__init__(self)
        self.repo_path = repo_path

    def run(self):
        print("sync: " + self.repo_path)
        cmd = "cd {0};git status".format(self.repo_path)
        (status, output) = subprocess.getstatusoutput(cmd)

        if(status == 0 and "clean" in output):
            cmd = "cd {0};git pull".format(self.repo_path)
            (status, output) = subprocess.getstatusoutput(cmd)
            self.info(output)
        else:
            self.warning(output)

    def info(self, msg):
        print("\033[1;33;48m{0}\033[0m: ".format(self.repo_path) + msg)

    def warning(self, msg):
        print("\033[1;31;48m{0}\033[0m".format(self.repo_path) + msg)


def sub_process_target(repo_path):
        tmp = gitThread(repo_path)
        tmp.start()
        tmp.join()


def main():
    sub_process_list = []
    for repo_path in repo_path_list:
        p = Process(target=sub_process_target, args=(repo_path,))
        sub_process_list.append(p)

    for sub_process in sub_process_list:
        sub_process.start()

    for sub_process in sub_process_list:
        sub_process.join()


if __name__ == "__main__":
    main()
