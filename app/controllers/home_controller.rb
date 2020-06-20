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
  end

  def show
    @posts = Post.where('place_name LIKE ?', "%#{params[:search]}%")
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
  end

  def show_check
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
    @list = []
    params[:initial].each do |di1, di2|
      if di2 == "1"
        @list.push(di1)
      end
    end
    @posts = Post.where(initial: @list)
  end

  def master
    @post = Post.new(place_name: params[:place_name], near_stop: params[:near_stop], initial: params[:initial], number: params[:number], root: params[:root], memo: params[:memo], section: params[:section])
    @post.save
    redirect_to('/')
  end
  #コメント

end
