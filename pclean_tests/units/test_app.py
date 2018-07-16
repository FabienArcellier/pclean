# coding=utf-8

import unittest
from pclean.__main__ import clean_text

class AppTest(unittest.TestCase):
    def setUp(self):
        pass

    def test_clean_text_should_not_change_alphanum_string(self):
        # Assign
        # Acts
        text = clean_text('text12')
        # Assert
        self.assertEqual('text12', text)

    def test_clean_text_should_move_uppercase_into_lowercase(self):
        # Assign
        # Acts
        text = clean_text('tExt12')
        # Assert
        self.assertEqual('text12', text)

    def test_clean_text_should_replace_non_alphanum_by_underscore(self):
        # Assign
        # Acts
        text = clean_text('text12 (e) evola')
        # Assert
        self.assertEqual('text12__e__evola', text)
