require 'test_helper'

class OfferMusicsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => OfferMusic.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    OfferMusic.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    OfferMusic.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to offer_music_url(assigns(:offer_music))
  end

  def test_edit
    get :edit, :id => OfferMusic.first
    assert_template 'edit'
  end

  def test_update_invalid
    OfferMusic.any_instance.stubs(:valid?).returns(false)
    put :update, :id => OfferMusic.first
    assert_template 'edit'
  end

  def test_update_valid
    OfferMusic.any_instance.stubs(:valid?).returns(true)
    put :update, :id => OfferMusic.first
    assert_redirected_to offer_music_url(assigns(:offer_music))
  end

  def test_destroy
    offer_music = OfferMusic.first
    delete :destroy, :id => offer_music
    assert_redirected_to offer_musics_url
    assert !OfferMusic.exists?(offer_music.id)
  end
end
