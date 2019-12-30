# -*- coding: utf-8 -*-
# @Time    : 2019-12-11 13:39
# @Author  : CaoWeidong
# @Email   : caowd1990@163.com
# @File    : fmt_json.py
# @Software: IntelliJ IDEA
r"""Command-line tool to validate and pretty-print JSON

Usage::

    $ echo '{"json":"obj"}' | python -m fmt_json
    {
        "json": "obj"
    }
    $ echo '{ 1.2:3.4}' | python -m json.tool
    Expecting property name enclosed in double quotes: line 1 column 3 (char 2)

"""
import datetime
import sys
import json
import time


def parse_datetime(str_time=None, fmt='%Y-%m-%d %H:%M:%S'):
    """
    将时间字符串解析为时间
    :param str_time:
    :param fmt:
    :return:
    """
    t = datetime.datetime.now()
    if str_time:
        try:
            t = datetime.datetime.strptime(str_time, fmt)
        except:
            try:
                t = datetime.datetime.strptime(str_time, '%Y/%m/%d %H:%M:%S')
            except:
                try:
                    # UTC时间转为北京时间需要加上8小时时差
                    t = datetime.datetime.strptime(str_time, '%Y-%m-%dT%H:%M:%SZ')
                    t += datetime.timedelta(hours=8)
                except:
                    try:
                        # UTC时间转为北京时间需要加上8小时时差
                        t = datetime.datetime.strptime(str_time, '%Y-%m-%dT%H:%M:%S.%fZ')
                        t += datetime.timedelta(hours=8)
                    except Exception as e:
                        t = t
    return t


def str_to_timestamp(str_time=None, fmt='%Y-%m-%d %H:%M:%S'):
    """时间转时间戳"""
    str_time = str(str_time)
    convert_timestamp = str_time
    if str_time:
        if str_time.isdigit():
            if len(str_time) == 10:
                convert_timestamp = int(str_time)
            else:
                convert_timestamp = int(str_time) / 1000
        else:
            d = parse_datetime(str_time, fmt)
            convert_timestamp = int(time.mktime(d.timetuple()))
    return convert_timestamp


def timestamp2str(ts, fmt='%Y-%m-%d %H:%M:%S'):
    ts = str(ts)
    convert_str = ts
    if ts.isdigit():
        ts = int(ts[0:11])
        convert_str = time.strftime(fmt, time.localtime(ts))
    return convert_str


def main():
    if len(sys.argv) == 1:
        infile = sys.stdin
        outfile = sys.stdout
    elif len(sys.argv) == 2:
        infile = open(sys.argv[1], 'rb')
        outfile = sys.stdout
    else:
        raise SystemExit(sys.argv[0] + " [transform time/timestamp error]")
    with infile:
        try:
            content = infile.read()
            content = content.strip()
        except ValueError as e:
            raise SystemExit(e)
    with outfile:
        if content.isdigit():
            outfile.write(timestamp2str(int(content)))
        else:
            outfile.write(str(str_to_timestamp(content)))

        outfile.write('\n')


if __name__ == '__main__':
    main()
    # obj = json.loads("2019-12-13 18:06:20")
    # print(obj)
