class HomeController < ApplicationController
  def top
    @posts = Post.all
    @initials = [
      'あ','い','う','え','お',
      'か','き','く','け','こ',
      'さ','し','す','せ','そ',
      'た','ち','つ','て','と',
      'な','に','ぬ','ね','の',
      'は','ひ','ふ','へ','ほ',
      'ま','み','む','め','も',
      'や','ゆ','よ',
      'ら','り','る','れ','ろ',
      'わ','を','ん'
    ]
    @sections = [
      '公共施設','冠婚葬祭','金融機関','幼稚園','中学校',
      '病院','店舗','飲食店','図書館','警察・消防',
      'ゆうちょ','こども園','高校・特別支援学校','医院','コンビニ',
      '泊まる','公民館','団地','JA','保育園',
      '大学・専門学校','歯科','自動車販売','観光','ホール',
      '福祉施設','パチンコ','小学校','画廊','企業',
      'ペット関係','その他学校・教習所・塾・予備校・児童館','接骨院・鍼灸・マッサージ','寺院・神社・宗教','娯楽・お風呂',
      '公園・緑地・スポーツ'
    ]
  end

  def show
    # 通常の検索
    if params[:search].present? or params[:search] == ""
      @posts = Post.where('place_name LIKE ?', "%#{params[:search]}%")
      # 漢字でヒットしない場合、ひらがな検索
      if @posts.present?
        @posts = @posts
      else
        @posts = Post.where('hiragana LIKE ?', "%#{params[:search]}%")
      end
    # チェックボックスの検索
    else
      ## チェックボックス（区分）を取り出してリスト化
      @list_section = []
      params[:section].each do |di1, di2|
        if di2 == "1"
          @list_section.push(di1)
        end
      end
      ## チェックボックス（頭文字）を取り出してリスト化
      @list_initial = []
      params[:initial].each do |di1, di2|
        if di2 == "1"
          @list_initial.push(di1)
        end
      end
      ## どちらかが空の場合は他方の条件のみで検索を実行、両方チェックされている場合はand検索
      if @list_section.empty?
        @posts = Post.where(initial: @list_initial)
      elsif @list_initial.empty?
        @posts = Post.where(section: @list_section)
      else
        @posts = Post.where(initial: @list_initial, section: @list_section)
      end
    end
    @content = params[:search]
    @initials = [
      'あ','い','う','え','お',
      'か','き','く','け','こ',
      'さ','し','す','せ','そ',
      'た','ち','つ','て','と',
      'な','に','ぬ','ね','の',
      'は','ひ','ふ','へ','ほ',
      'ま','み','む','め','も',
      'や','ゆ','よ',
      'ら','り','る','れ','ろ',
      'わ','を','ん'
    ]
    @sections = [
      '公共施設','冠婚葬祭','金融機関','幼稚園','中学校',
      '病院','店舗','飲食店','図書館','警察・消防',
      'ゆうちょ','こども園','高校・特別支援学校','医院','コンビニ',
      '泊まる','公民館','団地','JA','保育園',
      '大学・専門学校','歯科','自動車販売','観光','ホール',
      '福祉施設','パチンコ','小学校','画廊','企業',
      'ペット関係','その他学校・教習所・塾・予備校・児童館','接骨院・鍼灸・マッサージ','寺院・神社・宗教','娯楽・お風呂',
      '公園・緑地・スポーツ'
    ]
  end


  def master
    @post = Post.new(place_name: params[:place_name], near_stop: params[:near_stop], initial: params[:initial], number: params[:number], root: params[:root], memo: params[:memo], section: params[:section], hiragana: params[:hiragana])
    @post.save
    redirect_to('/')
  end



  def update
    @post = Post.find_by(id: params[:id])
  end
  
  def register
    @post = Post.find_by(id: params[:id])
    @post.place_name = params[:place_name]
    @post.near_stop = params[:near_stop]
    @post.initial = params[:initial]
    @post.number = params[:number]
    @post.root = params[:root]
    @post.memo = params[:memo]
    @post.section = params[:section]
    @post.hiragana = params[:hiragana]

    @post.save
    redirect_to("/")
  end

  def map #test
    redirect_to("https://www.google.com/maps")
    # require 'nokogiri'
    # html = File.open('https://www.google.com/maps'){|f| f.read }
    # doc = Nokogiri::HTML.parse(html)
  end



end
