# -*- coding: utf-8 -*-
import argparse
import collections
import datetime
import json
import sys
import time


def parse_datetime(str_time=None, fmt='%Y-%m-%d %H:%M:%S'):
    """
    将时间字符串解析为时间
    :param str_time:
    :param fmt:
    :return:
    """
    # t = datetime.datetime.now()
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
        ts = int(ts[0:10])
        convert_str = time.strftime(fmt, time.localtime(ts))
    return convert_str


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('infile', nargs='?', type=argparse.FileType())
    parser.add_argument('outfile', nargs='?', type=argparse.FileType('w'))

    options = parser.parse_args()

    infile = options.infile or sys.stdin
    outfile = options.outfile or sys.stdout
    with infile:
        try:
            content = infile.read()
            # 转义未解码的utf-8
            if "\\x" in content:
                content = content.replace("'", "\"")\
                    .replace("\r\n","")\
                    .replace("\n","")\
                    .replace("\r","")
                content = eval("b'" + content + "'").decode('utf8')
            obj = json.loads(content, object_pairs_hook=collections.OrderedDict)
        except Exception as e:
            # raise SystemExit(e)
            try:
                # unicode
                if "\\u" in content:
                    obj = json.loads("u'" + content.strip() + "'")
                else:
                    # 时间
                    obj = str(str_to_timestamp(content))
            except:
                obj = content

        # 时间戳转时间
        if isinstance(obj, int):
            obj = timestamp2str(int(content))
            # raise SystemExit(e)
    with outfile:
        if isinstance(obj, dict) or isinstance(obj, list):
            json.dump(
                obj,
                outfile,
                indent=4,
                ensure_ascii=False
            )
            outfile.write('\n')
        elif isinstance(obj, str) or isinstance(obj, int):
            outfile.write(str(obj))
            outfile.write('\n')


if __name__ == '__main__':
    main()

