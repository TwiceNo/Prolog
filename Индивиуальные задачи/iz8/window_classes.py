import base_view, question_form, main_window, pop_up, add_dialog, add_picture, name_input, result_form, convert
from PyQt5 import QtWidgets, QtGui
from PIL import Image
import sys


class Result(QtWidgets.QDialog, result_form.Ui_result):
    name = "nigthwraith"
    def __init__(self):
        super().__init__()
        self.setupUi(self)
        self.setWindowTitle("Результат")
        self.set_name()
        self.ok_button.clicked.connect(self.exit)

    def set_name(self):
        self.monster_name.setText(convert.monster_name[self.name])
        path = "Pictures/{}.png".format(self.name)
        picture = QtGui.QPixmap(path)
        picture = picture.scaledToHeight(355)
        self.picture.setPixmap(picture)

    def exit(self):
        self.close()


class AddPicture(QtWidgets.QDialog, add_picture.Ui_Dialog):
    path = ""
    def __init__(self):
        super().__init__()
        self.setupUi(self)
        self.setWindowTitle("Добавить")
        self.file_view.clicked.connect(self.browse)
        self.later.clicked.connect(self.exit)

    def browse(self):
        self.path = QtWidgets.QFileDialog.getOpenFileName()
        self.exit()

    def exit(self):
        self.close()


class NameInput(QtWidgets.QDialog, name_input.Ui_Dialog):
    name = ""
    def __init__(self):
        super().__init__()
        self.setupUi(self)
        self.setWindowTitle("Добавить")
        self.ok_button.clicked.connect(self.handler)

    def handler(self):
        if self.lineEdit.text() == '':
            pop = PopUp()
            pop.label.setText("Необходимо ввести имя")
            pop.exec_()
        else:
            self.name = self.lineEdit.text()
            add_p = AddPicture()
            add_p.exec_()
            self.close()


class AddDialog(QtWidgets.QDialog, add_dialog.Ui_Dialog):
    val = -1
    def __init__(self):
        super().__init__()
        self.setupUi(self)
        self.setWindowTitle("Добавить")
        self.no_button.clicked.connect(self.onClick)
        self.yes_button.clicked.connect(self.onClick)

    def onClick(self):
        button = self.sender()
        if button == self.yes_button:
            self.val = 1
        elif button == self.no_button:
            self.val = 0


class PopUp(QtWidgets.QDialog, pop_up.Ui_popUp):
    def __init__(self):
        super().__init__()
        self.setupUi(self)
        self.setWindowTitle("Ошибка")
        self.ok_button.clicked.connect(self.exit)
    def exit(self):
        self.close()


class BaseView(QtWidgets.QDialog, base_view.Ui_Dialog):
    def __init__(self):
        super().__init__()
        self.setupUi(self)
        self.setWindowTitle("База данных")
        self.print_base()
        self.ok_button.clicked.connect(self.exit)

    def print_base(self):
        file = open("monster_base.txt", 'r')
        file_content = file.read().split("\n")
        self.tableView.setRowCount(len(file_content))

        for i in range(len(file_content)):
            line = file_content[i].split("\t")
            self.tableView.setItem(i, 0, QtWidgets.QTableWidgetItem(convert.monster_name[line[0]]))
            self.tableView.setItem(i, 1, QtWidgets.QTableWidgetItem(convert.monster_class[line[1]]))
            self.tableView.setItem(i, 2, QtWidgets.QTableWidgetItem(convert.monster_type[line[2]]))
            self.tableView.setItem(i, 3, QtWidgets.QTableWidgetItem(convert.monster_sen[line[3]]))
            self.tableView.setItem(i, 4, QtWidgets.QTableWidgetItem(convert.monster_poly[line[4]]))
            self.tableView.setItem(i, 5, QtWidgets.QTableWidgetItem(convert.monster_act[line[5]]))
            self.tableView.setItem(i, 6, QtWidgets.QTableWidgetItem(convert.monster_hab[line[6]]))
            self.tableView.setItem(i, 7, QtWidgets.QTableWidgetItem(convert.monster_ab[line[7]]))

        self.tableView.resizeRowsToContents()
        self.tableView.resizeColumnsToContents()
        file.close()

    def exit(self):
        self.close()


class Question(QtWidgets.QDialog, question_form.Ui_Dialog):
    answer, val = -1, 0

    def __init__(self):
        super().__init__()
        self.setupUi(self)
        self.setWindowTitle("Вопрос")

    def onToggledClass(self):
        radioButton = self.sender()
        if radioButton == self.cursed:
            self.answer = 1
        elif radioButton == self.dracon:
            self.answer = 2
        elif radioButton == self.elemen:
            self.answer = 3
        elif radioButton == self.hybrid:
            self.answer = 4
        elif radioButton == self.insect:
            self.answer = 5
        elif radioButton == self.necrop:
            self.answer = 6
        elif radioButton == self.ogroid:
            self.answer = 7
        elif radioButton == self.relict:
            self.answer = 8
        elif radioButton == self.spirit:
            self.answer = 9
        elif radioButton == self.vampir:
            self.answer = 10

    def onToggledType(self):
        radioButton = self.sender()
        if radioButton == self.loner:
            self.answer = 0
        elif radioButton == self.flock:
            self.answer = 1
        elif radioButton == self.both_:
            self.answer = 2

    def onToggledSen(self):
        radioButton = self.sender()
        if radioButton == self.no:
            self.answer = 0
        elif radioButton == self.ye:
            self.answer = 1

    def onToggledPoly(self):
        radioButton = self.sender()
        if radioButton == self.no:
            self.answer = 0
        elif radioButton == self.ye:
            self.answer = 1

    def onToggledAct(self):
        radioButton = self.sender()
        if radioButton == self.nigh:
            self.answer = 0
        elif radioButton == self.day_:
            self.answer = 1
        elif radioButton == self.both:
            self.answer = 2

    def onToggledHab(self):
        radioButton = self.sender()
        if radioButton == self.ever:
            self.answer = 0
        elif radioButton == self.moun:
            self.answer = 1
        elif radioButton == self.wate:
            self.answer = 2
        elif radioButton == self.rura:
            self.answer = 3
        elif radioButton == self.wood:
            self.answer = 4
        elif radioButton == self.unde:
            self.answer = 5
        elif radioButton == self.ceme:
            self.answer = 6
        elif radioButton == self.cast:
            self.answer = 7
        elif radioButton == self.some:
            self.answer = 8

    def onToggledAb(self):
        radioButton = self.sender()
        if radioButton == self.none:
            self.answer = 0
        elif radioButton == self.disa:
            self.answer = 1
        elif radioButton == self.invi:
            self.answer = 2
        elif radioButton == self.summ:
            self.answer = 3
        elif radioButton == self.stun:
            self.answer = 4
        elif radioButton == self.pois:
            self.answer = 5
        elif radioButton == self.blin:
            self.answer = 6
        elif radioButton == self.heig:
            self.answer = 7
        elif radioButton == self.forc:
            self.answer = 8

    def onClick(self):
        button = self.sender()
        self.close()
        if button == self.previous:
            self.val = -1
        elif button == self.next:
            self.val = 1


class MainApp(QtWidgets.QMainWindow, main_window.Ui_MainWindow):
    current_question, answers = 0, []

    def __init__(self):
        super().__init__()
        self.setupUi(self)
        self.setWindowTitle("Чудовища мира Ведьмака")

        self.start.clicked.connect(self.start_asking)
        self.base_control.clicked.connect(self.show_base)

    def show_base(self):
        base_w = BaseView()
        base_w.exec_()

    def start_asking(self):
        while self.current_question < 7:
            window = Question()
            show_question(window, self.current_question)
            window.previous.clicked.connect(window.onClick)
            window.next.clicked.connect(window.onClick)
            window.exec_()
            if window.answer == -1:
                popup = PopUp()
                popup.exec_()
            else:
                if window.val == 1:
                    self.answers.append(window.answer)
                elif window.val == -1:
                    self.answers.pop(len(self.answers) - 1)
                self.current_question += window.val
        show_result(self.answers)


def show_question(window, num):
    if num == 0:
        window.previous.setEnabled(False)
        window.label.setText("К какому классу принадлежит чудовище?")
        window.cursed = QtWidgets.QRadioButton("Проклятые")
        window.dracon = QtWidgets.QRadioButton("Дракониды")
        window.elemen = QtWidgets.QRadioButton("Элементали")
        window.hybrid = QtWidgets.QRadioButton("Гибриды")
        window.insect = QtWidgets.QRadioButton("Инсектоиды")
        window.necrop = QtWidgets.QRadioButton("Трупоеды")
        window.ogroid = QtWidgets.QRadioButton("Огроиды")
        window.relict = QtWidgets.QRadioButton("Реликты")
        window.spirit = QtWidgets.QRadioButton("Духи")
        window.vampir = QtWidgets.QRadioButton("Вампиры")
        window.layout.addWidget(window.cursed)
        window.layout.addWidget(window.dracon)
        window.layout.addWidget(window.elemen)
        window.layout.addWidget(window.hybrid)
        window.layout.addWidget(window.insect)
        window.layout.addWidget(window.necrop)
        window.layout.addWidget(window.ogroid)
        window.layout.addWidget(window.relict)
        window.layout.addWidget(window.spirit)
        window.layout.addWidget(window.vampir)
        window.cursed.toggled.connect(window.onToggledClass)
        window.dracon.toggled.connect(window.onToggledClass)
        window.elemen.toggled.connect(window.onToggledClass)
        window.hybrid.toggled.connect(window.onToggledClass)
        window.insect.toggled.connect(window.onToggledClass)
        window.necrop.toggled.connect(window.onToggledClass)
        window.ogroid.toggled.connect(window.onToggledClass)
        window.relict.toggled.connect(window.onToggledClass)
        window.spirit.toggled.connect(window.onToggledClass)
        window.vampir.toggled.connect(window.onToggledClass)
    elif num == 1:
        window.label.setText("Чудовище - одиночка или живет в стае?")
        window.loner = QtWidgets.QRadioButton("Одиночка")
        window.flock = QtWidgets.QRadioButton("Стайное")
        window.both_ = QtWidgets.QRadioButton("Могут быть оба случая")
        window.layout.addWidget(window.loner)
        window.layout.addWidget(window.flock)
        window.layout.addWidget(window.both_)
        window.loner.toggled.connect(window.onToggledType)
        window.flock.toggled.connect(window.onToggledType)
        window.both_.toggled.connect(window.onToggledType)
    elif num == 2:
        window.label.setText("Это чудовище разумно?")
        window.no = QtWidgets.QRadioButton("Нет")
        window.ye = QtWidgets.QRadioButton("Да")
        window.layout.addWidget(window.no)
        window.layout.addWidget(window.ye)
        window.no.toggled.connect(window.onToggledSen)
        window.ye.toggled.connect(window.onToggledSen)
    elif num == 3:
        window.label.setText("Это чудовище может видоизменяться?")
        window.no = QtWidgets.QRadioButton("Нет")
        window.ye = QtWidgets.QRadioButton("Да")
        window.layout.addWidget(window.no)
        window.layout.addWidget(window.ye)
        window.no.toggled.connect(window.onToggledPoly)
        window.ye.toggled.connect(window.onToggledPoly)
    elif num == 4:
        window.label.setText("Когда чудовище наиболее активно?")
        window.day_ = QtWidgets.QRadioButton("Днем")
        window.nigh = QtWidgets.QRadioButton("Ночью")
        window.both = QtWidgets.QRadioButton("Не имеет значения")
        window.layout.addWidget(window.day_)
        window.layout.addWidget(window.nigh)
        window.layout.addWidget(window.both)
        window.day_.toggled.connect(window.onToggledAct)
        window.nigh.toggled.connect(window.onToggledAct)
        window.both.toggled.connect(window.onToggledAct)
    elif num == 5:
        window.label.setText("Где чудовище обитает?")
        window.ever = QtWidgets.QRadioButton("Практически везде")
        window.moun = QtWidgets.QRadioButton("Горы, возвышенности, пещеры")
        window.wate = QtWidgets.QRadioButton("Водоемы")
        window.rura = QtWidgets.QRadioButton("Сельская местность")
        window.wood = QtWidgets.QRadioButton("Леса")
        window.unde = QtWidgets.QRadioButton("Под Землей")
        window.ceme = QtWidgets.QRadioButton("Кладбища, поля битв")
        window.cast = QtWidgets.QRadioButton("Замки, руины")
        window.some = QtWidgets.QRadioButton("Где-то еще")
        window.layout.addWidget(window.ever)
        window.layout.addWidget(window.moun)
        window.layout.addWidget(window.wate)
        window.layout.addWidget(window.rura)
        window.layout.addWidget(window.wood)
        window.layout.addWidget(window.unde)
        window.layout.addWidget(window.ceme)
        window.layout.addWidget(window.cast)
        window.layout.addWidget(window.some)
        window.ever.toggled.connect(window.onToggledHab)
        window.moun.toggled.connect(window.onToggledHab)
        window.wate.toggled.connect(window.onToggledHab)
        window.rura.toggled.connect(window.onToggledHab)
        window.wood.toggled.connect(window.onToggledHab)
        window.unde.toggled.connect(window.onToggledHab)
        window.ceme.toggled.connect(window.onToggledHab)
        window.cast.toggled.connect(window.onToggledHab)
        window.some.toggled.connect(window.onToggledHab)
    elif num == 6:
        window.label.setText("Какую тактику чаще всего применяет в бою?")
        window.next.setText("Результат")
        window.none = QtWidgets.QRadioButton("Нет особой")
        window.disa = QtWidgets.QRadioButton("Исчезает и появляется")
        window.invi = QtWidgets.QRadioButton("Становится невидимым")
        window.summ = QtWidgets.QRadioButton("Призывает других чудовищ или зверей")
        window.stun = QtWidgets.QRadioButton("Оглушает противника")
        window.pois = QtWidgets.QRadioButton("Отравляет противника")
        window.blin = QtWidgets.QRadioButton("Ослепляет противника")
        window.heig = QtWidgets.QRadioButton("Атакует с высоты")
        window.forc = QtWidgets.QRadioButton("Атакует силами стихий")
        window.layout.addWidget(window.none)
        window.layout.addWidget(window.disa)
        window.layout.addWidget(window.invi)
        window.layout.addWidget(window.summ)
        window.layout.addWidget(window.stun)
        window.layout.addWidget(window.pois)
        window.layout.addWidget(window.blin)
        window.layout.addWidget(window.heig)
        window.layout.addWidget(window.forc)
        window.none.toggled.connect(window.onToggledAb)
        window.disa.toggled.connect(window.onToggledAb)
        window.invi.toggled.connect(window.onToggledAb)
        window.summ.toggled.connect(window.onToggledAb)
        window.stun.toggled.connect(window.onToggledAb)
        window.pois.toggled.connect(window.onToggledAb)
        window.blin.toggled.connect(window.onToggledAb)
        window.heig.toggled.connect(window.onToggledAb)
        window.forc.toggled.connect(window.onToggledAb)


def show_result(user_answers):
    pass


def main():
    app = QtWidgets.QApplication(sys.argv)
    window = Result()
    window.show()
    app.exec_()


main()