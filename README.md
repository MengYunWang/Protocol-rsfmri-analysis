# My protocol of analyzing rsfMRI data

[How to analyze the rs-fMRI](https://www.ohbmbrainmappingblog.com/blog/ohbm-ondemand-how-to-resting-state-fmri-analysis)

## 1. [Noisy bussiness](https://www.youtube.com/watch?v=fvv2dr3pT7I) 

Caballero-Gaudes, C., & Reynolds, R. C. (2017). Methods for [**cleaning the BOLD fMRI signal**](https://doi.org/10.1016/j.neuroimage.2016.12.018). Neuroimage, 154, 128-149.

Bright, M. G., Tench, C. R., & Murphy, K. (2017). Potential pitfalls when denoising resting state fMRI data using [**nuisance regression**](https://doi.org/10.1016/j.neuroimage.2016.12.027). Neuroimage, 154, 159-168.

Griffanti, L., Douaud, G., Bijsterbosch, J., Evangelisti, S., Alfaro-Almagro, F., Glasser, M. F., ... & Smith, S. M. (2017). Hand classification of fMRI [**ICA noise components**](https://doi.org/10.1016/j.neuroimage.2016.12.036). Neuroimage, 154, 188-205.

Murphy, K., & Fox, M. D. (2017). Towards a consensus regarding [**global signal regression**](https://doi.org/10.1016/j.neuroimage.2016.11.052) for resting state functional connectivity MRI. Neuroimage, 154, 169-173.

### (1) Physiological noise

- **Head movement**

Power, J. D., Barnes, K. A., Snyder, A. Z., Schlaggar, B. L., & Petersen, S. E. (2012). Spurious but systematic correlations in functional connectivity MRI networks arise from [**subject motion**](https://doi.org/10.1016/j.neuroimage.2011.10.018). Neuroimage, 59(3), 2142-2154.  ***FD; DVARS***

Ciric, R., Wolf, D. H., Power, J. D., Roalf, D. R., Baum, G. L., Ruparel, K., ... & Satterthwaite, T. D. (2017). Benchmarking of participant-level confound regression strategies for the control of **motion artifact** in studies of functional connectivity. Neuroimage, 154, 174-187.

- **Cardiac pulse**

Bulte, D., & Wartolowska, K. (2017). Monitoring [**cardiac and respiratory**](https://doi.org/10.1016/j.neuroimage.2016.12.001) physiology during FMRI. Neuroimage, 154, 81-91.

- **Respitory breath**

Moreton, F. C., Dani, K. A., Goutcher, C., O'Hare, K., & Muir, K. W. (2016). [**Respiratory**](https://doi.org/10.1016/j.nicl.2016.05.003) challenge MRI: practical aspects. NeuroImage: Clinical, 11, 667-677.


### (2) Inherent physics

- **Metal**

- **Susceptibility**

### (3) Hardware issue

- **Loose connectors**

We could do something about the ***psysioligical noise*** with nuisanse regreesion, ICA or GSR, but little can do with the other two. If there are some issues related to the second and third factors, you should contact technician or physicist, or even better, buy a new one! :sunglasses: :dollar:	

## 2. Practical tips to record rs-fmri data

### (1) Eyes open, eyes closed, or cross fixation

Patriat, R., Molloy, E. K., Meier, T. B., Kirk, G. R., Nair, V. A., Meyerand, M. E., ... & Birn, R. M. (2013). The effect of resting condition on resting-state fMRI reliability and consistency: a comparison between [**resting with eyes open, closed, and fixated**](https://doi.org/10.1016/j.neuroimage.2013.04.013). Neuroimage, 78, 463-473.

### (2) Sleep, awake or alert
Well, at least the participants should be awake!

### (3) Length of recording --- **_12 mins_**

Birn, R. M., Molloy, E. K., Patriat, R., Parker, T., Meier, T. B., Kirk, G. R., ... & Prabhakaran, V. (2013). The effect of [**scan length**](https://doi.org/10.1016/j.neuroimage.2013.05.099) on the reliability of resting-state fMRI connectivity estimates. Neuroimage, 83, 550-558.

### (4) Post-questionnair

Delamillieure, P., Doucet, G., Mazoyer, B., Turbelin, M. R., Delcroix, N., Mellet, E., ... & Joliot, M. (2010). [**The resting state questionnaire**](https://doi.org/10.1016/j.brainresbull.2009.11.014): An introspective questionnaire for evaluation of inner experience during the conscious resting state. Brain research bulletin, 81(6), 565-573.

Diaz, B. A., Van Der Sluis, S., Moens, S., Benjamins, J. S., Migliorati, F., Stoffers, D., ... & Linkenkaer-Hansen, K. (2013). [**The Amsterdam Resting-State Questionnaire**](https://doi.org/10.3389/fnhum.2013.00446) reveals multiple phenotypes of resting-state cognition. Frontiers in human neuroscience, 7, 446.

### (5) _NOT!!!_ put rsfMRI at the very last

### (6) Try to use multiple echoes

### (7) Added a short breath-hold at the end


## 3. Quality check the data with MRIqc
Power, J. D. (2017). A simple but useful way to [**assess fMRI scan qualities**](https://doi.org/10.1016/j.neuroimage.2016.08.009). Neuroimage, 154, 150-158.

Software: Esteban O, Birman D, Schaer M, Koyejo OO, Poldrack RA, Gorgolewski KJ; [**MRIQC**](https://mriqc.readthedocs.io/en/latest/index.html): Advancing the Automatic Prediction of Image Quality in MRI from Unseen Sites; PLOS ONE 12(9):e0184661. 

```
# input data format should be BIDS!
docker run -it --rm -v ~/Desktop/BBSC/functional:/data:ro \ # absolute path for the input data
                    -v ~/Desktop/BBSC/qc :/out \ # absolute path for the output data
                    Poldracklab/mriqc:latest \ # indicate which version should be used
                    /data  /out  participant \ # indicate which level should be analyzed
                    --verbose-reports
```                    
### Which result or parameter should we look at or emphasize on?

#### (1) Structual data (T1 image)
- Technical quality: **E**ntropy **F**ocus **C**ritieria (***EFC***); **F**ull **W**idth at **H**alf **M**aximum (***FWHM***)

  **EFC**: the ***lower*** the better;

  **FWHM**: the ***lower*** the better;

- Physiological variation: **S**ignal to **N**oise **R**atio (***SNR***)

  **SNR**: the ***higher*** the better;

#### (2) Funciotnal data (T2* image)
- Spatial info
 
  **EFC**: the ***lower*** the better;

  **FWHM**: the ***lower*** the better;
- Temporal info: **F**ramewise **D**isplacement(***FD***); **DVRS** (D:temporal Derivative of timecourses; VRS:root mean square variance over voxels)
 
  **FD**:the ***lower*** the better (0.2-0.5 mm);
  
  **DVRS**:the ***lower*** the better;
## 4. FSL preprocessing

[Official fsl course](https://open.win.ox.ac.uk/pages/fslcourse/website/online_materials.html#Prep)

### My protocol to analyzed the rs-fMRI data

(1) Unix commands

[Frequently used commands](https://www.youtube.com/playlist?list=PLvgasosJnUVnnFifxecbyEno7jnqrl8fQ)

[Other useful commands](https://fsl.fmrib.ox.ac.uk/fslcourse/lectures/scripting/all.htm)

(2) FSL basic knowledge

[FSLeyes](https://open.win.ox.ac.uk/pages/fsl/fsleyes/fsleyes/userdoc/index.html)

[FSLUTILS](https://open.win.ox.ac.uk/pages/fslcourse/practicals/intro3/index.html)

(3) 
Brain Extraction Tool:

FEAT:

FLERT:











