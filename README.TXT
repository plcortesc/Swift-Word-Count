README.TXT

SWIFT 1 NODE

First of all, to be able to execute anything with Swift I downloaded all the data provided by the references in the assignment. 

To execute in just one node, download the data of the “quickstart guide” that you can find on:

http://swift-lang.org/guides/quickstart.html

There are some examples and all required files to be able to programme on Swift. The source code uses some additional commands that are not included in the file tc.data that is allocated on this path /swift-0.94.1/etc/, so include them.

Then the source code stays in the directory:

 /swift-0.94.1/examples/swift/wordcount 

Where you can find these files:

-	wordcount.swift (main program that is responsible of all logic)
-	wordc.sh (commissioned to count the words and how many times these appear in the text).
-	wordc2.sh (it just take the files and re-count the words of two input files that has been merged before)

To be able of executing Swift you must export the following path: 

$ export PATH=$PATH:/path/to/swift-0.94.1/bin

Before executing the wordcount, divide the input file of 10 GB into 128 chunks to divide the work and send it to the workers throw the foreach structures. To split the file is executed the following command on the shell:

$ split "-a 3" "-n 128" "-d" wiki10gb "/home/ubuntu/swift-0.94.1/examples/swift/wordcount/data/d_"

The folder data is the one that will keep the splitted input data. The files are named like this: d_000, d_001, d_002,etc. 

Finally, to run the program just type the following line:

swift wordcount.swift



SWIFT 16 NODES

This is practically the same than in one node. Just change the downloaded data from the tutorial that now is from
https://github.com/yadudoc/cloud-tutorials.git 
This is because of it is prepared to be run into a cluster. Once you have set up the cluster, create a folder called wordcount like the above 1 node swift program. 
It is required to repeat the same steps of create the folder that will contain all the source code, that is the same, and the data folder too. There is just one difference, in the folder wordcount the file “swift-conf” that defines things like the tasks per node or the initial parallel taks.

In this case, the exported path changes but just because the directories are not the same so it is going to be like this:

$ export PATH=/path/to/swift-trunk/bin:$PATH no me acuerdo del path que había que poner mas que nada porq no se que es el Swift-trunk, intuyo q es el directorio donde esta todo pero…por si las moscas dimelo que tu esto lo tienes bien memorisao!

It is needed to download the 10 GB text file again and Split it with the same command than before but changing the path, so now it is:

$ split "-a 3" "-n 128" "-d" wiki10gb "/home/ubuntu/swift-cloud-tutorial/wordcount/data/d_" 

Again, to finally run the wordcount:

$ swift wordcount.swift

