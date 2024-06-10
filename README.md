# llvm-18.1.6_dockerfile

## Usage

Clone the repository (latest version) and enter the directory.
```
git clone --depth 1 git@github.com:offnaria/llvm-18.1.6_dockerfile.git
cd llvm-18.1.6_dockerfile
```

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
