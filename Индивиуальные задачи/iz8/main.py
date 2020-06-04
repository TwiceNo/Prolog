import sys, window_classes
from PyQt5 import QtWidgets


def main():
    app = QtWidgets.QApplication(sys.argv)
    window = window_classes.MainApp()
    window.show()
    app.exec_()


if __name__ == "__main__":
    main()