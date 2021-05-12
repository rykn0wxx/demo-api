module Api
  module V1
    class SidebarItemsController < ApplicationController

      # GET /api/v1/sidebar_items
      # GET /api/v1/sidebar_items.json
      def index
        @api_v1_sidebar_items = [
            {
              type: 'header',
              name: 'Main Navigation',
              id: generate_rand_str
            }, {
              type: 'link',
              url: 'home',
              name: 'Home Menu',
              id: generate_rand_str
            }, {
              type: 'toggle',
              open: false,
              name: 'Sub Menu',
              id: generate_rand_str,
              children: [
                {
                  type: 'link',
                  url: 'about',
                  name: 'About Page',
                  id: generate_rand_str
                }, {
                  type: 'toggle',
                  open: false,
                  name: '3rd Level',
                  id: generate_rand_str,
                  children: [
                    {
                      type: 'link',
                      url: 'contact',
                      name: 'Contact Page',
                      id: generate_rand_str
                    }
                  ]
                }
              ]
            }, {
              type: 'toggle',
              open: false,
              name: 'Treeview',
              id: generate_rand_str,
              children: [
                {
                  type: 'link',
                  url: 'blog',
                  name: 'Blog Page',
                  id: generate_rand_str
                }
              ]
            }
          ]
      end

      private
        def generate_rand_str
          rand(36**8).to_s(36) + "-" + rand(36**4).to_s(36) + "-" + rand(36**6).to_s(36)
        end
    end 
  end
end
