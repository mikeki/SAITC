require 'test_helper'

class JobsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Job.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Job.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Job.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to job_url(assigns(:job))
  end
  
  def test_edit
    get :edit, :id => Job.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Job.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Job.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Job.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Job.first
    assert_redirected_to job_url(assigns(:job))
  end
  
  def test_destroy
    job = Job.first
    delete :destroy, :id => job
    assert_redirected_to jobs_url
    assert !Job.exists?(job.id)
  end
end
