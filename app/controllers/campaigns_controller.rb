class CampaignsController < ApplicationController
  before_filter :authenticate_company!
  before_filter :allow_edit, only: :edit
  def index
    @campaigns = Campaign.all
    @companies = Company.all
    @company = Company.find(params[:company_id])
    @campaign = @company.campaigns.last

        #Charts begin here

    #social action chart
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
        f.title({ :text=>"Social Actions"})
        f.options[:xAxis][:categories] = ['Email Shares',
                     'FB Shares',
                     'FB Likes',
                     'FB Comments',
                     'Friends Invited',
                     'Twitter Followers',
                     'Twitter Shares',
                     'Pins',
                     'Pinterest Followers',
                     'Tumblr Shares']
        f.labels(:items=>[:html=>"Total Social Actions", :style=>{:left=>"40px", :top=>"8px", :color=>"black"} ])      
        f.series(:type=> 'column',:name=> 'Spreeify',:data=> [@campaign.email_shares ,@campaign.fb_shares ,@campaign.fb_likes ,@campaign.fb_comments ,@campaign.friends_invited ,@campaign.twitter_followers ,@campaign.twitter_shares, @campaign.pins, @campaign.pinterest_followers, @campaign.tumblr_shares ])
    end
    #social actions chart ends

    #chart comparing facebook cost to spreeify cost
    @bar_facebook = LazyHighCharts::HighChart.new('column') do |f|
      f.series(:name=>'Facebook',:data=> [1.07])
      f.series(:name=>'Spreeify',:data=>[@campaign.cost_per_fb_like] )   
      f.title({ :text=>"Price Comparison - Facebook Followers"})

      ###  Options for Bar
      ### f.options[:chart][:defaultSeriesType] = "bar"
      ### f.plot_options({:series=>{:stacking=>"normal"}}) 

      ## or options for column
      f.options[:chart][:defaultSeriesType] = "column"
      f.plot_options({:column=>{:stacking=>"normal"}})
    end
    #end chart

    #chart comparing twitter to spreeify
    @bar_twitter = LazyHighCharts::HighChart.new('column') do |f|
      f.series(:name=>'Twitter',:data=> [2])
      f.series(:name=>'Spreeify',:data=>[@campaign.cost_per_twitter_follower] )   
      f.title({ :text=>"Price Comparison - Twitter Followers"})

      ###  Options for Bar
      ### f.options[:chart][:defaultSeriesType] = "bar"
      ### f.plot_options({:series=>{:stacking=>"normal"}}) 

      ## or options for column
      f.options[:chart][:defaultSeriesType] = "column"
      f.plot_options({:column=>{:stacking=>"normal"}})
    end
    #end chart

    #chart comparing pinterest costs
    @bar_pins = LazyHighCharts::HighChart.new('column') do |f|
      f.series(:name=>'Pinterest',:data=> [0.5])
      f.series(:name=>'Spreeify',:data=>[@campaign.cost_per_pinterest_follower] )   
      f.title({ :text=>"Price Comparison - Pinterest Followers"})

      ###  Options for Bar
      ### f.options[:chart][:defaultSeriesType] = "bar"
      ### f.plot_options({:series=>{:stacking=>"normal"}}) 

      ## or options for column
      f.options[:chart][:defaultSeriesType] = "column"
      f.plot_options({:column=>{:stacking=>"normal"}})
    end
    #end chart

    #pie chart for Device breakdown
    @chart_device = LazyHighCharts::HighChart.new('pie') do |f|
      f.chart({:defaultSeriesType=>"pie" } )
      series = {
               :type=> 'pie',
               :name=> 'Device Breakdown',
               :data=> [
                  ['Desktop',   60.0],
                  ['Mobile',       30.0],
                  {
                     :name=> 'Tablet',    
                     :y=> 10,
                     :sliced=> true,
                     :selected=> true
                  }
               ]
      }
      f.series(series)
      f.options[:title][:text] = "Device Breakdown"
      f.plot_options(:pie=>{
        :allowPointSelect=>true, 
        :cursor=>"pointer" , 
        :dataLabels=>{
          :enabled=>true,
          :color=>"black",
          :style=>{
            :font=>"13px Trebuchet MS, Verdana, sans-serif"
          }
        }
      })
    end
    #end chart

    #gender breakdown pie chart
    @chart_gender = LazyHighCharts::HighChart.new('pie') do |f|
      f.chart({:defaultSeriesType=>"pie" } )
      series = {
               :type=> 'pie',
               :name=> 'Gender Breakdown',
               :data=> [
                  ['Male',   24.0],
                  {
                     :name=> 'Female',    
                     :y=> 76,
                     :sliced=> true,
                     :selected=> true
                  }
               ]
      }
      f.series(series)
      f.options[:title][:text] = "Gender Breakdown"
      f.plot_options(:pie=>{
        :allowPointSelect=>true, 
        :cursor=>"pointer" , 
        :dataLabels=>{
          :enabled=>true,
          :color=>"black",
          :style=>{
            :font=>"13px Trebuchet MS, Verdana, sans-serif"
          }
        }
      })
    end
    #end chart
  end

  def show
      @campaigns = Campaign.all
      @companies = Company.all
     	@company = Company.find(params[:company_id])
    	@campaign = @company.campaigns.find(params[:id])
      
    #Charts begin here

    #social action chart
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
        f.title({ :text=>"Social Actions"})
        f.options[:xAxis][:categories] = ['Email Shares',
                     'FB Shares',
                     'FB Likes',
                     'FB Comments',
                     'Friends Invited',
                     'Twitter Followers',
                     'Twitter Shares',
                     'Pins',
                     'Pinterest Followers',
                     'Tumblr Shares']
        f.labels(:items=>[:html=>"Total Social Actions", :style=>{:left=>"40px", :top=>"8px", :color=>"black"} ])
        f.colors(['#663399'])      
        f.series(:type=> 'column',:name=> 'Spreeify',:data=> [@campaign.email_shares ,@campaign.fb_shares ,@campaign.fb_likes ,@campaign.fb_comments ,@campaign.friends_invited ,@campaign.twitter_followers ,@campaign.twitter_shares, @campaign.pins, @campaign.pinterest_followers, @campaign.tumblr_shares ])
    end
    #social actions chart ends


    #chart comparing twitter to spreeify
    @bar_comparison = LazyHighCharts::HighChart.new('column') do |f|
            
      f.series(:name=>'Twitter',:data=> [2, 0])
      f.series(:name=>'Facebook',:data=>[0,1.07])
      f.colors(['#8EC1DA','#3B5998','#663399'])  
      f.series(:name=>'Spreeify',:data=>[@campaign.cost_per_twitter_follower, @campaign.cost_per_fb_like] )   

  
      f.title({ :text=>"Price Comparison - Social Actions"})

      ###  Options for Bar
      ### f.options[:chart][:defaultSeriesType] = "bar"
      ### f.plot_options({:series=>{:stacking=>"normal"}}) 

      ## or options for column
      f.options[:chart][:defaultSeriesType] = "column"
      f.plot_options({:column=>{:stacking=>"normal"}})
    end
    #end chart

    #pie chart for Device breakdown
    @chart_device = LazyHighCharts::HighChart.new('pie') do |f|
      f.chart({:defaultSeriesType=>"pie" } )
      series = {
               :type=> 'pie',
               :name=> 'Device Breakdown',
               :data=> [
                  ['Desktop',   60.0],
                  ['Mobile',       30.0],
                  {
                     :name=> 'Tablet',    
                     :y=> 10,
                     :sliced=> true,
                     :selected=> true
                  }
               ]
      }
      f.series(series)
      f.options[:title][:text] = "Device Breakdown"
      f.plot_options(:pie=>{
        :allowPointSelect=>true, 
        :cursor=>"pointer" , 
        :dataLabels=>{
          :enabled=>true,
          :color=>"black",
          :style=>{
            :font=>"13px Trebuchet MS, Verdana, sans-serif"
          }
        }
      })
    end
    #end chart

    #gender breakdown pie chart
    @chart_gender = LazyHighCharts::HighChart.new('pie') do |f|
      f.chart({:defaultSeriesType=>"pie" } )
      series = {
               :type=> 'pie',
               :name=> 'Gender Breakdown',
               :data=> [
                  ['Male',   24.0],
                  {
                     :name=> 'Female',    
                     :y=> 76,
                     :sliced=> true,
                     :selected=> true
                  }
               ]
      }
      f.series(series)
      f.options[:title][:text] = "Gender Breakdown"
      f.plot_options(:pie=>{
        :allowPointSelect=>true, 
        :cursor=>"pointer" , 
        :dataLabels=>{
          :enabled=>true,
          :color=>"black",
          :style=>{
            :font=>"13px Trebuchet MS, Verdana, sans-serif"
          }
        }
      })
    end
    #end chart

  end


  def edit
    @campaigns = Campaign.all
    @companies = Company.all
  	@company = Company.find(params[:company_id])
  	@campaign = @company.campaigns.find(params[:id])
  end

  def update
    @campaign = Company.find(params[:company_id]).campaigns.find(params[:id])
    @company = Company.find(params[:company_id])
    if @campaign.update_attributes(params[:campaign])
      redirect_to :controller=>'campaigns', :action => 'show', :id => @campaign.id
      flash[:success] = "Update Success"
    else
      redirect_to :controller=>'campaigns', :action => 'show', :id => @campaign.id
      flash[:failure] = "Update unsuccessful"
    end

  end
end
