from pyswip import Prolog
from convert import conv
import window_classes

aki = Prolog()

def prolog_interaction(list):

    aki.consult("akinator.pl")
    aki.query('read_base')
    name = aki.query('get_monster({})'.format(list))
    if name == aki.query('nil'):
        add_w = window_classes.AddMonster()
        add_w.exec_()
        if add_w.val == 1:
            name = add_w.line
            list.insert(conv(name), 0)
            aki.query('add_to_base({})'.format(list))
    else:
        res_w = window_classes.Result()
        res_w.exec_()
    aki.query('base_to_file')

def read_base():
    file = open("monster_base.txt")
    rows = file.read().split('\n')
    for row in rows:
        row.split('\t')
        aki.assertz('class({}, {})'.format(row[0], row[1]))
        aki.assertz('type({}, {})'.format(row[0], row[2]))
        aki.assertz('sentient({}, {})'.format(row[0], row[3]))
        aki.assertz('polymorphy({}, {})'.format(row[0], row[4]))
        aki.assertz('activity({}, {})'.format(row[0], row[5]))
        aki.assertz('habitat({}, {})'.format(row[0], row[6]))
        aki.assertz('abilities({}, {})'.format(row[0], row[7]))

def base_to_file():








