require 'rails_helper'

RSpec.describe Review, type: :model do
  before :each do
    @user = FactoryBot.create(:user)
    @book = FactoryBot.build(:book)
    @review = FactoryBot.create(:review)
    @review.user_id = @user.id
    @review.book_id = @book.id
    @review.save
  end

  subject {review}

  it { expect(subject).to validate_presence_of :title}
  it { expect(subject).to validate_presence_of :rating}
  it { expect(subject).to validate_presence_of :text}
  it { expect(subject).to validate_length_of :text}
  it { expect(subject).to validate_length_of :title}

  it { expect(subject).to validate_inclusion_of(:status).in_arrray(%w[unprocessed approved rejected]) }

  it { expect(subject).to belong_to(:book)}
  it { expect(subject).to belong_to(:user)}
end
