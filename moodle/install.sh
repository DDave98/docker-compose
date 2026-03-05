git clone -b MOODLE_405_STABLE https://github.com/moodle/moodle.git moodle-code
mkdir moodle_data
chmod 777 moodle_data
docker compose -f moodle.yml up -d
