BASE_URL = '*******'
LOGIN_PATH = '/login'
SEND_PATH = '/send'

LOGIN_URL = BASE_URL + LOGIN_PATH
SEND_URL = BASE_URL + SEND_PATH

SEND_PARAMS = {
  'x' => {
    'date' => '2020-09-10'
  }
}

SEND_HEADER = {'Content-Type' => 'application/x-www-form-urlencoded; charset=UTF-8' }

mechanize = Mechanize.new { |a| a.ssl_version, a.verify_mode = 'TLSv1',OpenSSL::SSL::VERIFY_NONE }

def build_login_form(login_page)
  login_form = login_page.form_with(id: 'id_of_login_form')
  login_form['form[username]'] = 'test'
  login_form['form[password]'] = 'password'
  login_form
end

build_login_form(mechanize.get(LOGIN_URL)).submit
# #<Mechanize::Page{url#<URI::HTTPS https://...>}{meta_refresh}{title nil}{iframes}{frames}{links}{forms}> - this appears to be empty but it is not
mechanize.post(SEND_URL, SEND_PARAMS, SEND_HEADER).body
