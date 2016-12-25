#!py

from __future__ import print_function
import sys
import os
import shutil
import glob
import subprocess


LIVETEX_INSTALL_LOC = "/usr/local/texlive/2016/bin/x86_64-linux/tlmgr"
DOWNLOAD_DIR = os.path.expanduser("~/Downloads/")
TEXMF_DIR = os.path.expanduser("~/texmf")


def install_texlive_manually():
    """
    Download texlive and install manually, but only if we can't find tlmgr.
    """
    # Get the profile file's location relative to this file
    curr_loc = os.path.dirname(os.path.realpath(__file__))
    prof_file_path = curr_loc + "/files/texlive.profile"

    if not os.path.exists(LIVETEX_INSTALL_LOC):
        subprocess.call('wget -P ' + DOWNLOAD_DIR + ' mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz', shell=True)
        subprocess.call('tar xf ' + DOWNLOAD_DIR + 'install-tl-unx.tar.gz', shell=True)
        subprocess.call('.' + DOWNLOAD_DIR + 'install-tl*/install-tl -profile ' + prof_file_path, shell=True)
        subprocess.call('rm -r ' + DOWNLOAD_DIR + 'install-tl*', shell=True)

def tlmgr_initialize():
    """
    Initialize the texlive package manager's directory structure.
    """
    if not os.path.exists(TEXMF_DIR):
        subprocess.call(LIVETEX_INSTALL_LOC + " init-usertree", shell=True)


def install_tlmgr_packages():
    """
    Install any base latex packages that are always expected to be there.
    """
    for pkg in __pillar__['latex']['tlmgr_pkgs']:
        proc = subprocess.Popen(LIVETEX_INSTALL_LOC + ' install ' + pkg, shell=True, stdout=subprocess.PIPE)

        # Only report output if it failed
        if proc.returncode != 0:
            output = proc.stdout.read()

            # AND it was not because you already have the package
            if output.find(" package already present: ") == -1:
                print(output)

def run():
    install_texlive_manually()
    tlmgr_initialize()
    install_tlmgr_packages()
    return {}
