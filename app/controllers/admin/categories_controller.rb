class Admin::CategoriesController < Admin::BaseAdminController
    before_filter :authorize

    def index
        puts "INDEX"
        @categories = Category.order(id: :desc).all
    end
    def new 
        puts "NEW"
        @category = Category.new
    end 
    def create
        puts "CREATE"
        @category = Category.new(category_params)
    
        if @category.save
          redirect_to [:admin, :categories], notice: 'Category created!'
        else
          render :new
        end
    end
    def category_params
        params.require(:category).permit(
          :name
        )
      end
end