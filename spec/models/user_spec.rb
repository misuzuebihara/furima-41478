require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザ登録ができる時' do
    it '全ての項目が正しく入力されていれば登録できる' do
      expect(@user).to be_valid
    end
  end

  context 'ユーザ登録ができない時' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'name_lastが空では登録できない' do
      @user.name_last = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name last can't be blank")
    end

    it 'name_lastが全角文字でないと登録できない' do
      @user.name_last = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include('Name last 全角文字を使用してください')
    end

    it 'name_firstが空では登録できない' do
      @user.name_first = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name first can't be blank")
    end

    it 'name_firstが全角文字でないと登録できない' do
      @user.name_first = 'taro'
      @user.valid?
      expect(@user.errors.full_messages).to include('Name first 全角文字を使用してください')
    end

    it 'メールアドレスに@がないと登録できない' do
      @user.email = 'testexample'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it '重複したメールアドレスは登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordに全角文字を含んでいると登録できない' do
      @user.password = 'あいうabc123'
      @user.password_confirmation = 'あいうabc123'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
    end

    it 'passwordとpassword_confirmationが不一致だと登録できない' do
      @user.password = 'abc123'
      @user.password_confirmation = 'def456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'パスワードが6文字未満では登録できない' do
      @user.password = 'abc12'
      @user.password_confirmation = 'abc12'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'パスワードは英字のみでは登録できない' do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
    end

    it 'パスワードは数字のみでは登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
    end

    it 'name_last_kanaが全角カタカナでないと登録できない' do
      @user.name_last_kana = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Name last kana 全角カタカナを使用してください')
    end

    it 'name_last_kanaが空では登録できない' do
      @user.name_last_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name last kana can't be blank")
    end

    it 'name_first_kanaが全角カタカナでないと登録できない' do
      @user.name_first_kana = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include('Name first kana 全角カタカナを使用してください')
    end

    it 'name_first_kanaが空では登録できない' do
      @user.name_first_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name first kana can't be blank")
    end

    it '生年月日が空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end