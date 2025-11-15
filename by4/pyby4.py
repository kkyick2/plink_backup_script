import os,sys
import subprocess
import argparse, logging
from datetime import datetime

SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
BY4EXE_PATH = "C:/Users/jackyyick/projects_local/BCompare64_v422/BCompare.exe"
SETTING_PATH = os.path.join(os.path.dirname(__file__),'by4_setting.txt').replace("\\","/")
log = logging.getLogger(__name__)

def setup_logging(level: int = logging.INFO) -> None:
    """Configure console logging."""
    logging.basicConfig(
        level=level,
        format="%(levelname)-8s | %(message)s",
        stream=sys.stdout,
    )


def get_datetime() -> str:
    """Return current timestamp as 'YYYYMMDD_HHMM' – e.g. 20251103_1713"""
    return datetime.now().strftime("%Y%m%d_%H%M")


def run_bcompare(exe,setting,before,after,title,outpath) -> int:
    r'''
    Execute BCompare.exe with arguments. example:
        ### EXE_PATH: C:/Users/jackyyick/projects_local/BCompare64_v422/BCompare.exe
        ### SETTING : C:/Users/jackyyick/projects_local/plink_backup_script/by4/by4_setting.txt
        ### Before: ..\lab_lhk2_fw_20251102_0119
        ### After: ..\lab_lhk2_fw_20251102_0122
        ### Title: diff
        ### outpath: C:\Users\jackyyick\projects_local\plink_backup_script\diff.html

        Returns int: Exit code from BCompare.exe
        REMARK: bcompare is a window program, the path syntex should be '/' Slash, NOT "\" Backslash
    '''
    
    cmd = [str(exe),f"@{setting}",before,after,title,outpath]
    log.info("Executing BCompare:")
    for i, arg in enumerate(cmd, 1):
        log.info("  [%d] %s", i, arg)
    completed = subprocess.run(cmd, shell=False)
    if completed.returncode != 0:
        log.error("BCompare failed with exit code: %d", completed.returncode)
    else:
        log.info("HTML report generated: %s", outpath)
    return completed.returncode


def process_input_run_by4(before, after, title, out):
    '''
        run BCompare.exe for folder and files compare
        title = title_datetime
        outpath = "out\title_datetime.html"
    '''
    datetime_now = get_datetime()
    title = f"{title}_{datetime_now}"
    outpath = os.path.join(out,title + ".html")

    print(f'##############################################')
    print(f'### EXE_PATH: {BY4EXE_PATH}')
    print(f'### SETTING : {SETTING_PATH}')
    print(f'### Before: {before}')
    print(f'### After: {after}')
    print(f'### Title: {title}')
    print(f'### html_path: {outpath}')

    run_bcompare(BY4EXE_PATH, SETTING_PATH, before, after, title, outpath)
    return


if __name__ == "__main__":
    # example:
    # python by4\pyby4.py lab_lhk2_fw_20251102_0119 lab_lhk2_fw_20251102_0122 -t diff_report -o C:\Users\jackyyick\Desktop
    parser = argparse.ArgumentParser()

    default_outfolder = os.path.normpath(os.path.join(SCRIPT_DIR, '..'))
    
    parser.add_argument("before", help="before folder path")
    parser.add_argument("after", help="after folder path")
    parser.add_argument("-t", "--title", help="html title", default="diff_report")
    parser.add_argument("-o", "--out", help="output folder path", default=default_outfolder)
    args = parser.parse_args()

    arg1 = args.before
    arg2 = args.after
    arg3 = args.title
    arg4 = args.out

    process_input_run_by4(arg1,arg2,arg3,arg4)