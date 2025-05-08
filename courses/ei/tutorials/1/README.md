Copy and paste the following into ~/.aws/credentials

## Useful commands:

## Change .pem file permissions
```bash
chmod u=rwx,g=,o= myKeyAWS.pem
```

### Transfer files from your machine to your AWS instance
```bash
scp -i my-key-pair.pem /path/SampleFile.txt ec2-user@c2-198-51-100-1.compute-1.amazonaws.com:~
```

### Transfer files from your AWS instance to your machine
```bash
scp -i my-key-pair.pem ec2-user@ec2-198-51-100-1.compute-1.amazonaws.com:~/SampleFile.txt ~/SampleFile2.txt
```