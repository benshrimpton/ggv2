class SettingsController < InheritedResources::Base

  private

    def setting_params
      params.require(:setting).permit()
    end
end

