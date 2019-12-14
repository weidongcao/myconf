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
import sys
import json

def main():
    if len(sys.argv) == 1:
        infile = sys.stdin
        outfile = sys.stdout
    elif len(sys.argv) == 2:
        infile = open(sys.argv[1], 'rb')
        outfile = sys.stdout
    elif len(sys.argv) == 3:
        infile = open(sys.argv[1], 'rb')
        outfile = open(sys.argv[2], 'wb')
    else:
        raise SystemExit(sys.argv[0] + " [infile [outfile]]")
    with infile:
        try:
            content = infile.read()
            obj = eval(content)
        except ValueError, e:
            raise SystemExit(e)
    with outfile:
        json.dump(
            obj,
            outfile,
            sort_keys=True,
            indent=4,
            ensure_ascii=False,
            separators=(',', ': ')
        )
        outfile.write('\n')


if __name__ == '__main__':
    main()
