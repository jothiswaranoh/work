class FeedbackformsController < ApplicationController
    def index
        @feedbackform= Feedback.all
    end

    def new
        @feedbackform = Feedback.new
    end
       # @feedbackform = Feedback.new(feedbackform_params)
    
    # if @feedbackform.save
    #       redirect_to feedbackforms_path, notice: 'Form was successfully created'
    #     else
    #         redirect_to feedbackforms_path, notice: 'Form not was successfully created'
    #     end
   
   
    # def create
    #     @feedbackform = Feedback.new(feedbackform_params)
    
    #     if @feedbackform.save
    #       redirect_to feedbackforms_path, notice: 'Form was successfully created'
    #     else
    #         redirect_to feedbackforms_path, notice: 'Form not was successfully created'
    #     end
    #   end
  

    private

    def feedbackform_params
        params.require(:feedbackforms).permit(:name, :place, :age)
       # params it a oject,like hash eg
#        params = {
#   "utf8" => "✓",
#   "authenticity_token" => "...",
#   "feedbackforms" => {
#     "name" => "John",
#     "place" => "New York",
#     "age" => "30"
#   },
#   "commit" => "Submit"
# }
#permit 
# The permit method is used in conjunction with require to specify which parameters are allowed to be mass-assigned to a model.
      end
end
