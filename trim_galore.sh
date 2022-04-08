### trim_galore 
-q threads
--phred33 使用ACSII +33质量值作为phred得分
--length 去除长度小于参数值的reads
-e 允许的最大误差
--stringency 设置与接头重叠的序列
--paired 双端测序文件质控都通过才保留
-o output_dirctory
fastq1 
fastq2


### shell
cat config.raw |while read id;
do echo $id
arr = ($id)
fq2 = ${arr[2]}
fq1 = ${arr[1]}
sample = ${arr[0]}
nohup trim_galore -q 25 --phred33 --length 35 -e 0.1 --stringency 4 --paired -o clean $fq1 $fq2 &
done


