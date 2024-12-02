require 'rails_helper'



RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      user = User.new(nickname: 'test', email: '', password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '', password_confirmation: '')
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが5文字以下では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '12345', password_confirmation: '12345')
      user.valid?
      expect(user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordとpassword_confirmationが不一致では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '123456', password_confirmation: '1234567')
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'name_lastが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: '000000', name_last: '')
      user.valid?
      expect(user.errors.full_messages).to include("Name last can't be blank")
    end

    it 'name_lastが全角文字でないと登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: '000000', name_last: 'yamada')
      user.valid?
      expect(user.errors.full_messages).to include('Name last 全角文字を使用してください')
    end

    it 'name_firstが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: '000000', name_last: '山田', name_first: '')
      user.valid?
      expect(user.errors.full_messages).to include("Name first can't be blank")
    end

    it 'name_firstが全角文字でないと登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: '000000', name_last: '山田', name_first: 'taro')
      user.valid?
      expect(user.errors.full_messages).to include('Name first 全角文字を使用してください')
    end

    it 'name_last_kanaが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: '000000', name_last: '山田', name_first: '太郎', name_last_kana: '')
      user.valid?
      expect(user.errors.full_messages).to include("Name last kana can't be blank")
    end

    it 'name_last_kanaが全角カタカナでないと登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: '000000', name_last: '山田', name_first: '太郎', name_last_kana: 'やまだ')
      user.valid?
      expect(user.errors.full_messages).to include('Name last kana 全角カタカナを使用してください')
    end

    it 'name_first_kanaが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: '000000', name_last: '山田', name_first: '太郎', name_last_kana: 'ヤマダ', name_first_kana: '')
      user.valid?
      expect(user.errors.full_messages).to include("Name first kana can't be blank")
    end

    it 'name_first_kanaが全角カタカナでないと登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: '000000', name_last: '山田', name_first: '太郎', name_last_kana: 'ヤマダ', name_first_kana: 'たろう')
      user.valid?
      expect(user.errors.full_messages).to include('Name first kana 全角カタカナを使用してください')
    end

    it 'birthdayが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: '000000', name_last: '山田', name_first: '太郎', name_last_kana: 'ヤマダ', name_first_kana: 'タロウ', birthday: '')
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end

    it '正しい情報を入力すれば登録できる' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: '000000', name_last: '山田', name_first: '太郎', name_last_kana: 'ヤマダ', name_first_kana: 'タロウ', birthday: '2000-01-01')
      expect(user).to be_valid
    end

  end
end
end
end
