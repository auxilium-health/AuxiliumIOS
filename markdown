## Inspiration
We were inspired by our grandparents who have to take so many medications at such an age and it gets very hard to keep track of them. We have heard stories of them missing their medications and in some cases it can lead to serious harm. So we set out to use technology to solve this everyday problem.

## What it does
'Auxilium' is Latin for "aid." Auxilium provides aid in taking your medications on time and not missing any medications. You start off by taking a photo of the label on your medication, and the app will parse the text and get the name of the medication and how often you need to take it. Then you add in data for what color will represent this medication and when you need to refill it. The refill date is entered into your calendar.

On the home screen you will see an analog clock with small circles at different times. The circles each represent a medication and when you need to take it. Then the app will send a notification when it is time to take the medication.

In addition to the core funtionality, the app allows inputting other useful data such as your doctor and pharmacy information. You can call your doctor and navigate to the pharmacy from the app.

## How we built it
We used Tesseract and the Google Cloud Vision API to parse the information on the text labels, and extracted the medication name using the relative location. To parse the doctor's instruction on the prescription for when to medication, we used API.AI's natural language processing. Once we get this data, we use drugbank to let the user select the exact medication. We are using Firebase to store all of the user information, secured through Google sign in. 

## Challenges we ran into
- OCR: 
	- Extracting the correct information (e.g. the drug name) from the text blocks
	- Android: changing from using the on-device Mobile Vision API to the web-based Cloud Vision API for better accuracy took more than 4 hours.
- Natural Language Processing:
	- Trying to find an API or framework that allows parsing specific information from the doctor's instructions, and configuring it to work with
- Curved bottles:
	- We didn't have enough time to implement the solution, but we spent several hours working on trying to integrate a panoramic stitching library to flatten prescriptions on curved bottles.
- Google Sign In API:
	- The legacy API version uses the old client libraries while the new one uses Play Services, and figuring out that the new one is incompatible with Firebase UI sign in took at least 2 hours.

## Accomplishments that we're proud of
We're very proud that we were able to build both an iOS and Android application from scratch during the short hackathon. We were able to recognize text from a photo and extract the proper information, which was something that we thought would be very hard (in fact, this was mostly experimental and we though we would need to rely on our backup plan on letting the user find the medication from a list). 

## What We learned
* Tesseract
* Google Cloud Vision API
* API.AI
* Camera and Image API (Android and iOS)
* Firebase
* Google Sign In

## What's next for Auxilium
Enhancements:
* Improve reliability of OCR & NLP
* Better Memory Management

New Features:
* Scan curved bottles using image stitching library
* Integrate with Walgreens, CVS APIs for prescription refill
* Take ad revenue and donate to organizations to protect teens from drugs