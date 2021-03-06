<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Login extends CI_Controller
{

    /**
     * Index Page for this controller.
     *
     * Maps to the following URL
     *        http://example.com/index.php/welcome
     *    - or -
     *        http://example.com/index.php/welcome/index
     *    - or -
     * Since this controller is set as the default controller in
     * config/routes.php, it's displayed at http://example.com/
     *
     * So any other public methods not prefixed with an underscore will
     * map to /index.php/welcome/<method_name>
     * @see http://codeigniter.com/user_guide/general/urls.html
     */
    public function index()
    {
        $this->load->view('login');
    }


    function __encrip_password($password)
    {
        return md5($password);
    }

    /**
     * check the username and the password with the database
     * @return void
     */
    function validate()
    {
        $this->load->model('user_model');
        $email = $this->input->post('email');
        $password = $this->__encrip_password($this->input->post('password'));
        //Get the value from the form
        $system = $this->input->post('system');
        
        $is_valid = $this->user_model->validate($email, $password);

        if ($is_valid) {
            //$data['search'] = $system;
            echo "Your Logined In";
            $role = $is_valid[0]['role'];
            $user_id = $is_valid[0]['user_id'];
            $names = $is_valid[0]['names'];
            //print_r($is_valid);
            $data = array(
                'email' => $email,
                'user_id' => $user_id,
                'is_logged_in' => true,
                'role' => $role,
                'names' => $names
            );
             if($system == 'Malaria') {
               redirect(base_url().malaria_welcome);
                
            }
            else if($system == 'Familiy Planning'){
                redirect(base_url().contraceptive_welcome);
            }
            else if($system == 'Laboratory'){
                redirect(base_url().lab_welcome);
            }else{
                echo '<script>alert("Please Select the system to use");</script>';
                redirect(base_url());     
            }
            $this->session->set_userdata($data);              
        } else {
           // incorrect username or password
            redirect(base_url());   
        }
    }



    function logout()
    {
        $this->session->sess_destroy();
        redirect(base_url());
    }

}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */