# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'd:\repos\witcher\forms\add_picture.ui'
#
# Created by: PyQt5 UI code generator 5.13.2
#
# WARNING! All changes made in this file will be lost!


from PyQt5 import QtCore, QtGui, QtWidgets


class Ui_Dialog(object):
    def setupUi(self, Dialog):
        Dialog.setObjectName("Dialog")
        Dialog.resize(388, 209)
        Dialog.setStyleSheet("QDialog\n"
"{\n"
"    border-image: url(:/Backgrounds/quarter-fiend.png);\n"
"}\n"
"\n"
"QLabel \n"
"{\n"
"    color: rgb(247,247,247);\n"
"    font: 81 12pt \"GWENT\";\n"
"}\n"
"\n"
"QPushButton\n"
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
        self.verticalLayout = QtWidgets.QVBoxLayout(Dialog)
        self.verticalLayout.setObjectName("verticalLayout")
        self.label = QtWidgets.QLabel(Dialog)
        self.label.setAlignment(QtCore.Qt.AlignCenter)
        self.label.setObjectName("label")
        self.verticalLayout.addWidget(self.label)
        self.horizontalLayout_2 = QtWidgets.QHBoxLayout()
        self.horizontalLayout_2.setObjectName("horizontalLayout_2")
        self.lineEdit = QtWidgets.QLineEdit(Dialog)
        sizePolicy = QtWidgets.QSizePolicy(QtWidgets.QSizePolicy.MinimumExpanding, QtWidgets.QSizePolicy.Fixed)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.lineEdit.sizePolicy().hasHeightForWidth())
        self.lineEdit.setSizePolicy(sizePolicy)
        self.lineEdit.setMinimumSize(QtCore.QSize(250, 30))
        font = QtGui.QFont()
        font.setFamily("GWENT")
        font.setPointSize(11)
        font.setBold(True)
        font.setWeight(75)
        self.lineEdit.setFont(font)
        self.lineEdit.setObjectName("lineEdit")
        self.horizontalLayout_2.addWidget(self.lineEdit)
        self.file_view = QtWidgets.QPushButton(Dialog)
        self.file_view.setMinimumSize(QtCore.QSize(75, 23))
        self.file_view.setObjectName("file_view")
        self.horizontalLayout_2.addWidget(self.file_view)
        self.verticalLayout.addLayout(self.horizontalLayout_2)
        self.horizontalLayout = QtWidgets.QHBoxLayout()
        self.horizontalLayout.setObjectName("horizontalLayout")
        spacerItem = QtWidgets.QSpacerItem(40, 20, QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Minimum)
        self.horizontalLayout.addItem(spacerItem)
        self.ok_button = QtWidgets.QPushButton(Dialog)
        self.ok_button.setMinimumSize(QtCore.QSize(100, 23))
        self.ok_button.setObjectName("ok_button")
        self.horizontalLayout.addWidget(self.ok_button)
        spacerItem1 = QtWidgets.QSpacerItem(40, 20, QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Minimum)
        self.horizontalLayout.addItem(spacerItem1)
        self.verticalLayout.addLayout(self.horizontalLayout)

        self.retranslateUi(Dialog)
        QtCore.QMetaObject.connectSlotsByName(Dialog)

    def retranslateUi(self, Dialog):
        _translate = QtCore.QCoreApplication.translate
        Dialog.setWindowTitle(_translate("Dialog", "Dialog"))
        self.label.setText(_translate("Dialog", "Добавьте картинку\n"
"(это можно сделать позже самостоятельно)"))
        self.file_view.setText(_translate("Dialog", "Обзор"))
        self.ok_button.setText(_translate("Dialog", "OK"))
import Resources_rc
