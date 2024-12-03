require 'rails_helper'
FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example' }
    password              { 'abc123' }
    password_confirmation { 'abc123' }
    name_last            { '山田' }
    name_first           { '太郎' }
    name_last_kana       { 'ヤマダ' }
    name_first_kana      { 'タロウ' }
    birthday             { '1930-01-01' }
  end
end

RSpec.describe User, type: :model do
  context 'ユーザ登録ができる時' do
    it '全ての項目が正しく入力されていれば登録できる' do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end
  end

  context 'ユーザ登録ができない時' do
    it 'nicknameが空では登録できない' do
      user = FactoryBot.build(:user, nickname: '')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'name_lastが空では登録できない' do
      user = FactoryBot.build(:user, name_last: '')
      user.valid?
      expect(user.errors.full_messages).to include("Name last can't be blank")
    end

    it 'name_lastが全角文字でないと登録できない' do
      user = FactoryBot.build(:user, name_last: 'yamada')
      user.valid?
      expect(user.errors.full_messages).to include('Name last 全角文字を使用してください')
    end

    it 'name_firstが空では登録できない' do
      user = FactoryBot.build(:user, name_first: '')
      user.valid?
      expect(user.errors.full_messages).to include("Name first can't be blank")
    end

    it 'name_firstが全角文字でないと登録できない' do
      user = FactoryBot.build(:user, name_first: 'taro')
      user.valid?
      expect(user.errors.full_messages).to include('Name first 全角文字を使用してください')
    end

    it 'メールアドレスに@がないと登録できない' do
      user = FactoryBot.build(:user, email: 'testexample')
      user.valid?
      expect(user.errors.full_messages).to include('Email is invalid')
    end

    it '重複したメールアドレスは登録できない' do
      user1 = FactoryBot.create(:user)
      user2 = FactoryBot.build(:user)
      user2.valid?
      expect(user2.errors.full_messages).to include('Email has already been taken')
    end

    it 'パスワードは英字のみでは登録できない' do
      user = FactoryBot.build(:user, password: 'abcdef', password_confirmation: 'abcdef')
      user.valid?
      expect(user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
    end

    it 'パスワードは数字のみでは登録できない' do
      user = FactoryBot.build(:user, password: '123456', password_confirmation: '123456')
      user.valid?
      expect(user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
    end

    it 'name_last_kanaが全角カタカナでないと登録できない' do
      user = FactoryBot.build(:user, name_last_kana: 'やまだ')
      user.valid?
      expect(user.errors.full_messages).to include('Name last kana 全角カタカナを使用してください')
    end

    it 'name_first_kanaが全角カタカナでないと登録できない' do
      user = FactoryBot.build(:user, name_first_kana: 'たろう')
      user.valid?
      expect(user.errors.full_messages).to include('Name first kana 全角カタカナを使用してください')
    end

    it '生年月日が空では登録できない' do
      user = FactoryBot.build(:user, birthday: '')
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
