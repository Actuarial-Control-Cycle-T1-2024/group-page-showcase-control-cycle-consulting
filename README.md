# Actuarial Theory and Practice A (ACTL4001) - UNSW

<img width="400" alt="image" src="SuperLife.png">

### Control Cycle Consulting presents our submission to the [2024 SOA Research Challenge](https://www.soa.org/research/opportunities/2024-student-research-case-study-challenge/)

>We are team Control Cycle, a consulting team within the actuarial division in one of Lumaria's biggest life insurance companies called SuperLife. In this project we have been tasked with providing a detailed report summarising our findings when constructing a robust health and wellness program. The final report is accessed [here](https://github.com/Actuarial-Control-Cycle-T1-2024/group-page-showcase-control-cycle-consulting/blob/main/Team%20Control%20Cycle%20Report.pdf). A summary of the report is provided below, however referring to the report will provide deeper insights into the conclusions drawn throughout the creation of SuperLife's health and wellness plan.
>
>Within the first few weeks of in the planning stages of our reporting and modelling, our team created a project outline and this can be accessed [here](https://github.com/Actuarial-Control-Cycle-T1-2024/group-page-showcase-control-cycle-consulting/blob/main/Project%20Outline.pdf).
>
>The main model used to project the cash flows of the newly implemented wellness program and any sensitivity analysis conducted can be accessed [here](https://github.com/Actuarial-Control-Cycle-T1-2024/group-page-showcase-control-cycle-consulting/blob/main/Projection%20of%20Cash%20Flows.xlsm). The additional files provided are supplementary and certain excel spreadsheets provide an indication of background calculations used to create some of the tabs in the main model excel spreadsheet. 

# Team Members
* Aazeen Ashar (z5349309)
* Divena Rajasundaram (z5363882) 
* Helen Wang (z5364763)
* Alex Weng (z5308238)
* Yuhan Zhou (z5361664)

# Feedback
Our team sees the value in constantly reviewing our modelling and reporting writing procedures as this is a critical aspect of the actuarial control cycle, hence our team strongly welcomes any feedback, especially any criticism that can be used to iteratively revise our existing procedures.

# Report Overview
**1 Objectives**

The provided wellness plan is aimed to incentivise Lumarian citizens to adopt healthier lifestyles to reduce mortality and increase life insurance sales based on the popularity of the proposed incentives. Once the products are made publicly available, monitoring at regular intervals (see Program Design) is required to assess the effectiveness of the program, mitigate any rise in risks, and make updates for any changes needed. The specific objectives are as follows:
1. Reduce expected mortality
2. Incentivise healthier behaviours
3. Increase insurance sales
4. Increase SuperLife's economic value
5. Improve marketability and competitiveness

_1.1 Key Performance Metrics_

A combination of long-term (reported biennially) and short-term metrics (reported quarterly) will be used to test the viability of the product. Metrics include:
1. New business participation rate (short-term)
2. Retention participation rate (short-term)
3. Satisfaction surveys (short-term)
4. Claim severity and frequency (short-term)
5. Financial viability (long-term)
6. Scalability and replicability (long-term)

**2 Program Design**

The most prevalent causes of death were identified as neoplasms (C00-D48) and cardiovascular diseases (I00-I99) (ICD-10, 2019). Consequently, the two health incentives drawn up are aimed to significantly prevent and reduce the occurrence of these ailments. The two final products target all age groups and individuals from both rural and urban households, and are as follows:

_2.1 Cardio Improvement App Package_

Combination of 2 apps targeted towards individuals aged 25-35, and are created with respective goals of reducing heart failure and heart disease through screenings and weight management programs, while also targeting an individual’s fitness via tracking and weight loss regimes. 

_2.2 Cancer Prevention Package_

Package consisting of several health screening initiatives targeted towards those aged 45 and the aim of the tests is to detect any abnormalities in the human body and if cancerous tissues are detected, they can be prevented from spreading.

_2.3 Marketing Strategy_

Our wellness program has been designed under an acquisition marketing strategy and was supported by creating market personas to better understand SuperLife’s customer base and target the right audience. 

_2.4 Timeframes for Program Evaluation_

<img width="700" alt="image" src="https://github.com/Actuarial-Control-Cycle-T1-2024/group-page-showcase-control-cycle-consulting/assets/164708206/be451168-5699-4f4f-bdff-be090ddf7211">

**3 Pricing & Costs**

_3.1 Lifetables_

To project mortality, life tables were constructed from the SuperLife In-Force dataset. The investigation period chosen was 2015-2019 to avoid including outliers while maintaining recency. Below is a graph of the projected mortality rates, and from these mortality improvements were applied to these rates.

<img width="700" alt="image" src="https://github.com/Actuarial-Control-Cycle-T1-2024/group-page-showcase-control-cycle-consulting/assets/164708206/3ede2a56-5589-484c-aa53-d30f852d19bb">

_3.2 Mortality Improvements_

<img width="700" alt="image" src="https://github.com/Actuarial-Control-Cycle-T1-2024/group-page-showcase-control-cycle-consulting/assets/164708206/12f6cc50-d2d7-4930-b030-aa3183d2d569">

_3.3 Projected Premiums for Individual Policyholders_

* SWPL: All inforce policyholders are assumed to have paid their single premium at their entry year. Therefore, no further calculations were required.
* 20-Year-Term Insurance: The zeroization method was used to calculate the individual non-discount premium, this ensured that all products were self-supporting and only had a single financing phase at the outset where project may potentially be negative. These exact premiums are provided below:

<img width="500" alt="image" src="https://github.com/Actuarial-Control-Cycle-T1-2024/group-page-showcase-control-cycle-consulting/assets/164708206/82b01019-bf54-4da0-aec2-83c901ee5c75">

**4 Assumptions**
* Cohort-based modelling approach whereby modelling premiums was conducted based on all policyholders who began their policy in 2023.
* Assumed a calendar rate interval, with age being defined as age as at last birthday.
* Wellness programs are assumed to have been well developed in coordination with a variety of health care professionals. Thus it is assumed that the majority of an individual’s mortality improvements will be realised within the first year of policyholders participating in the wellness program. This implication combined with the age definition whereby an individual’s age label is defined by their age last year artificially creates an instantaneous reduction in mortality in the modelling process.
* Marketing costs were allocated to equal 10% of the total costs for each incentive.
* Assumed that not all policyholders would participate in both incentive programs, and there was assumed independence for the participation rates within either program for individuals at various model age points.

**5 Risk Assessment**

Key risks identified were placed into a risk map, following from these various mitigations strategies have been suggested for greater detail referring to section 5 of the report is recommended. The specific risks analysed include:
* Market risk
* Liquidity risk
* Execution risk
* Technology/cyber risk
* Changing customer preference risk
* Regulatory risk

<img width="250" alt="image" src="https://github.com/Actuarial-Control-Cycle-T1-2024/group-page-showcase-control-cycle-consulting/assets/164708206/511e993e-156d-4a41-ba7e-847d88d1e84f">
 
**6 Data and Data Limitations**

<img width="600" alt="image" src="https://github.com/Actuarial-Control-Cycle-T1-2024/group-page-showcase-control-cycle-consulting/assets/164708206/9c3d5269-2d38-4247-b1c0-de2acd44adc2">

**7 Ethical Considerations**

Ethics was not able to be consistently upheld across all facets of pricing and design. Justified by the virtue ethics framework, the program has been designed to recognise the needs of different generations. For example, age-discrimination was minimised by producing a program that markets technology to younger generations, and screenings to older individuals. Smoking status was found to be statistically significant, causing a 15% premium surcharge to be applied to smokers. This decision helps to reduce financial burden, incentivise healthier lifestyles, and improve well-being. 

The program, however, is limited in capturing socio-economic differences, as rural and urban based geographies were not found to be statistically significant with respect to survival time. The consequent T20 annual premium, priced to be approximately 25% of an average Lumaria’s annual income, reduces accessibility by lower income individuals. This can lead to life-underinsurance, which has more pronounced effects on lower income individuals who are susceptible to financial hardships.

Although gender discrimination within life tables is prohibited in many developed countries including Australia, it is unclear if this is the case in Lumaria. Gender has been used in the pricing process to achieve a more granular view on mortality rates. However, based on the fairness and justice approach, it may stimulate gender discrimination and unequal treatment of males and females in life insurance policies. Further, potential concerns arising from data privacy and cybersecurity can arise within the implementation of the Cardio app incentive. Therefore clear internal governance procedures and regular maintenance processes are needed to ensure that all sensitive information is not unethically abused.

**8 Final Recommendation**

Implementing the Cardio Improvement App and the Cancer Prevention Pack is recommended for SuperLife’s ability to incentivise healthier behaviours and reduce expected mortality. The two apps, CardiWell and FitSync offer heart screenings and personalised health plans. While CancerShield includes various cancer related screening initiatives that monitor and enhance the competitiveness of insurance products, fostering marketability and leading to projected growth. Profit from SPWL is expected to grow, and losses from T20 have improved after the program’s implementation. For future improvements on pricing strategy, it is recommended that factors such as underwriting class and urban/rural status should be considered in premium pricing to further alleviate ethical concerns. Finally, a larger profit margin is recommended to be applied to T20 policies to ensure consistently high growth rates for the implemented health and wellness program.

<img width="750" alt="image" src="Actuarial.gif">

