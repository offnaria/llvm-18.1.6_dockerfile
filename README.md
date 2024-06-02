# llvm-18.1.6_dockerfile

## Usage

Build a container.
```
sudo docker build . -t llvm_18_1_6
```

Start the container.
```
sudo docker run -it -d --name i_llvm_18_1_6 llvm_18_1_6
```

Enter the container.
```
sudo docker exec -it i_llvm_18_1_6 bash
```
