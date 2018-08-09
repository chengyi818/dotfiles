#!/usr/bin/env python2
# Author: ChengYi
# Mail: chengyi818@foxmail.cn
# created time: Fri 15 Jun 2018 05:10:24 PM CST

import dis
import sys


def is_code_object(code_object):
    if type(code_object).__name__ == 'code':
        return True

    return False


def show_code_object(code_object):
    if not is_code_object(code_object):
        return

    for tmp in code_object.co_consts:
        if is_code_object(tmp):
            show_code_object(tmp)

    print(code_object.co_name)
    dis.dis(code_object)
    print("---------------------------")


def main():
    file_name = sys.argv[len(sys.argv)-1]
    s = open(file_name).read()
    co = compile(s, file_name, 'exec')

    show_code_object(co)


if __name__ == "__main__":
    main()
