unit ChnCalendarUse;
//Download by http://www.codefans.net
interface

uses Windows, SysUtils, Controls, Classes, DateUtils;

const
  CnMonthStr: array[1..12] of string = (
    '��', '��', '��', '��', '��', '��', '��', '��', '��', 'ʮ',
    '��', '��');
  CnDayStr: array[1..30] of string = (
    '��һ', '����', '����', '����', '����',
    '����', '����', '����', '����', '��ʮ',
    'ʮһ', 'ʮ��', 'ʮ��', 'ʮ��', 'ʮ��',
    'ʮ��', 'ʮ��', 'ʮ��', 'ʮ��', '��ʮ',
    'إһ', 'إ��', 'إ��', 'إ��', 'إ��',
    'إ��', 'إ��', 'إ��', 'إ��', '��ʮ');
  CnYearNumber: array[1..529] of string = (
    '-2069,45,0,��,��,,��', '-2024,10,0,��,��,,��', '-2014,25,0,��,̫��,,̫��',
    '-1986,14,0,��,�ٿ�,,�ٿ�', '-1972,28,0,��,��,,��', '-1944,2,0,��,����,,����',
    '-1942,38,0,��,���,,���', '-1904,21,0,��,�ٿ�,,�ٿ�', '-1883,17,0,��,��,,��',
    '-1866,26,0,��,��,,��', '-1840,18,0,��,â,,â', '-1822,16,0,��,й,,й',
    '-1806,59,0,��,����,,����', '-1747,21,0,��,��,,��', '-1726,21,0,��,��,,��',
    '-1705,31,0,��,�׼�,,�׼�', '-1674,11,0,��,��,,��', '-1663,11,0,��,��,,��',
    '-1652,53,0,��,��,,��', '-1599,11,0,��,��̫��,��,����', '-1588,1,0,��,�̴���,̫��,�̴���',
    '-1587,2,0,��,����,��ʤ,���', '-1585,4,0,��,ܲ��,��ӹ,����', '-1581,12,0,��,̫��,����,̫��',
    '-1569,29,0,��,����,��Ѥ,�ֶ�', '-1540,25,0,��,����,�ӱ�,̫��', '-1515,17,0,��,����,�Ӹ�,С��',
    '-1498,13,0,��,Ԫ��,����,Ӻ��', '-1485,75,0,��,����,�Ӂ�,̫��', '-1410,11,0,��,Т����,��ׯ,�ٶ�',
    '-1399,15,0,��,˼��,�ӷ�,����', '-1384,9,0,��,ǰƽ��,����,�Ӂ���', '-1375,19,0,��,����,����,����',
    '-1356,16,0,��,����,�ӵ�,����', '-1340,5,0,��,����,����,�ּ�', '-1335,9,0,��,ׯ��,����,�涡',
    '-1326,6,0,��,����,�Ӹ�,�ϸ�', '-1320,7,0,��,����,�Ӻ�,����', '-1313,42,0,��,����,��Ѯ,�̸�',
    '-1271,21,0,��,����,����,С��', '-1250,1,0,��,����,����,С��', '-1249,59,0,��,����,����,�䶡',
    '-1190,2,0,��,��ƽ��,��Ծ,���', '-1188,33,0,��,����,����,���', '-1155,8,0,��,����,����,����',
    '-1147,1,0,��,����,����,����', '-1146,35,0,��,����,����,����', '-1111,11,0,��,����,����,�Ķ�',
    '-1100,26,0,��,����,����,����', '-1074,29,0,��,����,����,����', '-1045,4,0,����,����,����,����',
    '-1041,22,0,����,����,����,����', '-1019,25,0,����,����,����,����', '-994,19,0,����,����,���,����',
    '-975,54,0,����,����,����,����', '-921,23,0,����,����,����,����', '-898,8,0,����,ܲ��,����,ܲ��',
    '-890,6,0,����,Т��,���ٷ�,Т��', '-884,8,0,����,����,����,����', '-876,36,0,����,����,����,����',
    '-840,14,0,����,����,����,����', '-826,46,0,����,����,����,����', '-780,11,0,����,����,������,����',
    '-769,51,0,����,ƽ��,���˾�,ƽ��', '-718,23,0,����,����,����,����', '-695,15,0,����,ׯ��,��٢,ׯ��',
    '-680,5,0,����,���,������,���', '-675,25,0,����,����,����,����', '-650,33,0,����,����,��֣,����',
    '-617,6,0,����,����,���ɳ�,����', '-611,6,0,����,����,����,����', '-605,21,0,����,����,���,����',
    '-584,14,0,����,����,����,����', '-570,27,0,����,����,��й��,����', '-543,24,0,����,����,����,����',
    '-519,1,0,����,����,����,����', '-518,44,0,����,����,����,����', '-474,7,0,����,Ԫ��,����,Ԫ��',
    '-467,27,0,����,�궨��,����,�궨��', '-440,1,0,����,����-˼��,��ȥ��-����,����-˼��', '-439,15,0,����,����,����,����',
    '-424,24,0,����,������,����,������', '-400,26,0,����,����,����,����', '-374,7,0,����,����,��ϲ,����',
    '-367,48,0,����,����,����,����', '-319,6,0,����,������,����,������', '-313,8,0,����,����,����,����',
    '-305,56,0,ս��-��,������,����,������', '-249,1,0,ս��-��,Т����,����,Т����', '-248,3,0,ս��-��,ׯ����,���ӳ�,ׯ����',
    '-245,25,0,��,����,����,����', '-220,12,0,��,ʼ�ʵ�,����,ʼ��', '-208,3,0,��,�����ʵ�,������,����',
    '-205,12,0,����,�ߵ�,����,�ߵ�', '-193,7,0,����,�ݵ�,��ӯ,�ݵ�', '-186,8,0,����,�ߺ�,����,�ߺ�',
    '-178,16,0,����,�ĵ�,����,�ĵ�', '-162,7,0,����,�ĵ�,����,��Ԫ', '-155,7,0,����,����,����,����',
    '-148,6,0,����,����,����,��Ԫ', '-142,3,0,����,����,����,��Ԫ', '-139,6,0,����,���,����,��Ԫ',
    '-133,6,0,����,���,����,Ԫ��', '-127,6,0,����,���,����,Ԫ˷', '-121,6,0,����,���,����,Ԫ��',
    '-115,6,0,����,���,����,Ԫ��', '-109,6,0,����,���,����,Ԫ��', '-103,4,0,����,���,����,̫��',
    '-99,4,0,����,���,����,�캺', '-95,4,0,����,���,����,̫ʼ', '-91,4,0,����,���,����,����',
    '-87,2,0,����,���,����,��Ԫ', '-85,6,0,����,�ѵ�,������,ʼԪ', '-79,6,0,����,�ѵ�,������,Ԫ��',
    '-73,1,0,����,�ѵ�,������,Ԫƽ', '-72,4,0,����,����,��ѯ,��ʼ', '-68,4,0,����,����,��ѯ,�ؽ�',
    '-64,4,0,����,����,��ѯ,Ԫ��', '-60,4,0,����,����,��ѯ,���', '-56,4,0,����,����,��ѯ,���',
    '-52,4,0,����,����,��ѯ,��¶', '-48,1,0,����,����,��ѯ,����', '-47,5,0,����,Ԫ��,���],��Ԫ',
    '-42,5,0,����,Ԫ��,���],����', '-37,5,0,����,Ԫ��,���],����', '-32,1,0,����,Ԫ��,���],����',
    '-31,4,0,����,�ɵ�,����,��ʼ', '-27,4,0,����,�ɵ�,����,��ƽ', '-23,4,0,����,�ɵ�,����,��˷',
    '-19,4,0,����,�ɵ�,����,���', '-15,4,0,����,�ɵ�,����,��ʼ', '-11,4,0,����,�ɵ�,����,Ԫ��',
    '-7,2,0,����,�ɵ�,����,���', '-5,4,0,����,����,����,��ƽ', '-1,2,0,����,����,����,Ԫ��',
    '1,5,0,����,ƽ��,����,Ԫʼ', '6,2,0,����,����Ӥ,��ç����,����', '8,1,0,����,����Ӥ,��ç����,��ʼ',
    '9,5,0,��,,��ç,ʼ����', '14,6,0,��,,��ç,���', '20,3,0,��,,��ç,�ػ�',
    '23,2,0,����,��ʼ��,����,��ʼ', '25,31,0,����,�����,����,����', '56,2,0,����,�����,����,������Ԫ',
    '58,18,0,����,����,��ׯ,��ƽ', '76,8,0,����,�µ�,����,����', '84,3,0,����,�µ�,����,Ԫ��',
    '87,2,0,����,�µ�,����,�º�', '89,16,0,����,�͵�,����,��Ԫ', '105,1,0,����,�͵�,����,Ԫ��',
    '106,1,0,����,���,��¡,��ƽ', '107,7,0,����,����,����,����', '114,6,0,����,����,����,Ԫ��',
    '120,1,0,����,����,����,����', '121,1,0,����,����,����,����', '122,4,0,����,����,����,�ӹ�',
    '126,6,0,����,˳��,����,����', '132,4,0,����,˳��,����,����', '136,6,0,����,˳��,����,����',
    '142,2,0,����,˳��,����,����', '144,1,0,����,˳��,����,����', '145,1,0,����,���,����,����',
    '146,1,0,����,�ʵ�,����,����', '147,3,0,����,����,��־,����', '150,1,0,����,����,��־,��ƽ',
    '151,2,0,����,����,��־,Ԫ��', '153,2,0,����,����,��־,����', '155,3,0,����,����,��־,����',
    '158,9,0,����,����,��־,����', '167,1,0,����,����,��־,����', '168,4,0,����,���,����,����',
    '172,5,0,����,���,����,��ƽ', '178,6,0,����,���,����,���', '184,6,0,����,���,����,��ƽ',
    '190,4,0,����,�׵�,��Э,��ƽ', '194,2,0,����,�׵�,��Э,��ƽ', '196,24,0,����,�׵�,��Э,����',
    '220,7,0,����-κ,�ĵ�,��ا,�Ƴ�', '227,6,0,����-κ,����,�܅�,̫��', '233,4,0,����-κ,����,�܅�,����',
    '237,3,0,����-κ,����,�܅�,����', '240,9,0,����-κ,����,�ܷ�,��ʼ', '249,5,0,����-κ,����,�ܷ�,��ƽ',
    '254,2,0,����-κ,�߹��繫,����,��Ԫ', '256,4,0,����-κ,�߹��繫,����,��¶', '260,4,0,����-κ,Ԫ��,��ۼ,��Ԫ',
    '264,1,0,����-κ,Ԫ��,��ۼ,����', '265,10,0,����,���,˾����,̩ʼ', '275,5,0,����,���,˾����,����',
    '280,10,0,����,���,˾����,̫��', '290,10,0,����,���,˾����,̫��', '300,1,0,����,�ݵ�,˾����,����',
    '301,1,0,����,�ݵ�,˾����,����', '302,2,0,����,�ݵ�,˾����,̫��', '304,2,0,����,�ݵ�,˾����,����',
    '306,1,0,����,�ݵ�,˾����,����', '307,6,0,����,����,˾����,����', '313,4,0,����,����,˾����,����',
    '317,1,0,����,Ԫ��,˾���,����', '318,4,0,����,Ԫ��,˾���,����', '322,1,0,����,Ԫ��,˾���,����',
    '323,3,0,����,����,˾����,̫��', '326,9,0,����,�ɵ�,˾����,�̺�', '335,8,0,����,�ɵ�,˾����,�̿�',
    '343,2,0,����,����,˾����,��Ԫ', '345,12,0,����,�µ�,˾����,����', '357,5,0,����,�µ�,˾����,��ƽ',
    '362,1,0,����,����,˾��ا,¡��', '363,3,0,����,����,˾��ا,����', '366,5,0,����,������,˾����,̫��',
    '371,2,0,����,���ĵ�,˾����,�̰�', '373,3,0,����,Т���,˾����,帿�', '376,21,0,����,Т���,˾����,̫Ԫ',
    '397,5,0,����,����,˾������,¡��', '402,3,0,����,����,˾������,Ԫ��', '405,14,0,����,����,˾������,����',
    '419,1,0,����,����,˾������,Ԫ��', '420,3,0,�ϳ�/��,���,��ԣ,����', '423,2,0,�ϳ�/��,�ٵ�,�����,��ƽ',
    '424,30,0,�ϳ�/��,�ĵ�,���x¡,Ԫ��', '454,3,0,�ϳ�/��,Т��,������,Т��', '457,8,0,�ϳ�/��,Т��,������,����',
    '465,1,0,�ϳ�/��,�ϵ�,����ҵ,����', '465,1,0,�ϳ�/��,�ϵ�,����ҵ,����', '465,7,0,�ϳ�/��,����,����,̩ʼ',
    '472,1,0,�ϳ�/��,����,����,̩ԥ', '473,5,0,�ϳ�/��,�ϵ�,����,Ԫ��', '477,3,0,�ϳ�/��,˳��,��׼,����',
    '479,4,0,�ϳ�/��,�ߵ�,������,��Ԫ', '483,11,0,�ϳ�/��,���,����,����', '494,1,0,�ϳ�/��,������,����ҵ,¡��',
    '494,1,0,�ϳ�/��,������,������,����', '494,5,0,�ϳ�/��,����,���,����', '498,1,0,�ϳ�/��,����,���,��̩',
    '499,3,0,�ϳ�/��,�����,����,����', '501,2,0,�ϳ�/��,�͵�,������,����', '502,18,0,�ϳ�/��,���,����,���',
    '520,8,0,�ϳ�/��,���,����,��ͨ', '527,3,0,�ϳ�/��,���,����,��ͨ', '529,6,0,�ϳ�/��,���,����,�д�ͨ',
    '535,12,0,�ϳ�/��,���,����,��ͬ', '546,2,0,�ϳ�/��,���,����,�д�ͬ', '547,3,0,�ϳ�/��,���,����,̫��',
    '550,2,0,�ϳ�/��,���ĵ�,����,��', '551,2,0,�ϳ�/��,ԥ����,����,����', '552,4,0,�ϳ�/��,Ԫ��,����,��ʥ',
    '555,1,0,�ϳ�/��,������,��Ԩ��,���', '555,2,0,�ϳ�/��,����,������,��̩', '556,2,0,�ϳ�/��,����,������,̫ƽ',
    '557,3,0,�ϳ�/��,���,�°���,̫ƽ', '560,7,0,�ϳ�/��,�ĵ�,���`,���', '566,1,0,�ϳ�/��,�ĵ�,���`,�쿵',
    '567,2,0,�ϳ�/��,�ϵ�,�²���,���', '569,14,0,�ϳ�/��,����,����,̫��', '583,4,0,�ϳ�/��,����,���屦,����',
    '587,3,0,�ϳ�/��,����,���屦,����', '555,8,0,�ϳ�/����,����,��Ԉ,��', '562,24,0,�ϳ�/����,����,����,�챣',
    '586,2,0,�ϳ�/����,�칫,����,����', '386,11,0,����/��κ,�����,�ذϹ�,�ǹ�', '396,3,0,����/��κ,�����,�ذϹ�,��ʼ',
    '398,7,0,����/��κ,�����,�ذϹ�,����', '404,6,0,����/��κ,�����,�ذϹ�,���', '409,5,0,����/��κ,��Ԫ��,�ذ���,����',
    '414,3,0,����/��κ,��Ԫ��,�ذ���,����', '416,8,0,����/��κ,��Ԫ��,�ذ���,̩��', '424,5,0,����/��κ,̫���,�ذ���,ʼ��',
    '428,4,0,����/��κ,̫���,�ذ���,����', '432,3,0,����/��κ,̫���,�ذ���,�Ӻ�', '435,6,0,����/��κ,̫���,�ذ���,̫��',
    '440,12,0,����/��κ,̫���,�ذ���,̫ƽ���', '451,2,0,����/��κ,̫���,�ذ���,��ƽ', '452,1,0,����/��κ,�ϰ���,�ذ���,��ƽ',
    '452,3,0,����/��κ,�ĳɵ�,�ذϿ�,�˰�', '454,2,0,����/��κ,�ĳɵ�,�ذϿ�,�˹�', '455,5,0,����/��κ,�ĳɵ�,�ذϿ�,̫��',
    '460,6,0,����/��κ,�ĳɵ�,�ذϿ�,��ƽ', '466,2,0,����/��κ,���ĵ�,�ذϺ�,�찲', '467,5,0,����/��κ,���ĵ�,�ذϺ�,����',
    '471,6,0,����/��κ,���ĵ�,�ذϺ�,����', '476,1,0,����/��κ,Т�ĵ�,�ذϺ�,����', '477,23,0,����/��κ,Т�ĵ�,�ذϺ�,̫��',
    '500,4,0,����/��κ,�����,Ԫ�,����', '504,5,0,����/��κ,�����,Ԫ�,��ʼ', '508,5,0,����/��κ,�����,Ԫ�,��ƽ',
    '512,4,0,����/��κ,�����,Ԫ�,�Ӳ�', '516,3,0,����/��κ,Т����,Ԫڼ,��ƽ', '518,3,0,����/��κ,Т����,Ԫڼ,���',
    '520,6,0,����/��κ,Т����,Ԫڼ,����', '525,3,0,����/��κ,Т����,Ԫڼ,Т��', '528,1,0,����/��κ,Т����,Ԫڼ,��̩',
    '528,1,0,����/��κ,Тׯ��,Ԫ����,����', '528,3,0,����/��κ,Тׯ��,Ԫ����,����', '530,2,0,����/��κ,������,Ԫ��,����',
    '531,2,0,����/��κ,���ɵ�,Ԫ��,��̩', '531,2,0,����/��κ,������,Ԫ��,����', '532,1,0,����/��κ,Т���,Ԫ��,̫��',
    '532,1,0,����/��κ,Т���,Ԫ��,����', '532,3,0,����/��κ,Т���,Ԫ��,����', '534,4,0,����/��κ,Т����,Ԫ�Ƽ�,��ƽ',
    '538,2,0,����/��κ,Т����,Ԫ�Ƽ�,Ԫ��', '539,4,0,����/��κ,Т����,Ԫ�Ƽ�,�˺�', '543,8,0,����/��κ,Т����,Ԫ�Ƽ�,�䶨',
    '535,17,0,����/��κ,�ĵ�,Ԫ����,��ͳ', '552,3,0,����/��κ,�ϵ�,Ԫ��,��ͳ', '554,3,0,����/��κ,����,Ԫ��,��ͳ',
    '550,10,0,����/����,������,����,�챣', '560,1,0,����/����,�ϵ�,����,Ǭ��', '560,2,0,����/����,Т�ѵ�,����,�ʽ�',
    '561,2,0,����/����,��ɵ�,��տ,̫��', '562,4,0,����/����,��ɵ�,��տ,����', '565,5,0,����/����,�¹�,��γ,��ͳ',
    '570,7,0,����/����,�¹�,��γ,��ƽ', '576,2,0,����/����,�¹�,��γ,¡��', '576,1,0,����/����,������,������,�²�',
    '577,1,0,����/����,����,�ߺ�,�й�', '557,1,0,����/����,�ɵ�,���ľ�,��', '557,2,0,����/����,����,����ع,��',
    '559,2,0,����/����,����,����ع,���', '561,5,0,����/����,���,������,����', '566,7,0,����/����,���,������,���',
    '572,7,0,����/����,���,������,����', '578,1,0,����/����,���,������,����', '579,1,0,����/����,����,����ٚ,���',
    '579,2,0,����/����,����,������,����', '581,1,0,����/����,����,������,��', '581,20,0,��,�ĵ�,���,����',
    '601,4,0,��,�ĵ�,���,����', '605,13,0,��,쾵�,���,��ҵ', '617,2,0,��,����,��٧,����',
    '618,9,0,��,����,��Ԩ,���', '627,23,0,��,̫��,������,���', '650,6,0,��,����,����,����',
    '656,6,0,��,����,����,����', '661,3,0,��,����,����,��˷', '664,2,0,��,����,����,���',
    '666,3,0,��,����,����,Ǭ��', '668,3,0,��,����,����,����', '670,5,0,��,����,����,�̺�',
    '674,3,0,��,����,����,��Ԫ', '676,4,0,��,����,����,�Ƿ�', '679,2,0,��,����,����,��¶',
    '680,2,0,��,����,����,��¡', '681,2,0,��,����,����,��ҫ', '682,2,0,��,����,����,����',
    '683,1,0,��,����,����,���', '684,1,0,��,����,����,��ʥ', '684,1,0,��,���,�,����',
    '684,1,0,����,�����,���,��լ', '685,4,0,����,�����,���,����', '689,1,0,����,�����,���,����',
    '689,2,0,����,�����,���,�س�', '690,3,0,����,�����,���,����', '692,1,0,����,�����,���,����',
    '692,3,0,����,�����,���,����', '694,1,0,����,�����,���,����', '695,1,0,����,�����,���,֤ʥ',
    '695,2,0,����,�����,���,�������', '696,1,0,����,�����,���,����Ƿ�', '696,2,0,����,�����,���,����ͨ��',
    '697,1,0,����,�����,���,��', '698,3,0,����,�����,���,ʥ��', '700,1,0,����,�����,���,����',
    '701,1,0,����,�����,���,����', '701,4,0,����,�����,���,����', '705,1,0,����,�����,����,����',
    '705,2,0,��,����,����,����', '707,4,0,��,����,����,����', '710,1,0,��,����,����ï,��¡',
    '710,2,0,��,���,�,����', '712,1,0,��,���,�,̫��', '712,1,0,��,���,�,�Ӻ�',
    '712,2,0,��,����,��¡��,����', '713,29,0,��,����,��¡��,��Ԫ', '742,15,0,��,����,��¡��,�챦',
    '756,3,0,��,����,���,����', '758,3,0,��,����,���,ǬԪ', '760,3,0,��,����,���,��Ԫ',
    '762,2,0,��,����,���,��Ӧ', '763,2,0,��,����,��ԥ,���', '765,2,0,��,����,���,��̩',
    '766,14,0,��,����,���,����', '780,4,0,��,����,����,����', '784,1,0,��,����,����,��Ԫ',
    '785,21,0,��,����,����,��Ԫ', '805,1,0,��,˳��,����,����', '806,15,0,��,����,�,Ԫ��',
    '821,4,0,��,����,���,����', '825,3,0,��,����,��տ,����', '827,9,0,��,����,�,���',
    '836,5,0,��,����,�,����', '841,6,0,��,����,����,���', '847,14,0,��,����,���,����',
    '860,15,0,��,����,���,��ͨ', '874,6,0,��,����,����,Ǭ��', '880,2,0,��,����,����,����',
    '881,5,0,��,����,����,�к�', '885,4,0,��,����,����,����', '888,1,0,��,����,����,�ĵ�',
    '889,1,0,��,����,����,����', '890,2,0,��,����,����,��˳', '892,2,0,��,����,����,����',
    '894,5,0,��,����,����,Ǭ��', '898,4,0,��,����,����,�⻯', '901,4,0,��,����,����,�츴',
    '904,1,0,��,����,����,����', '905,3,1,��,������,��ף,����', '907,5,0,���/��,̫��,����,��ƽ',
    '911,2,0,���/��,̫��,����,Ǭ��', '913,1,0,���/��,����,���ѹ�,����', '913,3,2,���/��,ĩ��,������,Ǭ��',
    '915,7,0,���/��,ĩ��,������,����', '921,3,0,���/��,ĩ��,������,����', '923,4,0,���/��,ׯ��,����,ͬ��',
    '926,5,0,���/��,����,����Դ,���', '930,4,0,���/��,����,����Դ,����', '934,1,0,���/��,�ɵ�,��Ӻ�,Ӧ˳',
    '934,3,0,���/��,º��,�����,��̩', '936,6,0,���/��,����,ʯ���,�츣', '942,2,6,���/��,����,ʯ�ع�,�츣',
    '944,3,0,���/��,����,ʯ�ع�,����', '947,12,0,���/��,����,��֪Զ,�츣', '948,1,0,���/��,����,���еv,Ǭ�v',
    '948,3,0,���/��,����,���еv,Ǭ�v', '951,3,0,���/��,̫��,����,��˳', '954,1,0,���/��,̫��,����,�Ե�',
    '954,6,0,���/��,����,����,�Ե�', '959,2,5,���/��,����,����ѵ,�Ե�', '960,4,0,����,̫��,�Կ�ط,��¡',
    '963,6,0,����,̫��,�Կ�ط,Ǭ��', '968,9,0,����,̫��,�Կ�ط,����', '976,9,0,����,̫��,����,̫ƽ�˹�',
    '984,4,0,����,̫��,����,Ӻ��', '988,2,0,����,̫��,����,�˹�', '990,5,0,����,̫��,����,����',
    '995,3,0,����,̫��,����,����', '998,6,0,����,����,�Ժ�,��ƽ', '1004,4,0,����,����,�Ժ�,����',
    '1008,9,0,����,����,�Ժ�,�������', '1017,5,0,����,����,�Ժ�,����', '1022,1,0,����,����,�Ժ�,Ǭ��',
    '1023,10,0,����,����,����,��ʥ', '1032,2,0,����,����,����,����', '1034,5,0,����,����,����,���v',
    '1038,3,0,����,����,����,��Ԫ', '1040,2,0,����,����,����,����', '1041,8,0,����,����,����,����',
    '1049,6,0,����,����,����,�ʵv', '1054,3,0,����,����,����,����', '1056,8,0,����,����,����,�εv',
    '1064,4,0,����,Ӣ��,����,��ƽ', '1068,10,0,����,����,����,����', '1078,8,0,����,����,����,Ԫ��',
    '1086,9,0,����,����,����,Ԫ�v', '1094,5,0,����,����,����,��ʥ', '1098,3,0,����,����,����,Ԫ��',
    '1101,1,0,����,����,��٥,���о���', '1102,5,0,����,����,��٥,����', '1107,4,0,����,����,��٥,���',
    '1111,8,0,����,����,��٥,����', '1118,2,0,����,����,��٥,�غ�', '1119,7,0,����,����,��٥,����',
    '1126,2,0,����,����,�Ի�,����', '1127,4,0,����,����,�Թ�,����', '1131,32,0,����,����,�Թ�,����',
    '1163,2,0,����,Т��,����,¡��', '1165,9,0,����,Т��,����,Ǭ��', '1174,16,0,����,Т��,����,����',
    '1190,5,0,����,����,�Ա�,����', '1195,6,0,����,����,����,��Ԫ', '1201,4,0,����,����,����,��̩',
    '1205,3,0,����,����,����,����', '1208,17,0,����,����,����,�ζ�', '1225,3,0,����,����,����,����',
    '1228,6,0,����,����,����,�ܶ�', '1234,3,0,����,����,����,��ƽ', '1237,4,0,����,����,����,����',
    '1241,12,0,����,����,����,���v', '1253,6,0,����,����,����,���v', '1259,1,0,����,����,����,����',
    '1260,5,0,����,����,����,����', '1265,10,0,����,����,�ԶQ,�̴�', '1275,2,0,����,����,��(�ϡ��ա��¡�˿��),�µv',
    '1276,3,0,����,����,��(�ϡ��ա��¡�����),����', '1278,2,0,����,�ەm,�ԕm,����', '1271,24,7,Ԫ,����,�ö�ֻ�������,��Ԫ',
    '1295,3,0,Ԫ,����,�ö�ֻ����¶�,Ԫ��', '1297,11,0,Ԫ,����,�ö�ֻ����¶�,���', '1308,4,0,Ԫ,����,�ö�ֻ���ɽ,����',
    '1312,2,0,Ԫ,����,�ö�ֻ�����������˴�,����', '1314,7,0,Ԫ,����,�ö�ֻ�������������_,�ӵv', '1321,3,0,Ԫ,Ӣ��,�ö�ֻ���˶�°���,����',
    '1324,5,0,Ԫ,̩����,�ö�ֻ�Ҳ����ľ��,̩��', '1328,1,0,Ԫ,̩����,�ö�ֻ�Ҳ����ľ��,����', '1328,1,0,Ԫ,����,�ö�ֻ����ټ���,��˳',
    '1328,3,0,Ԫ,����,�ö�ֻ�ͼ������,����', '1330,3,0,Ԫ,����,�ö�ֻ�ͼ������,��˳', '1333,3,0,Ԫ,����,�ö�ֻ�����������,Ԫͳ',
    '1335,6,0,Ԫ,����,�ö�ֻ�����������,��Ԫ', '1341,28,0,Ԫ,����,�ö�ֻ�����������,����', '1368,31,0,��,̫��,��Ԫ�,����',
    '1399,4,0,��,�ݵ�,���ʜ�,����', '1403,22,0,��,����,���,����', '1425,1,0,��,����,��߳�,����',
    '1426,10,0,��,����,��հ��,����', '1436,14,0,��,Ӣ��,������,��ͳ', '1450,7,0,��,����,������,��̩',
    '1457,8,0,��,Ӣ��,������,��˳', '1465,23,0,��,����,�����,�ɻ�', '1488,18,0,��,Т��,��v��,����',
    '1506,16,0,��,����,�����,����', '1522,45,0,��,����,����,�ξ�', '1567,6,0,��,����,���غ�,¡��',
    '1573,48,0,��,����,����,����', '1620,1,0,��,����,�쳣��,̩��', '1621,7,0,��,����,��ͬУ,����',
    '1628,17,0,��,����,���ɼ�,����', '1644,18,0,��,����,���¾��޸���,˳��', '1662,61,0,��,ʥ��,���¾�������,����',
    '1723,13,0,��,����,���¾���ط�G,Ӻ��', '1736,60,0,��,����,���¾��޺���,Ǭ¡', '1796,25,0,��,����,���¾����J��,����',
    '1821,30,0,��,����,���¾��ޕF��,����', '1851,11,0,��,����,���¾������},�̷�', '1862,13,0,��,����,���¾����ش�,ͬ��',
    '1875,34,0,��,����,���¾����؜�,����', '1909,3,0,��,,���¾�������,��ͳ', '1911,37,0,�����ִ�,�л����,,���',
    '1949,9999,1948,����,�й�,,����'
    );
type
  TChnCal = class
  private
    FLastYear, FLastMonth: Integer;
    FDateTime: TDateTime;
    FcnSolarTerm: string;
    FHoliday: string;
    FcnMonth: string;
    FcnDayGanZhi: string;
    FcnYearGanZhi: string;
    FcnMonthGanZhi: string;
    FcnHoliday: string;
    FcnYear: string;
    FcnDay: string;
    FcnYearAnimal: string;
    FConstellation: string;
    FcnYearNumber: string;
    procedure SetDateTime(const Value: TDateTime);
  public
    { Public declarations }
  published
    { Published declarations }
    property DateTime: TDateTime read FDateTime write SetDateTime;
    property cnYear: string read FcnYear write FcnYear;
    property cnMonth: string read FcnMonth write FcnMonth;
    property cnDay: string read FcnDay write FcnDay;

    property cnYearGanZhi: string read FcnYearGanZhi write FcnYearGanZhi;
    property cnMonthGanZhi: string read FcnMonthGanZhi write FcnMonthGanZhi;
    property cnDayGanZhi: string read FcnDayGanZhi write FcnDayGanZhi;
    property cnYearAnimal: string read FcnYearAnimal write FcnYearAnimal;

    property cnYearNumber: string read FcnYearNumber write FcnYearNumber;

    property cnSolarTerm: string read FcnSolarTerm write FcnSolarTerm;
    property cnHoliday: string read FcnHoliday write FcnHoliday;
    property Holiday: string read FHoliday write FHoliday;
    property Constellation: string read FConstellation write FConstellation;
  end;

function _GetGanZhiFromYear(const Date: TDate): string;
function _GetShengXiaoFromYear(const Date: TDate): string;
function GetCnYearNumber(const Year: Integer): string;
implementation
uses CnCalendar;

function _GetLunarFromDay(Date: TDate; var LunarYear, LunarMonth, LunarDay: Integer; var IsLeapMonth: Boolean): Boolean; overload;
var
  AYear, AMonth, ADay: Word;
begin
  DecodeDate(Date, AYear, AMonth, ADay);
  Result := GetLunarFromDay(AYear, AMonth, ADay, LunarYear, LunarMonth, LunarDay, IsLeapMonth);
end;

function _GetGanZhiFromYear(const Date: TDate): string;
var
  AYear, AMonth, ADay: Word;
  LunarYear, LunarMonth, LunarDay: Integer;
  IsLeapMonth: Boolean;
begin
  Result := '';
  DecodeDate(Date, AYear, AMonth, ADay);
  if GetLunarFromDay(AYear, AMonth, ADay, LunarYear, LunarMonth, LunarDay, IsLeapMonth) then
    Result := GetGanZhiFromNumber(GetGanZhiFromYear(LunarYear));
end;

function _GetShengXiaoFromYear(const Date: TDate): string;
var
  AYear, AMonth, ADay: Word;
  LunarYear, LunarMonth, LunarDay: Integer;
  IsLeapMonth: Boolean;
begin
  Result := '';
  DecodeDate(Date, AYear, AMonth, ADay);
  if GetLunarFromDay(AYear, AMonth, ADay, LunarYear, LunarMonth, LunarDay, IsLeapMonth) then
    Result := GetShengXiaoFromNumber(GetShengXiaoFromYear(LunarYear));
end;

function _GetJieQiInAYear(const Date: TDate): string;
var
  AYear, AMonth, ADay: Word;
  AHour, AMinitue: Integer;
  M1, D1, H1, mi1: Integer;
  M2, D2, H2, mi2: Integer;
begin
  Result := '';
  DecodeDate(Date, AYear, AMonth, ADay);
  GetJieQiInAYear(AYear, 2 * (AMonth - 1), M1, D1, H1, mi1);
  if (AMonth = M1) and (ADay = D1) then
    Result := GetJieQiFromNumber(((AMonth - 1) * 2 + 22) mod 24)
  else
  begin
    GetJieQiInAYear(AYear, 2 * (AMonth - 1) + 1, M2, D2, H2, mi2);
    if (AMonth = M2) and (ADay = D2) then
      Result := GetJieQiFromNumber(((AMonth - 1) * 2 + 23) mod 24)
  end;
end;

function OtherHoliday(Month, Day: integer): string;
begin
  result := '';

  case Month of
    1:
      begin
      end;

    2:
      begin

        if day = 2 then
          result := 'ʪ����';

        if day = 10 then
          result := '�����';

      end;
    3:
      begin
        if day = 3 then
          result := '������';


        if day = 12 then
          result := 'ֲ����';

        if day = 14 then
          result := '������';

        if day = 15 then
          result := '���ѽ�';

        if day = 21 then
          result := 'ɭ����';

        if day = 22 then
          result := 'ˮ��';

        if day = 23 then
          result := '������';

      end;
    4:
      begin

        if day = 7 then
          result := '������';

        if day = 22 then
          result := '������';

      end;
    5:
      begin
        if day = 8 then
          result := '��ʮ��';

        if day = 12 then
          result := '��ʿ��';

        if day = 15 then
          result := '��ͥ��';

        if day = 17 then
          result := '������';

        if day = 18 then
          result := '�����';

        if day = 19 then
          result := '������';

        if day = 23 then
          result := 'ţ����';

        if day = 31 then
          result := '������';

        // ĸ�׽�[�ڶ���������]
      end;
    6:
      begin

        if day = 5 then
          result := '������';

        if day = 6 then
          result := '������';

        if day = 23 then
          result := '������';

        if day = 25 then
          result := '������';

        if day = 26 then
          result := '����Ʒ';

        // ���׽�[������������]
      end;
    7:
      begin

        if day = 11 then
          result := '�˿���';

      end;
    8:
      begin

      end;
    9:
      begin
        if day = 8 then
          result := 'ɨä��';


        if day = 17 then
          result := '��ƽ��';

        if day = 20 then
          result := '������';

        if day = 22 then
          result := '���˽�';

        if day = 27 then
          result := '������';

      end;
    10:
      begin

        if day = 6 then
          result := '���˽�';

        if day = 4 then
          result := '������';

        if day = 7 then
          result := 'ס����';

        if day = 9 then
          result := '������';

        if day = 15 then
          result := 'ä�˽�';

        if day = 16 then
          result := '��ʳ��';


      end;

    11:
      begin
        if day = 8 then
          result := '������';

        if day = 9 then
          result := '������';

        if day = 17 then
          result := '��ѧ��';


      end;
    12:
      begin
        if day = 9 then
          result := '������';

        if day = 24 then
          result := 'ƽ��ҹ';
      end;

  end;
end;

function GetHoliday(Date: TDateTime; Day: integer): string;
var
  dDate: TDate;
begin
  result := '';
//  result := OtherHoliday(Month(Date), Day);

  case MonthOf(Date) of
    1:
      begin
        if day = 1 then
          result := 'Ԫ����';
      end;

    2:
      begin
        if day = 14 then
          result := '���˽�';
      end;
    3:
      begin
        if day = 8 then
          result := '��Ů��';
      end;
    4:
      begin
        if day = 1 then
          result := '���˽�';
      end;
    5:
      begin
        if day = 1 then
          result := '�Ͷ���';

        if day = 4 then
          result := '�����';

        // ĸ�׽�[�ڶ���������]
        dDate := EnCodeDate(YearOf(Date), MonthOf(Date), Day);
        if (DayOfWeek(dDate) = 1) then
          if (Trunc((Day - 1) / 7) = 1) then
            result := 'ĸ�׽�';

      end;
    6:
      begin
        if day = 1 then
          result := '��ͯ��';

        // ���׽�[������������]
        dDate := EnCodeDate(YearOf(Date), MonthOf(Date), Day);
        if (DayOfWeek(dDate) = 1) then
          if (Trunc((Day - 1) / 7) = 2) then
            result := '���׽�';
      end;
    7:
      begin
        if day = 1 then
          result := '������';
      end;
    8:
      begin
        if day = 1 then
          result := '������';

      end;
    9:
      begin
        if day = 10 then
          result := '��ʦ��';
      end;
    10:
      begin
        if day = 1 then
          result := '�����';

        if day = 6 then
          result := '���˽�';

        if day = 31 then
          result := '��ʥ��';

      end;

    11:
      begin
        if day = 8 then
          result := '������';

        // �ж���(11�µĵ��ĸ������� )
        dDate := EnCodeDate(YearOf(Date), MonthOf(Date), Day);
        if (DayOfWeek(dDate) = 5) then
          if (Trunc((Day - 1) / 7) = 3) then
            result := '�ж���';

      end;
    12:
      begin
        if day = 25 then
          result := 'ʥ����';
      end;

  end;
end;

function GetCnHoliday(cnM, cnD: Integer; Date: TDate): string;
var
  IsLeapMonth: Boolean;
  LunarYear, LunarMonth, LunarDay: Integer;
begin
  Result := '';
  case cnD of
    1:
      if cnM = 1 then
        Result := '����';
    5:
      if cnM = 5 then
        Result := '�����';
    7:
      if cnM = 7 then
        Result := '��Ϧ��';
    15:
      if cnM = 8 then
        Result := '�����'
      else
        if cnM = 1 then
          Result := 'Ԫ����';
    9:
      if cnM = 9 then
        Result := '������';
    8:
      if cnM = 12 then
        Result := '���˽�';
  else
    if cnM = 12 then
    begin
      if _GetLunarFromDay(Date + 1, LunarYear, LunarMonth, LunarDay, IsLeapMonth) then
      begin
        if (LunarMonth = 1) and (LunarDay = 1) then
          Result := '��Ϧ';
      end;
    end;
  end; {case}
end;

function SubStr(Str: string; FindStr: string; Index: Integer; isFilterNull: Boolean = False): string;
var
  i, x: Integer;
  s: string;
begin
  Result := '';
  i := Pos(FindStr, Str);
  x := 0;
  while i > 0 do
  begin
    if isFilterNull then
    begin
      s := Trim(Copy(Str, 1, i - 1));
      if s <> '' then
      begin
        Inc(x);
        if x = index then
        begin
          Result := s;
          Exit;
        end;
      end;
    end
    else
    begin
      Inc(x);
      if x = Index then
      begin
        Result := Trim(Copy(Str, 1, i - 1));
        Exit;
      end;
    end;
    Delete(str, 1, i + length(FindStr) - 1);
    i := Pos(FindStr, Str);
  end;
  if (x + 1 = Index) and (str <> '') then
    Result := Trim(Str);

end;

function IIF(B: Boolean; isTure, isFalse: string): string;
begin
  if B then
    Result := isTure
  else
    Result := isFalse;
end;

function GetCnYearNumber(const Year: Integer): string;
var
  i, CurrentYear, NextYear, YearNumber: Integer;
begin
  Result := '';
  if (year >= 1949) or (Year < -2069) then Exit;

  for i := Low(CnYearNumber) to High(CnYearNumber) do
  begin
    CurrentYear := StrToIntDef(SubStr(CnYearNumber[i], ',', 1), 0);
    NextYear := StrToIntDef(SubStr(CnYearNumber[i + 1], ',', 1), 0);
    if (Year >= CurrentYear) and (Year < NextYear) then
    begin
      YearNumber := Year - CurrentYear + 1;
      Result :=
        '[' + SubStr(CnYearNumber[i], ',', 4) + ']' +
        SubStr(CnYearNumber[i], ',', 5) + ' ' +
        SubStr(CnYearNumber[i], ',', 6) + ' ' +
        SubStr(CnYearNumber[i], ',', 7) + iif(YearNumber = 1, 'Ԫ', IntToStr(YearNumber)) + '��';
      Break;
    end;
  end;
end;

{ TChnCalendar }

procedure TChnCal.SetDateTime(const Value: TDateTime);
var
  AYear, AMonth, ADay: Word;
  LunarYear, LunarMonth, LunarDay: Integer;
  IsLeapMonth: Boolean;
begin
  FDateTime := Value;
  DecodeDate(FDateTime, AYear, AMonth, ADay);
  if GetLunarFromDay(AYear, AMonth, ADay, LunarYear, LunarMonth, LunarDay, IsLeapMonth) then
  begin
    if LunarYear <> FLastYear then
    begin
      FLastYear := LunarYear;
      FcnYear := IntToStr(LunarYear);
      FcnYearGanZhi := GetGanZhiFromNumber(GetGanZhiFromYear(AYear, AMonth, ADay));
      FcnYearAnimal := GetShengXiaoFromNumber(GetShengXiaoFromYear(LunarYear));
      FcnYearNumber := GetCnYearNumber(AYear);
    end;

    if (LunarYear = FLastYear) and (LunarMonth = FLastMonth) then
    begin
      //
    end
    else
    begin
      FLastMonth := LunarMonth;
      if IsLeapMonth then
        FcnMonth := '��' + CnMonthStr[LunarMonth]
      else
        FcnMonth := CnMonthStr[LunarMonth] + '��';
      FcnMonthGanZhi := GetGanZhiFromNumber(GetGanZhiFromMonth(AYear, AMonth, ADay));
    end;

    FcnDay := GetLunarDayFromNumber(LunarDay);
    FcnDayGanZhi := GetGanZhiFromNumber(GetGanZhiFromDay(AYear, AMonth, ADay));

    FConstellation := GetXingZuoFromNumber(GetXingZuoFromMonthDay(AMonth, ADay));

    FHoliday := GetHoliday(FDateTime, ADay);
    FcnHoliday := GetCnHoliday(LunarMonth, LunarDay, FDateTime);
    FcnSolarTerm := _GetJieQiInAYear(FDateTime);

  end;
end;

end.

