
class MainController < ApplicationController
  def dashboard

  end

  def authors
    redirect_to authors_path
  end

  def books
    redirect_to books_path
  end

  def suppliers
    redirect_to suppliers_path
  end

  def accounts
    redirect_to accounts_path
  end

  def account_histories
    redirect_to account_histories_path
  end

  def physicians
    redirect_to physicians_path
  end

  def appointments
    redirect_to appointments_path
  end

  def patients
    redirect_to patients_path
  end

  def assemblies
    redirect_to assemblies_path
  end

  def parts
    redirect_to parts_path
  end

  def employees
    redirect_to employees_path
  end

  def pictures
    redirect_to pictures_path
  end

  def products
    redirect_to products_path
  end
end
