import sys, untitled, pyswip
from PyQt5 import QtWidgets

class App(QtWidgets.QMainWindow, untitled.Ui_MainWindow):
    current_question, current_answer = 1, -1
    akinator = pyswip.Prolog("akinator.pl")
    def __init__(self):
        super().__init__()
        self.setupUi(self)

        self.start.clicked.connect(self.show_question)

    def show_question(self):
        setup_new_form()
        if self.current_question == 1:
            continue_set_uping()

def main():
   app = QtWidgets.QApplication(sys.argv)
   window = App()
   window.show()
   app.exec_()


if __name__ == "__main__":

    main()