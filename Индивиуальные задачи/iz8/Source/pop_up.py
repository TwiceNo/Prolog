# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'd:\repos\witcher\forms\pop_up.ui'
#
# Created by: PyQt5 UI code generator 5.13.2
#
# WARNING! All changes made in this file will be lost!


from PyQt5 import QtCore, QtGui, QtWidgets
import resources

class Ui_popUp(object):
    def setupUi(self, popUp):
        popUp.setObjectName("popUp")
        popUp.resize(250, 120)
        popUp.setStyleSheet("QDialog\n"
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
        self.verticalLayout = QtWidgets.QVBoxLayout(popUp)
        self.verticalLayout.setObjectName("verticalLayout")
        self.label = QtWidgets.QLabel(popUp)
        self.label.setAlignment(QtCore.Qt.AlignCenter)
        self.label.setObjectName("label")
        self.verticalLayout.addWidget(self.label)
        self.horizontalLayout = QtWidgets.QHBoxLayout()
        self.horizontalLayout.setObjectName("horizontalLayout")
        spacerItem = QtWidgets.QSpacerItem(40, 20, QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Minimum)
        self.horizontalLayout.addItem(spacerItem)
        self.ok_button = QtWidgets.QPushButton(popUp)
        self.ok_button.setEnabled(True)
        self.ok_button.setMinimumSize(QtCore.QSize(100, 23))
        self.ok_button.setStyleSheet("")
        self.ok_button.setAutoDefault(False)
        self.ok_button.setObjectName("button")
        self.horizontalLayout.addWidget(self.ok_button)
        spacerItem1 = QtWidgets.QSpacerItem(40, 20, QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Minimum)
        self.horizontalLayout.addItem(spacerItem1)
        self.verticalLayout.addLayout(self.horizontalLayout)

        self.retranslateUi(popUp)
        QtCore.QMetaObject.connectSlotsByName(popUp)

    def retranslateUi(self, popUp):
        _translate = QtCore.QCoreApplication.translate
        popUp.setWindowTitle(_translate("popUp", "Dialog"))
        self.label.setText(_translate("popUp", "Ничего не выбрано"))
        self.ok_button.setText(_translate("popUp", "OK"))
        self.ok_button.setShortcut(_translate("popUp", "Return"))

