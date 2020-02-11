FactoryBot.define do

  factory :event , class: Event do
    title { 'test_event_01' }
    content { 'Factoryで作ったデフォルトのコンテント１' }
    e_date_start { "2021-12-01 12:03:25" }
    e_date_end { "2021-12-01 13:03:25" }
    address {'北海道札幌市'}

  end

  factory :second_event, class: Event do
    title { 'test_event_02' }
    content { 'Factoryで作ったデフォルトのコンテント２' }
    e_date_start { "2021-12-15 00:00:25" }
    e_date_end { "2021-12-15 01:03:25" }
    address {'沖縄県那覇市'}

  end

  factory :third_event, class: Event do
    title { 'test_event_03' }
    content { 'Factoryで作ったデフォルトのコンテント３' }
    e_date_start { "2021-12-25 00:03:25" }
    e_date_end { "2021-12-25 03:03:25" }
    address {'東京都港区'}
  end


end
