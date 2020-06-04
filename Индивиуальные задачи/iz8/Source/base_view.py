# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'd:\repos\witcher\forms\base_view.ui'
#
# Created by: PyQt5 UI code generator 5.13.2
#
# WARNING! All changes made in this file will be lost!


from PyQt5 import QtCore, QtGui, QtWidgets
import resources

class Ui_Dialog(object):
    def setupUi(self, Dialog):
        Dialog.setObjectName("Dialog")
        Dialog.resize(970, 500)
        Dialog.setStyleSheet("QDialog\n"
"{\n"
"    \n"
"    border-image: url(:/Backgrounds/books.png);\n"
"}")
        self.verticalLayout = QtWidgets.QVBoxLayout(Dialog)
        self.verticalLayout.setObjectName("verticalLayout")
        self.tableView = QtWidgets.QTableWidget(Dialog)
        self.tableView.setStyleSheet("QTableWidget\n"
"{\n"
"    border-image: url(:/Backgrounds/transparent.png);\n"
"    font: 81 10pt \"GWENT\";\n"
"    color: rgb(247, 247, 247);\n"
"}")
        self.tableView.setObjectName("tableView")
        self.tableView.setColumnCount(8)
        self.tableView.setRowCount(0)
        item = QtWidgets.QTableWidgetItem()
        font = QtGui.QFont()
        font.setFamily("GWENT")
        font.setBold(True)
        font.setWeight(75)
        item.setFont(font)
        self.tableView.setHorizontalHeaderItem(0, item)
        item = QtWidgets.QTableWidgetItem()
        font = QtGui.QFont()
        font.setFamily("GWENT")
        font.setBold(True)
        font.setWeight(75)
        item.setFont(font)
        self.tableView.setHorizontalHeaderItem(1, item)
        item = QtWidgets.QTableWidgetItem()
        font = QtGui.QFont()
        font.setFamily("GWENT")
        font.setBold(True)
        font.setWeight(75)
        item.setFont(font)
        self.tableView.setHorizontalHeaderItem(2, item)
        item = QtWidgets.QTableWidgetItem()
        font = QtGui.QFont()
        font.setFamily("GWENT")
        font.setBold(True)
        font.setWeight(75)
        item.setFont(font)
        self.tableView.setHorizontalHeaderItem(3, item)
        item = QtWidgets.QTableWidgetItem()
        font = QtGui.QFont()
        font.setFamily("GWENT")
        font.setBold(True)
        font.setWeight(75)
        item.setFont(font)
        self.tableView.setHorizontalHeaderItem(4, item)
        item = QtWidgets.QTableWidgetItem()
        font = QtGui.QFont()
        font.setFamily("GWENT")
        font.setBold(True)
        font.setWeight(75)
        item.setFont(font)
        self.tableView.setHorizontalHeaderItem(5, item)
        item = QtWidgets.QTableWidgetItem()
        font = QtGui.QFont()
        font.setFamily("GWENT")
        font.setBold(True)
        font.setWeight(75)
        item.setFont(font)
        self.tableView.setHorizontalHeaderItem(6, item)
        item = QtWidgets.QTableWidgetItem()
        font = QtGui.QFont()
        font.setFamily("GWENT")
        font.setBold(True)
        font.setWeight(75)
        item.setFont(font)
        self.tableView.setHorizontalHeaderItem(7, item)
        self.verticalLayout.addWidget(self.tableView)
        self.horizontalLayout = QtWidgets.QHBoxLayout()
        self.horizontalLayout.setObjectName("horizontalLayout")
        spacerItem = QtWidgets.QSpacerItem(40, 20, QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Minimum)
        self.horizontalLayout.addItem(spacerItem)
        self.ok_button = QtWidgets.QPushButton(Dialog)
        self.ok_button.setMinimumSize(QtCore.QSize(100, 23))
        self.ok_button.setStyleSheet("QPushButton\n"
"{\n"
"    font: 81 8pt \"GWENT\";\n"
"    color: rgb(247,247,247);\n"
"    border-image: url(:/Button/off);\n"
"}\n"
"\n"
"QPushButton:hover:!pressed\n"
"{\n"
"    font: 81 8pt \"GWENT\";\n"
"    color: rgb(247,247,247);\n"
"    border-image: url(:/Button/hover);\n"
"}\n"
"\n"
"QPushButton:pressed\n"
"{\n"
"    font: 81 8pt \"GWENT\";\n"
"    color: rgb(17,17,17);\n"
"    border-image: url(:/Button/on);\n"
"}\n"
"\n"
"QPushButton:disabled\n"
"{\n"
"    font: 81 8pt \"GWENT\";\n"
"    color: rgb(255, 255, 255);\n"
"    border-image: url(:/Button/disabled);\n"
"}")
        self.ok_button.setObjectName("button")
        self.horizontalLayout.addWidget(self.ok_button)
        self.verticalLayout.addLayout(self.horizontalLayout)

        self.retranslateUi(Dialog)
        QtCore.QMetaObject.connectSlotsByName(Dialog)

    def retranslateUi(self, Dialog):
        _translate = QtCore.QCoreApplication.translate
        Dialog.setWindowTitle(_translate("Dialog", "Dialog"))
        item = self.tableView.horizontalHeaderItem(0)
        item.setText(_translate("Dialog", "Название"))
        item = self.tableView.horizontalHeaderItem(1)
        item.setText(_translate("Dialog", "Класс"))
        item = self.tableView.horizontalHeaderItem(2)
        item.setText(_translate("Dialog", "Тип"))
        item = self.tableView.horizontalHeaderItem(3)
        item.setText(_translate("Dialog", "Разумность"))
        item = self.tableView.horizontalHeaderItem(4)
        item.setText(_translate("Dialog", "Полиморфия"))
        item = self.tableView.horizontalHeaderItem(5)
        item.setText(_translate("Dialog", "Период активности"))
        item = self.tableView.horizontalHeaderItem(6)
        item.setText(_translate("Dialog", "Место обитания"))
        item = self.tableView.horizontalHeaderItem(7)
        item.setText(_translate("Dialog", "Тактика"))
        self.ok_button.setText(_translate("Dialog", "OK"))

