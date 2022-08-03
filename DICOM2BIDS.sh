#!/bin/bash
# Created by M.Y. WANG
# 03.April.2022

# Organize the data into BIDS format

filepath=/Users/wang/Desktop/Research_projects/BBSC/Functional/Data
cd $filepath
mkdir ./Reorganized/BIDS

ls ./Raw_data | grep -i sub- > ./Raw_data/subjList.txt # command grep is trying to filter the input with 'sub-'. -i ignore the high or low cases 

for sub in `cat ./Raw_data/subjList.txt`; do 
    mkdir ./Reorganized/BIDS/$sub
    ls ./Raw_data/$sub > ./Raw_data/sesList.txt #list files with 'ses-' in sub directories to sesList.txt 
    ses_num=0
    for ses_name in `cat ./Raw_data/sesList.txt`; do
        
        ((ses_num=$ses_num+1)) 
        ses_num=$(printf "%02d" $ses_num)
        # ses_num=ses_num+1 | printf "%02d " 
        sespath=./Reorganized/BIDS/$sub/ses-${ses_num}
        
        mkdir $sespath
        mkdir $sespath/anat
        mkdir $sespath/func


        dcm2niix -b y -z y -f ${sub}_ses-${ses_num}_T1w -o $sespath/anat/ ./Raw_data/$sub/$ses_name/*_Sag_FSPGR_3D/ 

        dcm2niix -b y -z y -f ${sub}_ses-${ses_num}_task-rest_bold -o $sespath/func/ ./Raw_data/$sub/$ses_name/*_fMRI_default_restate/
        cd ./$sespath/func/   
        jq '{"TaskName": "rest"} + .' ${sub}_ses-${ses_num}_task-rest_bold.json > temp.json
        rm ${sub}_ses-${ses_num}_task-rest_bold.json
        mv temp.json ${sub}_ses-${ses_num}_task-rest_bold.json  

        cd $filepath
    done
    
done


# check the quality of the data

# docker run -it --rm -v /Users/wang/Desktop/UiB/Research_projects/BBSC/Functional/Data/Reorganized/BIDS:/data:ro \
#                    -v /Users/wang/Desktop/UiB/Research_projects/BBSC/Functional/QC/Report_all:/out \
#                    poldracklab/mriqc:latest /data /out participant

# docker run -it --rm -v /Users/wang/Desktop/UiB/Research_projects/BBSC/Functional/Data/Reorganized/BIDS:/data:ro \
#                    -v /Users/wang/Desktop/UiB/Research_projects/BBSC/Functional/QC/Report_all:/out \
#                   poldracklab/mriqc:latest /data /out group

# run preprocessing with fMRIprep
# docker run -ti --rm -v $HOME/Desktop/BBSC/Functional/Morning/:/data:ro -v $HOME/Desktop/license.txt:/opt/freesurfer/license.txt \
#                     -v $HOME/Desktop/BBSC/Functional/report_pre_morn:/out \
#                     nipreps/fmriprep:latest /data /out/sub01 \
#                     participant --participant_label 1 --longitudinal --cifti-output
