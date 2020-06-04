# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'd:\repos\witcher\forms\add_picture.ui'
#
# Created by: PyQt5 UI code generator 5.13.2
#
# WARNING! All changes made in this file will be lost!


from PyQt5 import QtCore, QtGui, QtWidgets
import resources

class Ui_Dialog(object):
    def setupUi(self, Dialog):
        Dialog.setObjectName("Dialog")
        Dialog.resize(400, 200)
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
        sizePolicy = QtWidgets.QSizePolicy(QtWidgets.QSizePolicy.Preferred, QtWidgets.QSizePolicy.Fixed)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.label.sizePolicy().hasHeightForWidth())
        self.label.setSizePolicy(sizePolicy)
        self.label.setMinimumSize(QtCore.QSize(0, 130))
        self.label.setAlignment(QtCore.Qt.AlignCenter)
        self.label.setObjectName("label")
        self.verticalLayout.addWidget(self.label)
        self.horizontalLayout = QtWidgets.QHBoxLayout()
        self.horizontalLayout.setObjectName("horizontalLayout")
        spacerItem = QtWidgets.QSpacerItem(40, 20, QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Minimum)
        self.horizontalLayout.addItem(spacerItem)
        self.file_view = QtWidgets.QPushButton(Dialog)
        sizePolicy = QtWidgets.QSizePolicy(QtWidgets.QSizePolicy.Fixed, QtWidgets.QSizePolicy.Fixed)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.file_view.sizePolicy().hasHeightForWidth())
        self.file_view.setSizePolicy(sizePolicy)
        self.file_view.setMinimumSize(QtCore.QSize(100, 23))
        self.file_view.setObjectName("file_view")
        self.horizontalLayout.addWidget(self.file_view)
        self.later = QtWidgets.QPushButton(Dialog)
        sizePolicy = QtWidgets.QSizePolicy(QtWidgets.QSizePolicy.Fixed, QtWidgets.QSizePolicy.Fixed)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.later.sizePolicy().hasHeightForWidth())
        self.later.setSizePolicy(sizePolicy)
        self.later.setMinimumSize(QtCore.QSize(100, 23))
        self.later.setObjectName("later")
        self.horizontalLayout.addWidget(self.later)
        spacerItem1 = QtWidgets.QSpacerItem(40, 20, QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Minimum)
        self.horizontalLayout.addItem(spacerItem1)
        self.verticalLayout.addLayout(self.horizontalLayout)

        self.retranslateUi(Dialog)
        QtCore.QMetaObject.connectSlotsByName(Dialog)

    def retranslateUi(self, Dialog):
        _translate = QtCore.QCoreApplication.translate
        Dialog.setWindowTitle(_translate("Dialog", "Dialog"))
        self.label.setText(_translate("Dialog", "<html><head/><body><p>Хотите добавить картинку?</p><p>Позже это можно будет сделать самостоятельно</p></body></html>"))
        self.file_view.setText(_translate("Dialog", "Обзор"))
        self.later.setText(_translate("Dialog", "Позже"))

