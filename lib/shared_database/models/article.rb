class Article < ActiveRecord::Base
    validates :url, uniqueness: true

    has_many :group_articles
    has_many :groups, through: :group_articles

    has_many :feedbacks
    has_many :users, through: :feedbacks
    
    def self.get_page(start_id, end_id, order)
        max_pagesize = 100
        if order.upcase == "ASC"
            order_published = "published_at ASC"
        elsif order.upcase == "DESC"
            order_published = "published_at DESC"
        else 
            order_published = "published_at DESC"
        end
        end_id = end_id - start_id < max_pagesize ? end_id : start_id + max_pagesize - 1
        Article.where(id: start_id..end_id).order(order_published)
    end

    def self.get_article_by_category(page, pagesize, category)
        # Check if both page and pagesize parameters are integers
        ensure_integer(page, "Page")
        ensure_integer(pagesize, "Pagesize")

        offset_value = (page - 1) * pagesize

        where("category = ?", category)
        .offset(offset_value)
        .limit(pagesize)
        .to_a
    end

    def self.get_article(id)
        Article.where(id: id).limit(1)
    end

    def self.ensure_integer(parameter, name)
        unless parameter.is_a?(Integer)
          raise ArgumentError, "#{name} must be an integer."
        end
    end
end
