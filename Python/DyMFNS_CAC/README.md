# DyMFNS_CAC

## 常用功能

### DyMFNS相关

（1）遍历故障情况，在每种故障情况下随机生成数据，测试DyMFNS能否避免101和010之间的跳变。

```python
import cac_main.cac_validation

cac_main.cac_validation.simu_dymfns_traverse_all_fault_cases(n=10, n_data=100, rule='4c-free')
# n为TSV数目（即码字长度），n_data为每种故障情况下随机数的个数。
# 注意，不包括TSV全部故障的情况。
```