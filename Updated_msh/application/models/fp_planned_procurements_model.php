<?php
class Fp_planned_contraceptive_procurements_model extends CI_Model
{



    function show_all_planned_contraceptive_procurement()
    {


        $this->db->distinct();
        $this->db->group_by('planned_delivery_date');
        $query =$this->db->get('contraceptive_planned_procurement_details');
        $query_result = $query->result();
        return $query_result;


    }

    function show_planned_contraceptive_procurement($planned_delivery_date)
    {


        $this->db->select('*');
        $this->db->from('contraceptive_planned_procurement_details');
        $this->db->where('planned_delivery_date', $planned_delivery_date);
        $query = $this->db->get();
        $query_result = $query->result();
        return $query_result;
    }

    function show_planned_contraceptive_procurement_id($psdata)
    {
        $this->db->select('*');
        $this->db->from('contraceptive_planned_procurement_details');
        $this->db->where('planned_procurement_id', $psdata);
        $query = $this->db->get();
        $result = $query->result();
        return $result;
    }

    function update_planned_contraceptive_procurement($psid,$pendingdata)
    {
        $this->db->where('planned_procurement_id', $psid);
        $this->db->update('contraceptive_planned_procurement_details', $pendingdata);
    }

    function add_planned_contraceptive_procurement($pending = NULL)
    {
        $this->db->insert('contraceptive_planned_procurement_details', $pending);
        return $this->db->insert_id();
    }

    function show_contraceptive_commodities(){
        $query = $this->db->get('contraceptive_commodities');
        $query_result = $query->result();
        return $query_result;
    }

// GET THE COMMODITY WITH NAME SAME AS THE NAME IN PENDING COMMODITY
    function get_contraceptive_commodity_id_with_the_given_name($comm_name)
    {
        $this->db->select('commodity_id');
        $this->db->from('contraceptive_commodities');
        $this->db->where('commodity_name', $comm_name);
        $query = $this->db->get();
        $result = $query->row()->commodity_id;
        return $result;
    }

    function show_fundingorgs(){
        $query = $this->db->get('funding_agencies');
        $query_result = $query->result();
        return $query_result;
    }

    // GET THE FUNDING AGENCY WITH NAME SAME AS THE NAME IN COMMODITY

    function get_funding_agency_id($dataf){
        $this->db->select('funding_agency_id');
        $this->db->from('funding_agencies');
        $this->db->where('funding_agency_name', $dataf);
        $query = $this->db->get();
        $result = $query->row()->funding_agency_id;
        return $result;
    }

}
?>

