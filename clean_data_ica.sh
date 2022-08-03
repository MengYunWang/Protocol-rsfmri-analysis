#!/bin/bash
# created by Meng-Yun 
# 03-Aug-2022

# clean the data with FIX on mutisubjects with FSL

filepath=/Users/wang/Desktop/Research_projects/BBSC/Functional/Pre_processing
cd $filepath

for sub in `cat ./subjList.txt`; do

    for ses_name in `cat ./$sub/sesList.txt`; do

     ~/fix/fix $filepath/$sub/$ses_name/prep.feat/filtered_func_data.ica ~/fix/training_files/Standard.RData  20 -m
     
     applywarp -i $filepath/$sub/$ses_name/prep.feat/filtered_func_data_clean.nii.gz \
               -r $filepath/$sub/$ses_name/prep.feat/reg/standard.nii.gz \
               -premat=$filepath/$sub/$ses_name/prep.feat/reg/example_func2highres.mat
               -o $filepath/$sub/$ses_name/prep.feat/filtered_func_data_clean_standard
    done

done
