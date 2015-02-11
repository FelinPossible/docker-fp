# docker-fp
Docker file for felinpossible

Build and run:

```
git clone https://github.com/bboutier/docker-fp.git
cd docker-fp
sudo docker build -t bboutier/docker-fp .
sudo docker run -i -d -p 8083:80 -v [location_to_msql_files]:/var/lib/mysql -v [location_to_fp_sources]:/var/www/felinpossible bboutier/docker-fp
````

Wait few seconds (time to create the db the first time) and then, go to http://localhost:8083

Source code of fp located here: https://github.com/bboutier/felinpossible.git