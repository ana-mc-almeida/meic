find . -name ".terraform" -exec rm -r .terraform '{}' \;

cd Quarkus-project
./mvnw clean
cd ..
