class TransactionsController < ApplicationController
    def index
        @groups = Group.all
    end
end
