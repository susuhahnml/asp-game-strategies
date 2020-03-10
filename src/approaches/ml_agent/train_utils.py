import os.path
import csv
from .game import Game
from py_utils.logger import log
def training_data_to_csv(file_name, training_list, game_def, new_files,extra_array=['reward','win']):
    games = {'a': Game(game_def,player_name="a"),
    "b": Game(game_def,player_name="b")}

    obs = [str(o) for o in games['a'].all_obs]
    act = [str(o) for o in games['a'].all_actions]
    COLUMN_NAMES = ["'INIT:{}'".format(o) for o in obs]
    COLUMN_NAMES.extend(act)
    COLUMN_NAMES.extend(["'NEXT:{}'".format(o) for o in obs])
    COLUMN_NAMES.extend(extra_array)
    
    try:

        exists = os.path.isfile(file_name)

        with open(file_name, new_files) as csvfile:
            writer = csv.writer(csvfile, delimiter=';')
            if new_files=="w":
                writer.writerow(COLUMN_NAMES)
            for l in training_list:
                row = []
                control = l['s_init'].control
                games[control].current_state = l['s_init']
                row.extend(games[control].current_observation)
                row.extend(games[control].mask_action(str(l['action'].action)))
                games[control].current_state = l['s_next']
                row.extend(games[control].current_observation)
                for k in extra_array:
                    row.extend([l[k]])
                writer.writerow([int(r) for r in row[:-len(extra_array)]]+[r for r in row[-len(extra_array):]])
    except IOError as e:
        log.error("Error saving csv")
        log.error(e)

def remove_duplicates_training(file_name):
    csv_file = open(file_name, "r")
    lines = csv_file.read().split("\n")
    csv_file.close()
    writer = open(file_name, "w")
    lines_set = set(lines)
    log.info("Removing duplicates in {}, from {} to {} lines".format(file_name,len(lines),len(lines_set)))
    for line in lines_set:
        writer.write(line + "\n")
    writer.close()
