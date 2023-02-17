class TweetsController < ApplicationController

  def serach
  end

  def show
    # require 'requests'
    require 'json'
    require 'uri'
    require "net/http"

    keyword = URI.encode_www_form_component(params[:keyword])
    # query = URI.encode_www_form_component(query)
    # bearer_tokenを設定（デベロッパーポータルのd　ash boardから入手できる）
    bearer_token = "AAAAAAAAAAAAAAAAAAAAAKX%2FkwEAAAAAPcwHL7EM2TIZ8U%2BVNGaZxW%2Bh9T8%3DCq34Y5Bzfj8AaGkU5HLzwGq22ztD0ZYKavdrUM7lz2ntjYmxJc"
    # uri = URI.parse("https://api.twitter.com/2/tweets/counts/recent?query=#{keyword}&granularity=hour")
    http = Net::HTTP.new(uri.host, uri.port)

    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    req = Net::HTTP::Get.new(uri.request_uri)
    req["Authorization"] = "bearer #{bearer_token}"

    # headerにbearer tokenを設定
    # headers = {"Authorization": "Bearer {}".format(bearer_token)}
    # uri = URI.parse("https://api.twitter.com/2/tweets/counts/recent?query=サッカー&granularity=hour")
    # http = Net::HTTP.new(uri.host, uri.port)
    # http.use_ssl = uri.scheme === "https"

    # headers = { "Content-Type" => "application/json" }
    # response = http.get(uri.path, headers)


    res = http.request(req)
    # response.code # status code
    @tweets = res.body # response body


    # 取得したい項目をオプションで設定
    # "user.fields"でいいねしたユーザーの情報を取得する
    # params = {
    #           "user.fields": "created_at,description,entities,id,location,name,pinned_tweet_id,profile_image_url,protected,public_metrics,url,username,verified,withheld"
    #           }

    # ツイートIDを設定
    # id = "1387227856611069952"

    # urlを設定（いいねしたユーザー情報は末尾urlがliking_usersとなる）
    # url = "https://api.twitter.com/2/tweets/counts/recent?query=サッカー&granularity=hour"

    # 設定情報をリクエスト
    # res = requests.get(url, headers=headers)

    # jsonとして読み込む
    # res_text = res.text
    # @tweets = json.loads(res_text)
  end

  # def show
  #   client = Twitter::REST::Client.new do |config|
  #     # 事前準備で取得したキーのセット
  #     config.consumer_key = ENV['API_KEY']
  #     config.consumer_secret = ENV['API_KEY_SECRET']
  #     config.access_token = ENV['ACCESS_TOKEN']
  #     config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
  #   end

  #   # @bearer_token = "AAAAAAAAAAAAAAAAAAAAAKX%2FkwEAAAAAPcwHL7EM2TIZ8U%2BVNGaZxW%2Bh9T8%3DCq34Y5Bzfj8AaGkU5HLzwGq22ztD0ZYKavdrUM7lz2ntjYmxJc"
  #   # headers = {"Authorization": @bearer_token}

  #   if params[:keyword].present?
  #     @keyword = params[:keyword]
  #     url = "https://api.twitter.com/2/tweets/counts/recent?query=#{@keyword}&granularity=hour" #.format(keyword)
  #     res = client.search(url)

  #     res_text = res.text
  #     @tweets = json.loads(res_text)
  #   end
  # end

  # def show
  #   client = Twitter::REST::Client.new do |config|
  #     # 事前準備で取得したキーのセット
  #     config.consumer_key = ENV['API_KEY']
  #     config.consumer_secret = ENV['API_KEY_SECRET']
  #     config.access_token = ENV['ACCESS_TOKEN']
  #     config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
  #   end
  #   @tweets = []
  #   since_id = nil
  #   # 検索ワードが存在していたらツイートを取得
  #   p params
  #   if params[:keyword].present?
  #     # リツイートを除く、検索ワードにひっかかった最新10件のツイートを取得する
  #     # tweets = client.search(params[:keyword], count: 10, result_type: "recent", exclude: "retweets", since_id: since_id)
  #     @tweets = client.search(params[:keyword],long: "ja", granularity: "HOUR",  result_type: "recent", exclude: "retweets", since_id: since_id).count
  #     # 取得したツイートをモデルに渡す
  #     # tweets.take(10).each do |tw|
  #     #   tweet = Tweet.new(tw)
  #     #   @tweets << tweet
  #     # end

  #   end
  #   # respond_to do |format|
  #   #   format.html # show.html.erb
  #   #   format.json { render json: @tweets } # jsonを指定した場合、jsonフォーマットで返す
  #   # end
  # end
end
# @tweets = client.search(params[:keyword], start_time: "2023-01-07_01:00:00_JST", granularity: "HOUR",  result_type: "recent", exclude: "retweets", since_id: since_id).count
# @tweets_count = client.search(params[:keyword],start_time: "2023-01-04_00:00:00_JST", end_time: "2023-01-04_23:59:59_JST", granularity: "HOUR",  result_type: "recent", exclude: "retweets", since_id: since_id)
# @tweets_count = client.search(params[:keyword],start_time: 2023-01-04_00:00:00_JST, end_time: 2023-01-04_23:59:59_JST,  result_type: "recent", exclude: "retweets", since_id: since_id).size
# since:2023-01-04_00:00:00_JST ,until:2023-01-04_23:59:59_JST

# url = https://api.twitter.com/2/tweets/counts/recent?query=葛葉&granularity=hour