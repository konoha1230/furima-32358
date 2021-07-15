require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  it '全ての項目が入力されていれば登録できる。' do
    expect(@user).to be_valid
  end

  it 'nicknameが空では登録できない' do
    @user.nickname = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank")
  end

  it 'emailが空では登録できない' do
    @user.email = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end

  it '既に登録されているemailは登録できない' do
    @user.save
    another_user = FactoryBot.build(:user)
    another_user.email = @user.email
    another_user.valid?
    expect(another_user.errors.full_messages).to include("Email has already been taken")
  end

  it 'passwordが空では登録できない' do
    @user.password = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end

  it 'passwordが5文字以下では登録できない' do
    @user.password = "ab345"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
  end

  it 'passwordとpassword_confirmationが一致してないと登録できない' do
    @user.password = "abc123"
    @user.password_confirmation = "def456"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

  it 'passwordは英字のみでは登録できない' do
    @user.password = "AbcDef"
    @user.password_confirmation = "AbcDef"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password は半角英数字混同で入力してください")
  end

  it 'passwordは数字のみでは登録できない' do
    @user.password = "123456"
    @user.password_confirmation = "123456"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password は半角英数字混同で入力してください")
  end

  it 'passwordが全角では登録できない' do
    @user.password = "ａｂｃ１２３"
    @user.password_confirmation = "ａｂｃ１２３"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password は半角英数字混同で入力してください")
  end

  it 'last_nameが空では登録できない' do
    @user.last_name = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name can't be blank")
  end

  it 'last_nameが英語では登録できない' do
    @user.last_name = "ansony"
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name は漢字、全角ひらがな、全角カタカナで入力してください")
  end

  it 'first_nameが空では登録できない' do
    @user.first_name = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("First name can't be blank")
  end

  it 'first_nameが英語では登録できない' do
    @user.first_name = "jack"
    @user.valid?
    expect(@user.errors.full_messages).to include("First name は漢字、全角ひらがな、全角カタカナで入力してください")
  end

  it 'last_name_kanaが空では登録できない' do
    @user.last_name_kana = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name kana can't be blank")
  end

  it 'last_name_kanaが英語では登録できない' do
    @user.last_name_kana = "kamura"
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name kana は全角カタカナで入力して下さい")
  end

  it 'last_name_kanaがひらがなでは登録できない' do
    @user.last_name_kana = "かむら"
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name kana は全角カタカナで入力して下さい")
  end

  it 'last_name_kanaが漢字では登録できない' do
    @user.last_name_kana = "嘉村"
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name kana は全角カタカナで入力して下さい")
  end

  it 'first_name_kanaが空では登録できない' do
    @user.first_name_kana = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana can't be blank")
  end

  it 'first_name_kanaが英語では登録できない' do
    @user.first_name_kana = "taro"
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana は全角カタカナで入力して下さい")
  end

  it 'first_name_kanaがひらがなでは登録できない' do
    @user.first_name_kana = "たろう"
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana は全角カタカナで入力して下さい")
  end

  it 'first_name_kanaが漢字では登録できない' do
    @user.first_name_kana = "太郎"
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana は全角カタカナで入力して下さい")
  end

  it 'birthdayが空では登録できない' do
    @user.birthday = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Birthday can't be blank")
  end
end
