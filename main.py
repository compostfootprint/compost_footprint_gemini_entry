# Welcome to Cloud Functions for Firebase for Python!
# To get started, simply uncomment the below code or create your own.
# Deploy with `firebase deploy`
from dotenv import load_dotenv
from firebase_functions import https_fn, options
from firebase_admin import initialize_app
import os
import logging
import google.generativeai as genai
import typing_extensions as typing



# Initialize Firebase app
app = initialize_app()

# Load environment variables
load_dotenv()

# Set up API keys
GEMINI_API_KEY = os.getenv('GEMINI_API_KEY')

# Define types
class CompostableItem(typing.TypedDict):
    uid: str
    name: str
    compostable: bool
    description: str
    imageUrl: str
    co2Saved: float
    landfillSaved: float


def get_compos_result_from_ai(item):
    try:
        genai.configure(api_key=GEMINI_API_KEY)
        model = genai.GenerativeModel('gemini-1.5-flash', generation_config={"response_mime_type": "application/json", "response_schema": CompostableItem})
        prompt = (
            f"Given the name of an item, calculate the CO2 equivalent (CO2e) savings when this item is composted instead of sent to a landfill. Please follow these steps:"
            f"Retrieve Data:"
            f"Weight: Look up the average weight of the item in grams."
            f"Carbon Content: Estimate the carbon content based on the composition of the item."
            f"Landfill Decomposition:"
            f"Assume decomposition is anaerobic, producing methane (CH₄)."
            f"Estimate that 50% of carbon in the apple converts to methane during landfill decomposition."
            f"Use a global warming potential (GWP) of 28 for methane over 100 years."
            f"Composting Decomposition:"
            f"Assume decomposition is aerobic, producing CO2, which is considered carbon-neutral in the short term."
            f"Assume the item decomposes fully, contributing to soil carbon sequestration."
            f"Perform Calculations:"
            f"CO2e from Landfilling: Calculate the CO2 equivalent produced if the item is sent to a landfill, considering methane emissions."
            f"CO2 from Composting: Calculate the CO2 emissions if the item is composted, assuming aerobic decomposition."
            f"CO2e Savings: Determine the CO2e savings by composting the apple instead of sending it to a landfill."
            f"Make sure to use kg as a unit for the co2 saved."
            f"In your json response, please also include the following:"
            f"random 20 digit uid of upper case, lower case, characters and numbers."
            f"a brief description of how you calculated co2 saved."
            f"an image URL for the item."
            f"the approximate landfill space saved in cubic centimetres, based on average size of item."
            f"The item is an {item}"
        )
        response = model.generate_content(prompt)
        
        return response.text
    except Exception as e:
        logging.error(f"Error in AI processing: {e}")
        raise

@https_fn.on_call(
    cors=options.CorsOptions(
        cors_origins="*",
        cors_methods=["POST", "OPTIONS"]
    )
)
def get_compost_results(req: https_fn.CallableRequest):
    logging.info('Request received')
    try:
        data = req.data
        item = data.get('item')
        if not item:
            return req.error(400, 'Item is required')
        response = get_compos_result_from_ai(item)
        return response
    except Exception as e:
        logging.error(f"Error in get_compost_results: {e}")
        return {"error": str(e)}, 500