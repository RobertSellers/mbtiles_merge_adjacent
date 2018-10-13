# mbtiles_merge_adjacent

Using Windows Powershell. R CLI & Python 2.7 CLI. 

The following merges two adjacent mbtiles, sharing a latitudinal or longitudinal boundary, regardless of tilespace.

**Run as / with mbtiles in parent dir**

```
git clone https://github.com/RobertSellers/mbtiles_merge_adjacent.git
cd mbtiles_merge_adjacent
python merge_multi.py ..\361.mbtiles ..\362.mbtiles
```

Files will be merged inside the second argument (362.mbtiles)