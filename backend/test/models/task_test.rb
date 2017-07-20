require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "#create_with_next_sort_order works with zero elements present" do
    task = Task.create_with_next_sort_order!(
      title: 'Testing',
      project: FactoryGirl.create(:project)
    )
    assert task
    assert_equal('Testing', task.title)
    assert_equal(1, task.sort_order)
  end

  test "#create_with_next_sort_order picks max sort order" do
    FactoryGirl.create(:task, sort_order: 20)
    task = Task.create_with_next_sort_order!(
      title: 'Testing',
      project: FactoryGirl.create(:project)
    )
    assert task
    assert_equal(21, task.sort_order)
  end

  test "#reorder reorders tasks" do
    first_task = FactoryGirl.create(:task)
    second_task = FactoryGirl.create(:task)

    Task.reorder!([second_task.id, first_task.id])
    assert_equal 1, Task.find(second_task.id).sort_order
    assert_equal 2, Task.find(first_task.id).sort_order
  end

  test "#reorder handles missing tasks?" do
    skip "Not implemented yet"
  end
end
