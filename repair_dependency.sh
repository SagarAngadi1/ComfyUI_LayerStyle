#!/bin/bash
requirements_txt="$(dirname "$0")/repair_dependency_list.txt"
python_exec="../../../python_embeded/python"
echo "Fixing Dependency Package..."
$python_exec -m pip uninstall -y onnxruntime
$python_exec -m pip uninstall -y opencv-python opencv-contrib-python opencv-python-headless opencv-contrib-python-headless
while IFS= read -r package; do
    $python_exec -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple "$package"
done < "$requirements_txt"
echo "Dependency repair complete."
