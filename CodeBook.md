labeldata:  activity labels table from "UCI HAR Dataset/activity_labels.txt"
            活动表，每个数字索引对应的活动名称说明

labelnames: a vector contain activity labelnames from labeldata
            包含6种活动名称的向量

testdata:   dataset form X_test.txt
            test 原始数据集

testActivity:   one col dataset for testdata activity label index from Y_test.txt
                or change to activity label names in for loop;
                从Y_test.txt活动名称索引数据集，或者是在后面for循环中赋值的活动名称数据集；


testIds:    volunteers ID for testdata from subject_test.txt
            从subject_test.txt中读取的, testdata数据集中的数据对应的志愿者ID数据集

testActindex:   a vector for testdata activity index from testActivity
                从testActivity中获取的各个活动名称索引组成的向量

testData:   test dataset contain ID activity and original testdata
            包含志愿者ID, 活动名称, 原始test 数据集所组成的 test 新的数据集

traindata:  dataset form X_train.txt
            train 原始数据集

trainActivity:  one col dataset for traindata activity label index from Y_train.txt
                or change to activity label names in for loop;
                从Y_train.txt活动名称索引数据集，或者是在后面for循环中赋值的活动名称数据集；

trainIds:   volunteers ID for testdata from subject_train.txt
            从subject_train.txt中读取的, traindata数据集中的数据对应的志愿者ID数据集

trainActindex: a vector for traindata activity index from trainActivity
               从trainActivity中获取的各个活动名称索引组成的向量

trainData:  train dataset contain ID activity and original traindata
            包含志愿者ID, 活动名称, 原始train 数据集所组成的 train 新的数据集

features:   all features from features.txt
            从features.txt读取的数据集的特征说明

featureNames:   a vector of all features name
                包含所有特征说明的向量, 也就是各个列名

dataSet:    merge testData and trainData to one dataset.
            testData和trainData合并而成的一个数据集

meancol:    logical vector for which feature name contain "mean()"
            存储所有包含mean(),也就是测量平均值的列的向量
stdcol:     logical vector for which feature name contain "std()"
            存储所有包含std(),也就是测量标准差的列的向量
meansdcol:  logical vector for which feature name contain "mean()" or "std()"
            存储所有包含mean()或者std(),也就是测量平均值的列或者是测量标准差的列的向量

subDatameansd:  only the measurements on the mean and standard deviation for each measurement.
                从数据集dataSet中截取的仅包含测量平均值和测量标准差的数据集

subDataMeanSd:  add ID column and Activity column to subDatameansd in col 1 and col 2
                在上一个数据集的基础上添加了 志愿者ID列和活动名称列
meansdcol:  set column 1 and column 2 is TRUE
            逻辑类向量meansdcol, 将ID列和Activity列是否取值设置为TRUE

subDataMeanSd:  add column name from featrueNames
                增加数据集的列名, 也就是描述性变量名称

dataMean:   data set with the average of each variable for each activity and each subject.
            针对每个志愿者,每个不同的活动,算出各个feature的平均值。
