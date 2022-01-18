import sys
import numpy as np
import logging
import requests
from bs4 import BeautifulSoup
from webdriver_manager.chrome import ChromeDriverManager


def get_chrome_version():
    manager = ChromeDriverManager(log_level=logging.WARNING)
    version_message = manager.driver.get_version()

    version = version_message.split('\n')[-1]
    return version


def get_chromedriver_binary_version_list():
    URL = 'https://pypi.org/project/chromedriver-binary/#history'

    TARGET_CLASS = [
        "release release--latest release--current",
        "release",
        "release release--oldest"
    ]

    html = requests.get(URL)
    html_soup = BeautifulSoup(html.content, "html.parser")

    timeline_soup = html_soup.find(class_="release-timeline")

    release_soups = []
    for cls in TARGET_CLASS:
        release_soups.extend(html_soup.find_all(class_=cls))

    versions = [soup.find(class_="release__version").text.strip() for soup in release_soups]
    return versions


def get_nearly_chromedriver_binary_version(chrome_version, binary_versions):

    def indices_of_the_nearest(data, value):
        distance = np.abs(np.array(data) - value)
        indices = np.where(distance == np.min(distance))[0]
        return indices.tolist()
    
    def convert(string):
        try:
            value = int(string)
        except:
            value = sys.maxint        
        return value
    
    def search(cvt_chrome_version, cvt_target_versions, ver_idx=0):
        
        source_value = convert(cvt_chrome_version[ver_idx])
        target_values = [convert(ver[ver_idx]) for ver in cvt_target_versions]

        result_indexs = indices_of_the_nearest(target_values, source_value)

        next_target_versions = [cvt_target_versions[idx] for idx in result_indexs]

        if len(next_target_versions) >= 2:
            next_target_versions = search(cvt_chrome_version, next_target_versions, ver_idx + 1)

        return next_target_versions

    
    cvt_chrome_version = chrome_version.split('.')
    cvt_binary_versions = [ver.split('.') for ver in binary_versions]

    cvt_nearly_versions = search(cvt_chrome_version, cvt_binary_versions)
    nearly_version = '.'.join(cvt_nearly_versions[0])
    return nearly_version


if __name__ == '__main__':

    chrome_version = get_chrome_version()
    print('/'*20)
    print(f'--- current chrome version --- \n{chrome_version}\n')

    binary_versions = get_chromedriver_binary_version_list()
    print(f'--- release chromedriver_binary_version version --- \n{binary_versions}\n')

    nearly_version = get_nearly_chromedriver_binary_version(chrome_version, binary_versions)
    print(f'--- nearly chromedriver_binary_version version --- \n{nearly_version}')
    print('/'*20)

    with open('chromedriver_binary_version.txt', 'w') as f:
        f.write(nearly_version)
