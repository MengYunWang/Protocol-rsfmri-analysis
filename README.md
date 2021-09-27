# Protocol-rsfmri-analysis

https://www.ohbmbrainmappingblog.com/blog/ohbm-ondemand-how-to-resting-state-fmri-analysis

1. Noisy bussiness

(1) physiological noise

a. Head movement

b. cardiac pulse

c. Respitory breath

(2) Inherent physics

a. metal

b. Susceptibility

(3) Hardware issue

loose connectors

Caballero-Gaudes, C., & Reynolds, R. C. (2017). Methods for cleaning the BOLD fMRI signal. Neuroimage, 154, 128-149.

Power, J. D. (2017). A simple but useful way to assess fMRI scan qualities. Neuroimage, 154, 150-158.

Bright, M. G., Tench, C. R., & Murphy, K. (2017). Potential pitfalls when denoising resting state fMRI data using nuisance regression. Neuroimage, 154, 159-168.

Griffanti, L., Douaud, G., Bijsterbosch, J., Evangelisti, S., Alfaro-Almagro, F., Glasser, M. F., ... & Smith, S. M. (2017). Hand classification of fMRI ICA noise components. Neuroimage, 154, 188-205.

Bulte, D., & Wartolowska, K. (2017). Monitoring cardiac and respiratory physiology during FMRI. Neuroimage, 154, 81-91.

Moreton, F. C., Dani, K. A., Goutcher, C., O'Hare, K., & Muir, K. W. (2016). Respiratory challenge MRI: practical aspects. NeuroImage: Clinical, 11, 667-677.

Ciric, R., Wolf, D. H., Power, J. D., Roalf, D. R., Baum, G. L., Ruparel, K., ... & Satterthwaite, T. D. (2017). Benchmarking of participant-level confound regression strategies for the control of motion artifact in studies of functional connectivity. Neuroimage, 154, 174-187.

Murphy, K., & Fox, M. D. (2017). Towards a consensus regarding global signal regression for resting state functional connectivity MRI. Neuroimage, 154, 169-173.
Power, J. D., Barnes, K. A., Snyder, A. Z., Schlaggar, B. L., & Petersen, S. E. (2012). Spurious but systematic correlations in functional connectivity MRI networks arise from subject motion. Neuroimage, 59(3), 2142-2154.





2. Practical tips to record rs-fmri data

(1) eyes open, eyes closed, or cross fixation

Patriat, R., Molloy, E. K., Meier, T. B., Kirk, G. R., Nair, V. A., Meyerand, M. E., ... & Birn, R. M. (2013). The effect of resting condition on resting-state fMRI reliability and consistency: a comparison between resting with eyes open, closed, and fixated. Neuroimage, 78, 463-473.

(2) sleep vs. awake or alert

(3) length of recording --- 12 mins

Birn, R. M., Molloy, E. K., Patriat, R., Parker, T., Meier, T. B., Kirk, G. R., ... & Prabhakaran, V. (2013). The effect of scan length on the reliability of resting-state fMRI connectivity estimates. Neuroimage, 83, 550-558.

(4) post-questionnair

Delamillieure, P., Doucet, G., Mazoyer, B., Turbelin, M. R., Delcroix, N., Mellet, E., ... & Joliot, M. (2010). The resting state questionnaire: An introspective questionnaire for evaluation of inner experience during the conscious resting state. Brain research bulletin, 81(6), 565-573.

Diaz, B. A., Van Der Sluis, S., Moens, S., Benjamins, J. S., Migliorati, F., Stoffers, D., ... & Linkenkaer-Hansen, K. (2013). The Amsterdam Resting-State Questionnaire reveals multiple phenotypes of resting-state cognition. Frontiers in human neuroscience, 7, 446.

(5) NOT put rsfmri at the very last

(6) try to use multiple echoes

(7) added a short breath-hold at the end


3. Quality check the data with MRIqc

docker run -it --rm -v ~/Desktop/BBSC/functional:/data:ro \
                    -v ~/Desktop/BBSC/qc :/out \
                    Poldracklab/mriqc:latest \
                    /data  /out  participant \
                    --verbose-reports
                    
                    
                    
4. FSL preprocessing

https://open.win.ox.ac.uk/pages/fslcourse/website/online_materials.html#Prep

