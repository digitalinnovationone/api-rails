class HomeController < ApplicationController
    skip_before_action :autenticacao

    def index;end
end
