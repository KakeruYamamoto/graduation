FactoryBot.define do

  factory :event , class: Event do
    title { 'test_event_01' }
    content { 'Factoryで作ったデフォルトのコンテント１' }
  end

  factory :second_event, class: Event do
    title { 'test_event_02' }
    content { 'Factoryで作ったデフォルトのコンテント２' }
  end

  factory :third_event, class: Event do
    title { 'test_event_03' }
    content { 'Factoryで作ったデフォルトのコンテント３' }
    e_date_start { "2019-12-25 00:03:25" }
    address {'東京都港区'}
  end


end
