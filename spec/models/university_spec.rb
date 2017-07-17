require 'rails_helper'

describe University do
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :population }
  it { should validate_presence_of :mascot }
end
