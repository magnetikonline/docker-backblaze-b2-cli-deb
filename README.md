# Backblaze B2 CLI deb Dockerfile
Creates a [Backblaze B2 CLI](https://github.com/Backblaze/B2_Command_Line_Tool) deb distribution package from latest mainline source, suitable for Ubuntu (tested with 16.04LTS) and variants.

B2 CLI tool is for use with the [Backblaze B2 Cloud Storage](https://www.backblaze.com/b2/cloud-storage.html) service.

Image has also been pushed to [Docker Hub](https://hub.docker.com/r/magnetikonline/backblazeb2clideb/).

## Usage
With Docker already installed and working on host system:

```sh
$ ./build.sh
# waiting... as Docker builds image

# or alternatively to ./build.sh:
# $ docker pull magnetikonline/backblazeb2clideb

$ ./extractdeb.sh
# package extract from container

$ ls -l backblaze_0.1-1_amd64.deb
-rw-r--r-- 1 root root 713984 Jul 6 10:06 backblaze_0.1-1_amd64.deb

$ sudo dpkg -i backblaze_0.1-1_amd64.deb
# installing package to host system...

# B2 CLI requires pip, lets install
$ sudo apt-get install python-pip

$ b2
This program provides command-line access to the B2 service.

Usages:

    b2 authorize_account [<accountId>] [<applicationKey>]
    b2 cancel_all_unfinished_large_files <bucketName>
    b2 cancel_large_file <fileId>
    b2 clear_account
    b2 create_bucket <bucketName> [allPublic | allPrivate]
    b2 delete_bucket <bucketName>
    b2 delete_file_version <fileName> <fileId>
    b2 download_file_by_id [--noProgress] <fileId> <localFileName>
    b2 download_file_by_name [--noProgress] <bucketName> <fileName> <localFileName>
    b2 get_file_info <fileId>
    b2 help [commandName]
    b2 hide_file <bucketName> <fileName>
    b2 list_buckets
    b2 list_file_names <bucketName> [<startFileName>] [<maxToShow>]
    b2 list_file_versions <bucketName> [<startFileName>] [<startFileId>] [<maxToShow>]
    b2 list_parts <largeFileId>
    b2 list_unfinished_large_files <bucketName>
    b2 ls [--long] [--versions] <bucketName> [<folderName>]
    b2 make_url <fileId>
    b2 sync [--delete] [--keepDays N] [--skipNewer] [--replaceNewer] \
        [--compareVersions <option>] [--threads N] [--noProgress] \
        [--excludeRegex <regex>] <source> <destination>
    b2 update_bucket <bucketName> [allPublic | allPrivate]
    b2 upload_file [--sha1 <sha1sum>] [--contentType <contentType>] [--info <key>=<value>]* \
        [--noProgress] [--threads N] <bucketName> <localFilePath> <b2FileName>
    b2 version

For more details on one command: b2 help <command>
```

Done.
