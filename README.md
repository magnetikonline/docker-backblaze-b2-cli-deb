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

$ ls -l backblaze-cli_0.7.2-1_amd64.deb
-rw-r--r-- 1 root root 1223270 Apr 30 20:25 backblaze-cli_0.7.2-1_amd64.deb

$ sudo dpkg -i backblaze-cli_0.7.2-1_amd64.deb
# installing package to host system...

# B2 CLI requires pip, lets install
$ sudo apt-get install python-pip

$ b2
This program provides command-line access to the B2 service.

Usages:

    b2 authorize-account [<accountId>] [<applicationKey>]
    b2 cancel-all-unfinished-large-files <bucketName>
    b2 cancel-large-file <fileId>
    b2 clear-account
    b2 create-bucket [--bucketInfo <json>] [--lifecycleRules <json>] <bucketName> [allPublic | allPrivate]
    b2 delete-bucket <bucketName>
    b2 delete-file-version [<fileName>] <fileId>
    b2 download-file-by-id [--noProgress] <fileId> <localFileName>
    b2 download-file-by-name [--noProgress] <bucketName> <fileName> <localFileName>
    b2 get-account-info
    b2 get-bucket <bucketName>
    b2 get-download-auth [--prefix <fileNamePrefix>] [--duration <durationInSeconds>] <bucketName>
    b2 get-file-info <fileId>
    b2 help [commandName]
    b2 hide-file <bucketName> <fileName>
    b2 list-buckets
    b2 list-file-names <bucketName> [<startFileName>] [<maxToShow>]
    b2 list-file-versions <bucketName> [<startFileName>] [<startFileId>] [<maxToShow>]
    b2 list-parts <largeFileId>
    b2 list-unfinished-large-files <bucketName>
    b2 ls [--long] [--versions] <bucketName> [<folderName>]
    b2 make-url <fileId>
    b2 sync [--delete] [--keepDays N] [--skipNewer] [--replaceNewer] \
        [--compareVersions <option>] [--threads N] [--noProgress] \
        [--excludeRegex <regex> [--includeRegex <regex>]] [--dryRun] \
        <source> <destination>
    b2 update-bucket [--bucketInfo <json>] [--lifecycleRules <json>] <bucketName> [allPublic | allPrivate]
    b2 upload-file [--sha1 <sha1sum>] [--contentType <contentType>] \
        [--info <key>=<value>]* [--minPartSize N] \
        [--noProgress] [--threads N] <bucketName> <localFilePath> <b2FileName>
    b2 version

For more details on one command: b2 help <command>
```

Done.
