#/usr/bin

DEFAULT_RESULTS_DIR="./results"

python3.7 -m robot -v BROWSER:safari -v REMOTE_URL:http://localhost:4444 --log none --report none --outputdir ${DEFAULT_RESULTS_DIR} tests/browser.robot
