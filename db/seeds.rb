# coding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(:family_name => '山田', :first_name => '太郎', :family_kana => 'ヤマダ', :first_kana => 'タロウ', :post_code => '111-2222', :address => '東京都渋谷区', :phone => '000-0000', :email => 'test@gmail.com', :password => 'testtest')
Genre.create(:genre_name => 'ロック')
Genre.create(:genre_name => '演歌')

Genre.create(:genre_name => 'POPs')
Artist.create(:name => '歌歌子')
Artist.create(:name => '歌うま子')
Artist.create(:name => 'SongJ')

Label.create(:label_name => '日本レコード')
Label.create(:label_name => 'JapanSongs')
Label.create(:label_name => 'EUleco')


Cart.create(:item_id => 1, :user_id => 1, :quantity => 2)
Cart.create(:item_id => 2, :user_id => 2, :quantity => 3)
Cart.create(:item_id => 2, :user_id => 1, :quantity => 3)
Cart.create(:item_id => 2, :user_id => 1, :quantity => 3)


Address.create(:user_id => 1, :sub_family_name => '鈴木', :sub_first_name => '一郎', :sub_family_kana => 'スズキ', :sub_first_kana => 'イチロー', :sub_post_code => "1234567", :sub_address => '東京都渋谷区')
Address.create(:user_id => 1, :sub_family_name => '山田', :sub_first_name => '花子', :sub_family_kana => 'ヤマダ', :sub_first_kana => 'ハナコ', :sub_post_code => "1234567", :sub_address => '東京都渋谷区')


Item.create(:item_name => 'TESTCD', :artist_id => 1, :genre_id => 1, :label_id => 1, :price => 1000, :items_status => 1, :is_deleted => false)
Item.create(:item_name => 'TESTCD2', :artist_id => 2, :genre_id => 2, :label_id => 2, :price => 1000, :items_status => 1, :is_deleted => false)
Item.create(:item_name => 'TESTCD3', :artist_id => 3, :genre_id => 3, :label_id => 3, :price => 2000, :items_status => 1, :is_deleted => false)

OrderOption.create(:user_id => 1, :payment => 1, :delivery_status => 1, :purchase_date => Time.current, :postage => 500, :total_price => 4000, :to_post_code => '111-2222', :to_address => '東京都渋谷区', :to_name => '山田太郎', :to_kana => 'ヤマダタロウ')
Order.create(:item_id => 1, :order_option_id => 1, :past_price => 1000, :buy_quantity => 1)
Order.create(:item_id => 2, :order_option_id => 1, :past_price => 1000, :buy_quantity => 1)
Order.create(:item_id => 3, :order_option_id => 1, :past_price => 2000, :buy_quantity => 1)
Stock.create(:item_id => 1, :stock_date => Date.current, :stock_count => 5, :trader => '西山商事', :trade_price => 500)
Stock.create(:item_id => 2, :stock_date => Date.current, :stock_count => 5, :trader => '西山商事', :trade_price => 500)
Stock.create(:item_id => 3, :stock_date => Date.current, :stock_count => 5, :trader => '西山商事', :trade_price => 1000)

40.times do |i|
 Item.create!(:item_name => "testcd #{i}" ,:artist_id => 1, :genre_id => 1, :label_id => 1, :price => 1000, :items_status => 1, :is_deleted => false)
end
