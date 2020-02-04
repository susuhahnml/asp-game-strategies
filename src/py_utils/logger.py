import logging

formatter = logging.Formatter('%(message)s')
logger = logging.getLogger('general')
logger.setLevel(logging.DEBUG)
logger.handlers.clear()
logger.propagate = False
console_handler = logging.StreamHandler()
console_handler.setLevel(logging.INFO)
fmt = '%(message)s'
formatter = logging.Formatter(fmt)
console_handler.setFormatter(formatter)
logger.addHandler(console_handler) 


class bcolors:
    REF = '\033[90m'
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'


class Log:

    def __init__(self):
        self.info = lambda m: logger.info("\n{}INFO:  {}{}".format(
            bcolors.OKGREEN,
            bcolors.ENDC,
            str(m).replace('\n','\n\t\t')))
        self.debug = lambda m: logger.debug("\n{}DEBUG: {}{}".format(
            bcolors.OKBLUE,
            bcolors.ENDC,
            str(m).replace('\n','\n\t\t')))
        self.error = lambda m: logger.error("\n{}ERROR: {}{}".format(
            bcolors.FAIL,
            bcolors.ENDC,
            str(m).replace('\n','\n\t\t')))
   
    @staticmethod
    def set_level(level):
        n_level = getattr(logging, level.upper(), None)
        logger.setLevel(n_level)
        console_handler.setLevel(n_level)

log = Log()