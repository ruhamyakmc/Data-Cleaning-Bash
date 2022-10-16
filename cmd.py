import os
import subprocess
import os

def run_cmd(cmd):
    p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    out, err = p.communicate()
    return out, err

def build_cmd():
    cmd = ['bash', 'data_cleaning.sh']
    return cmd

def main():
    cmd = build_cmd()
    out, err = run_cmd(cmd)
    print(out)
    print(err)

if __name__ == '__main__':
    main()
