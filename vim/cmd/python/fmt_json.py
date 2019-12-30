# -*- coding: utf-8 -*-
# @Time    : 2019-12-11 13:39
# @Author  : CaoWeidong
# @Email   : caowd1990@163.com
# @File    : fmt_json.py
# @Software: IntelliJ IDEA
r"""Command-line tool to validate and pretty-print JSON

Usage::

    $ echo '{"json":"obj"}' | python -m json.tool
    {
        "json": "obj"
    }
    $ echo '{ 1.2:3.4}' | python -m json.tool
    Expecting property name enclosed in double quotes: line 1 column 3 (char 2)

"""
import argparse
import collections
import json
import sys


def main():
    prog = 'python -m json.tool'
    description = ('A simple command line interface for json module '
                   'to validate and pretty-print JSON objects.')
    parser = argparse.ArgumentParser(prog=prog, description=description)
    parser.add_argument('infile', nargs='?', type=argparse.FileType(),
                        help='a JSON file to be validated or pretty-printed')
    parser.add_argument('outfile', nargs='?', type=argparse.FileType('w'),
                        help='write the output of infile to outfile')
    parser.add_argument('--sort-keys', action='store_true', default=False,
                        help='sort the output of dictionaries alphabetically by key')
    options = parser.parse_args()

    infile = options.infile or sys.stdin
    outfile = options.outfile or sys.stdout
    sort_keys = options.sort_keys
    with infile:
        try:
            c = infile.read()
            if "\\x" in c:
                c = c.replace("'", "\"")
                c = eval("b'" + c + "'").decode('utf8')
            if sort_keys:
                obj = json.loads(c, sort_keys=sort_keys)
            else:
                obj = json.loads(c, object_pairs_hook=collections.OrderedDict)
        except Exception as e:
            if "\\u" in c:
                obj = eval("u'" + c.strip() + "'")
            # raise SystemExit(e)
    with outfile:
        if isinstance(obj, dict) or isinstance(obj, list):
            json.dump(
                obj,
                outfile,
                sort_keys=sort_keys,
                indent=4,
                ensure_ascii=False
            )
            outfile.write('\n')
        elif isinstance(obj, str) or isinstance(obj, int):
            outfile.write(obj)
            outfile.write('\n')


if __name__ == '__main__':
    main()
