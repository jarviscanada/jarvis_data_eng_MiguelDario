# Introduction
The purpose of this project is to evaluate the performance of various components of Apache Hadoop such as MapReduce, YARN, and Hive when analyzing big data. The Hadoop clusters were provisioned using Google Cloud Platform and contains a master node, and 2 data nodes. The dataset being analyzed is from the World Bank that describes various country indicators, and the year it was achieved. The file size is around 2.2GB, and there are around 22 million rows of data. Because of the file size, it is optimal to analyze the data using software such as Hadoop rather than Python, SAP, or R.
# Hadoop Cluster
## Cluster architecture
![Cluster Architecture](assets/Hadoop_Cluster_Architecture.png)
## Cluster specifications
- 1 master node
- 2 worker nodes
- 2 CPUS for each node
- 12GB RAM per node
- 4 YARN cores
- 12 GB of YARN memory

## Data tools used
- NameNode: Also known as the master node. Executes all the actions in a file system, and stores the metadata
- DataNode: Also known as the slave node. Stores and retrieves blocks of data as instructed by the NameNode.
- Hive: An SQL-Like language used to query data using Apache Hadoop
- MapReduce: A programming model used to analyze big data. It consists of two components, that mapper, and reducer
- HDFS: Stands for Hadoop Distributed File System. A distributed file system that is designed to store a large amount of information in terabytes and petabytes. 
- Zeppelin Notebook: Web-based notebook that enables interactive data driven analytics with SQL, Scala, Python, R, and others
- YARN: Stands for: Yet Another Resource Negotiator. Hadoops's cluster resource management system
- Metastore: Central repository of Hive metadata
# Hive Project
![Zeppelin Screenshot](assets/zeppelin.png)
Due to the size of the data being analyzed, queries can take a long time to run. Because of this, it is best to optimize the queries. The following measures were done in order to optimize the queries
- Partition by year in order to Select the data that is actually needed instead of the whole dataset when filtering using the WHERE clause. By doing this, the query runtime was 21 seconds, 1 minute and 19 seconds faster than the original query which took 1 minute and 40 seconds to run
- Loading the data into the HDFS in order to maximize efficiency
- Partition by column using Parquet. The benefits of using parquet are that it saves on cloud storage space by using column-wide compression, and increased data performance throuh data skipping which fetch specific column values rather than the entire row of data. 
# Improvements
- Familiarize myself better with HiveQL syntax such as SerDe and Partitions. 
- Add more worker nodes in order to enhance query execution time.
- Further partitioning into buckets for more efficient queries.
- Partion by country.
