%% ------Converting the DICM data to BIDS 

% created by M.Y. Wang
% 06-july-2021


%% --------
clear all
clc

cd ('/Users/wang/Desktop/BBSC/Functional')

BBSC_path = '/Users/wang/Desktop/BBSC/Functional';

main_path = dir; 
main_path(1:3,:) = [];

for i = 1:2
    
    cd ([BBSC_path, '/', main_path(3).name, '/',main_path(i).name]);
    sub_path = dir;
    sub_path(1:3,:) = [];
    
    for subi = 1:length (sub_path)
        cd ([BBSC_path, '/', main_path(3).name, '/',main_path(i).name, '/', sub_path(subi).name]);
        
        ses_path = dir;
        ses_path (1:3,:) = [];
        
        for sesi = 1:length(ses_path)
            
            %-----anat dicm2nii
            cd ([BBSC_path, '/', main_path(3).name, '/',main_path(i).name, '/', sub_path(subi).name, '/',ses_path(sesi).name]);
            str_path = dir ('*3D');
            pf.save_json = getpref('dicm2nii_gui_para', 'save_json', true);
            dicm2nii([BBSC_path, '/', main_path(3).name, '/',  main_path(i).name,'/',sub_path(subi).name,'/',ses_path(sesi).name,'/',str_path.name],...
                [BBSC_path, '/', main_path(i).name, '/', 'sub-', num2str(subi),'/ses-',num2str(sesi),'/','anat']);
            
                %------change names 
                cd ([BBSC_path, '/', main_path(i).name, '/', 'sub-', num2str(subi),'/ses-',num2str(sesi),'/','anat'])
                temp_file = dir('Sag*');
                movefile (temp_file(1).name, ['sub-', num2str(subi), '_ses-', num2str(sesi),'_T1w','.json'])
                movefile (temp_file(2).name, ['sub-', num2str(subi), '_ses-', num2str(sesi),'_T1w','.nii.gz'])
                delete *.mat
            
            %----function dicm2nii
            cd ([BBSC_path, '/', main_path(3).name, '/',main_path(i).name, '/', sub_path(subi).name, '/',ses_path(sesi).name]);
            fmri_path = dir ('*restate');
        
            pf.save_json = getpref('dicm2nii_gui_para', 'save_json', true);
            dicm2nii([BBSC_path, '/', main_path(3).name, '/',  main_path(i).name,'/',sub_path(subi).name,'/',ses_path(sesi).name,'/',fmri_path.name],...
                [BBSC_path, '/', main_path(i).name, '/', 'sub-', num2str(subi),'/ses-',num2str(sesi),'/','func']);
            
                %------change names 
                cd ([BBSC_path, '/', main_path(i).name, '/', 'sub-', num2str(subi),'/ses-',num2str(sesi),'/','func']);
                temp_file = dir('fMRI*');
                movefile (temp_file(1).name, ['sub-', num2str(subi), '_ses-', num2str(sesi),'_task-rest','_bold','.json'])
                movefile (temp_file(2).name, ['sub-', num2str(subi), '_ses-', num2str(sesi),'_task-rest','_bold','.nii.gz'])
                delete *.mat
        end
   
    end
end
