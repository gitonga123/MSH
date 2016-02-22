<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Malaria_reports extends MY_Controller
{
    private $data;
    protected $before_filter = array(
        'action' => '_check_if_logged_in',
        'except' => array()
    );

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -  
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in 
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see http://codeigniter.com/user_guide/general/urls.html
	 */
    public function index()
    {
        //$this->load->view('county');
    }

    public function facility_mos($period="000000")
    {

        $period_post=$this->input->post("date");
        if(isset($period_post))
        {
            $period=$period_post;
        }


        $this->load->model("malaria_report_model");

        $facility_report['dates']=$this->malaria_report_model->get_facility_level_periods();

        $facility_report['period']=$this->malaria_report_model->get_facility_level_mos($period);


        $facility_report['p']=$period;
        $this->load->view('malaria_facility_mos',$facility_report);
    }
    public function forecast_mos($period="000000")
    {

        $period_post=$this->input->post("date");

        if(!empty($period_post))

        {
            $period=$period_post;
        }
        $this->load->model("malaria_report_model");
        $forecast_report['dates']=$this->malaria_report_model->get_forecast_commodity_data_periods();

        $forecast_report['period']=$this->malaria_report_model->get_forecast_commodity_data_mos($period);
        $forecast_report['pe']=$period;
        $this->load->view('malaria_forecast_mos',$forecast_report);
    }
    public function central_mos($period="000000")
    {
        $period_post=$this->input->post("date");

        if(!empty($period_post))

        {
            $period=$period_post;
        }

        $this->load->model("malaria_report_model");

//$central_report=array();
        $central_report['dates']=$this->malaria_report_model->get_central_level_periods();
        if($period!="000000")
        {


            $central_report['period']=$this->malaria_report_model->get_central_level_mos($period);
            $central_report['p']=$period;
        }




        $this->load->view('malaria_central_mos',$central_report);
    }

    public function national_mos($period="000000")
    {

        $no_reporting_rate=$this->input->post("no_reporting_rate");
        $period_post=$this->input->post("date");
        if(!empty($period_post))
        {
            $period=$period_post;
        }
        $this->load->model("malaria_report_model");
        $national_report['dates']=$this->malaria_report_model->get_central_level_periods();
if($period!="000000")
{
    if(empty($no_reporting_rate))
    {
        $national_report['period']=$this->malaria_report_model->get_national_level_mos($period);
    }
    else
    {
        $national_report['period']=$this->malaria_report_model->get_national_level_mos_no_reporting_rate($period);
        $national_report['reporting_rate']="no reporting rate";
    }

    $national_report['p']=$period;
}

        $this->load->view('malaria_national_mos',$national_report);
    }

    public function county_mos($period="000000",$county_id="ahwTMNAJvrL")
    {

        $period_post=$this->input->post("date");
        $county_post=$this->input->post("county");

        if(!empty($period_post))
        {
            $period=$period_post;
        }

        if(!empty($county_post))
        {
            $county_id=$county_post;
        }
        //echo($period);
        //echo($county_id);
        $this->load->model("malaria_report_model");
        $county_report['dates']=$this->malaria_report_model->get_county_periods();
        $county_report['names']=$this->malaria_report_model->get_county_names();
if($period!="000000")
{
    $county_report['period']=$this->malaria_report_model->get_county_mos($period,$county_id);
    $county_report['p']=$period;
    $county_report['c']=$county_id;

    /*print_r($county_report);
    die("ddddddddddddddddddddddd");*/
}

        $this->load->view('malaria_county_mos',$county_report);

        //print_r($county_report);
    }
     public function variance_tracker($period="000000")
     {
        $period_post=$this->input->post("date");
        if(!empty($period_post))
        {
            $period=$period_post;
        }
        $this->load->model("malaria_report_model");
        $variance['dates']=$this->malaria_report_model->forecast_variance_periods();
if($period!="000000")
{
    $variance['period']=$this->malaria_report_model->forecast_variance_tracker($period);
    $variance['p']=$period;
}

        $this->load->view('malaria_variance_tracker',$variance);
       

        
     }

    public function stocks($period=000000)
    {

         $period_post=$this->input->post('period');

        if(isset($period_post))
        {
            $period=$period_post;

            $this->load->model('malaria_report_model');
        $commoditycomparison['COMMODITY']=$this->malaria_report_model->show_malaria_commodities();
        $commoditycomparison['FUNDING']=$this->malaria_report_model->show_funding_orgs();

        $commoditycomparison['PSTOCKS']=$this->malaria_report_model->show_shipments_by_period($period);
        $commoditycomparison['SORTED']=$this->malaria_report_model->show_pending_shipments_per_period($period);
        $commoditycomparison['CENTRAL']=$this->malaria_report_model->show_central_stock_by_period($period);
        $commoditycomparison['select_period']=$this->malaria_report_model->show_sorted_pending_stock();
        $commoditycomparison['period']=$period;


        $this->load->view('malaria_stocks_report', $commoditycomparison);
        }
        
    }
    public function commodities($period=000000)
    {
        $period_post=$this->input->post('period');

        if(isset($period_post))
        {
            $period=$period_post;
        }
         $this->load->model('malaria_report_model');
        $data['COMMODITY'] = $this->malaria_report_model->show_malaria_commodities();
        $data['pendingConsignments']=$this->malaria_report_model->show_pending_shipments_per_period($period);
        $data['select_period']=$this->malaria_report_model->show_sorted_pending_stock();
        $data['period']=$period;
        $this->load->view('malaria_commodities_report', $data);
        
    }

    public function agencies($period="000000")
    {
        $period_post=$this->input->post('period');

        if(isset($period_post))
        {
            $period=$period_post;
        }
        $this->load->model('malaria_report_model');
        $commodityperagency['PSTOCKS']=$this->malaria_report_model->show_shipments_by_period($period);
        $commodityperagency['COMMODITY']=$this->malaria_report_model->show_malaria_commodities();
        $commodityperagency['FUNDING']=$this->malaria_report_model->show_funding_orgs();
        $commodityperagency['period']=$this->malaria_report_model->show_sorted_pending_stock();
        $commodityperagency['selected_period']=$period;


        

         $this->load->view('agencies_report', $commodityperagency);
    }
    public function individual_commodity($period=000000){
        $period_post=$this->input->post('period');

        if(isset($period_post))
        {
            $period=$period_post;
        }


       $this->load->model('malaria_report_model');
        $data2['COMMODITY']=$this->malaria_report_model->show_malaria_commodities();
        $data2['FUNDING']=$this->malaria_report_model->show_funding_orgs();
        $data2['select_period']=$this->malaria_report_model->show_sorted_pending_stock();
        $data2['PSTOCKS']=$this->malaria_report_model->show_shipments_by_period($period);
        $data2['period']=$period;


        $this->load->view('malaria_individual_commodities', $data2);


        }
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */