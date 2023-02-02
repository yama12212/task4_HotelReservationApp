class ShowPdf < Prawn::Document
  def initialize
    super(page_size: 'A4',page_layout: :landscape) #A4サイズのPDFを新規作成
    stroke_axis # 座標を表示

    #日本語フォント読み込み
    font_families.update('JP' => {
      normal: 'app/assets/fonts/ipaexm.ttf',
      bold: 'app/assets/fonts/ipaexg.ttf'
    })
    font 'JP'

    stroke_polygon [50, 200], [50, 300], [150, 300]
  end
end
