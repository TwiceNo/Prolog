import subprocess, window_classes, convert, os


class ProcessManagement():
    list, path = [], ""
    def __init__(self, list, path):
        self.path = path.replace("\\", "/")
        self.list = list

    def get_monster(self):
        process = subprocess.Popen('swipl', stdin=subprocess.PIPE, stdout=subprocess.PIPE, text=True,
                                   universal_newlines=True)
        inputs = "consult('{}').\n".format(self.path + "/akinator.pl")
        inputs += "\nread_base('{}').\n".format(self.path + "/monster_base.txt")
        inputs += "get_monster([M, {}, {}, {}, {}, {}, {}, {}]).".format(self.list[0], self.list[1], self.list[2],
                                                                         self.list[3], self.list[4], self.list[5],
                                                                         self.list[6])
        output = process.communicate(inputs)
        tuple = self.get_result(output[0])
        process.kill()
        if tuple[0] == True:
            window_classes.show_result(tuple[1])
        else:
            self.add_monster()

    def get_result(self, line):
        if not line.find('false.') == -1:
           return (False, False)
        else:
            first, last = line.find('=') + 2, len(line) - 1
            while line[last] == " " or line[last] == "." or line[last] == "\n":
                last -= 1
            last += 1
            return (True, line[first:last])


    def add_monster(self):
        val = -1
        add_w = window_classes.AddDialog()
        add_w.exec_()
        val = add_w.val
        if val == 1:
            inp_w = window_classes.NameInput()
            inp_w.exec_()
            key_name = convert.name_to_key(inp_w.name)
            self.list.insert(0, key_name)
            process = subprocess.Popen('swipl', stdin=subprocess.PIPE, stdout=subprocess.PIPE, text=True,
                           universal_newlines=True)
            inputs = "consult('{}').\n".format(self.path + "/akinator.pl")
            inputs += "read_base('{}').\n".format(self.path + "/monster_base.txt")
            inputs += "add_to_base({}).\n".format(self.list)
            inputs += "base_to_file('{}').".format(self.path + "/monster_base.txt")
            process.communicate(inputs)
            process.kill()


