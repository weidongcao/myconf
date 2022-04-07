SELECT
    count(getup is not null or null) as '天数(天)',
    TIME_FORMAT(SEC_TO_TIME(sum(TIME_TO_SEC(getup)) / count(getup is not null or null)),'%H:%i:%s') as '平均起床时间',
    count(getup is null or null) as '通宵(次)',
    count( getup >='04:00:00' AND getup <'05:00:00' OR NULL ) AS '4到5点(次)',
    count( getup >='05:00:00' AND getup <'05:30:00' OR NULL ) AS '5点到5点半(次)',
    count( getup >='05:30:00' AND getup <'06:00:00' OR NULL ) AS '5点半到6点(次)',
    count( getup >='06:00:00' AND getup <='06:30:00' OR NULL ) AS '6点到6点半(次)',
    count( getup >'06:30:00' OR NULL ) AS '6点半以后(次)'
FROM
    getup
WHERE
    gdate >= '2019-07-01'
    AND gdate < '2019-08-01';
