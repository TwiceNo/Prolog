import subprocess




#
#process = subprocess.Popen(['swipl'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, text=True, universal_newlines=True)
##process.stdin.write('swipl')
#out = process.communicate("consult('d:/repos/witcher/source/akinator.pl').\nread_base('d:/repos/witcher/source/monster_base.txt').\nclass(M, 10).\n;\n;\n;\n;\n")
##process.stdin.write('consult("d:/repos/witcher/source/akinator.pl").')
##process.stdin.write("read_base('d:/repos/witcher/source/monster_base.txt').")
#
#print(out)
#process.terminate()
#
#

#
#prolog = subprocess.call('cmd.exe', stdin = subprocess.PIPE, stdout = subprocess.PIPE, text = True, universal_newlines = True)
#
#prolog.stdin.write('swipl')
#prolog.stdin.write('consult("d:/repos/witcher/source/akinator.pl").')
#
#
#def read_base():
#    prolog.stdin.write("read_base('d:/repos/witcher/source/monster_base.txt').")
#
#def to_file():
#    prolog.stdin.write("base_to_file('d:/repos/witcher/source/monster_base.txt').")
#    prolog.stdin.write('restore_base.\n')
#
#def get_monster(list):
#    prolog.stdin.write('get_monster({}).'.format(list))
#    name = prolog.stdout.read()
#    return name
#
#def add_monster(monster):
#    prolog.stdin.write('add_to_base({}).'.format(monster))
#
#def restore_base():
#    prolog.stdin.write('restore_base.')
#
#read_base()
#
##out = get_monster([M, 10,	0,	1,	1,	0,	3,	2])
##out = prolog.stdout.read()
#prolog.stdin.write('class(M, 10).')
##prolog.kill()
#output_line = prolog.stdout.read()
##while prolog.poll() is None:
##    output_line = prolog.stdout.readline()
##    prolog.stdin.write(';')
#
#
#print(output_line)
#












#
#aki = pyswip.Prolog()
#
#def prolog_interaction(list):
#    aki.consult("akinator.pl")
#    aki.query('read_base.')
#    name = aki.query('get_monster({}).'.format(list))
#    if name == aki.query('nil'):
#        add_w = window_classes.AddMonster()
#        add_w.exec_()
#        if add_w.val == 1:
#            name = add_w.line
#            list.insert(convert.translate(name), 0)
#            aki.query('add_to_base({}).'.format(list))
#    else:
#        res_w = window_classes.Result()
#        res_w.exec_()
#    aki.query('base_to_file.')
#
#def read_base():
#    file = open("monster_base.txt")
#    rows = file.read().split('\n')
#    for row in rows:
#        row.split('\t')
#        aki.assertz('class({}, {})'.format(row[0], row[1]))
#        aki.assertz('type({}, {})'.format(row[0], row[2]))
#        aki.assertz('sentient({}, {})'.format(row[0], row[3]))
#        aki.assertz('polymorphy({}, {})'.format(row[0], row[4]))
#        aki.assertz('activity({}, {})'.format(row[0], row[5]))
#        aki.assertz('habitat({}, {})'.format(row[0], row[6]))
#        aki.assertz('abilities({}, {})'.format(row[0], row[7]))
#
#aki.query('read_base.')
#print(aki.query('class({}, 2).'))
#
#
#
#



