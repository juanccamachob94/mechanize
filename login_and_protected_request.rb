BASE_URL = '*******'
LOGIN_PATH = '/login'
DAIRY_SALES_PATH = '/send'

LOGIN_URL = BASE_URL + LOGIN_PATH
DAIRY_SALES_URL = BASE_URL + DAIRY_SALES_PATH

DAIRY_SALES_PARAMS = {
  'x' => {
    'date' => '2020-09-10'
  }
}

DAIRY_SALES_HEADER = {'Content-Type' => 'application/x-www-form-urlencoded; charset=UTF-8' }

mechanize = Mechanize.new { |a| a.ssl_version, a.verify_mode = 'TLSv1',OpenSSL::SSL::VERIFY_NONE }

def build_login_form(login_page)
  login_form = login_page.form_with(id: 'id_of_login_form')
  login_form['form[username]'] = 'test'
  login_form['form[password]'] = 'password'
  login_form
end

build_login_form(mechanize.get(LOGIN_URL)).submit
# #<Mechanize::Page{url#<URI::HTTPS https://...>}{meta_refresh}{title nil}{iframes}{frames}{links}{forms}> - this appears to be empty but it is not
mechanize.post(DAIRY_SALES_URL, DAIRY_SALES_PARAMS, DAIRY_SALES_HEADER).body
