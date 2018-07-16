#!/usr/bin/python
# coding=utf-8

import sys

def main():
    pclean(sys.argv[1:])

def pclean(text_array):
    text = ' '.join(text_array)
    cleantext = clean_text(text)
    print(cleantext)

def clean_text(text):
    text_without_non_alphanum = ''.join([c if c.isalnum() else "_" for c in text])
    return text_without_non_alphanum.lower()

if __name__ == "__main__":
    pclean(sys.argv[1:])
