import configparser
import yaml


def read_yaml_file(file_path):
    with open(file_path) as f:
        data = yaml.safe_load(f)
    return data

def read_env_file(file_path):
    config = configparser.ConfigParser()
    config.read(file_path)
    return config

# read_env_file('.env')
