<?php
class Fp_pending_contraceptive_shipments_model extends CI_Model
{



    function show_all_pending_contraceptive_shipment()
    {


        $this->db->distinct();
        $this->db->group_by('period');
        $query =$this->db->get('contraceptive_pending_shipment_details');
        $query_result = $query->result();
        return $query_result;


    }

    function show_pending_contraceptive_shipment($period)
    {


        $this->db->select('*');
        $this->db->from('contraceptive_pending_shipment_details');
        $this->db->where('period', $period);
        $query = $this->db->get();
        $query_result = $query->result();
        return $query_result;
    }

    function show_pending_contraceptive_shipment_id($psdata)
    {
        $this->db->select('*');
        $this->db->from('contraceptive_pending_shipment_details');
        $this->db->where('pending_shipment_id', $psdata);
        $query = $this->db->get();
        $result = $query->result();
        return $result;
    }

    function update_pending_contraceptive_shipment($psid,$pendingdata)
    {
        $this->db->where('pending_shipment_id', $psid);
        $this->db->update('contraceptive_pending_shipment_details', $pendingdata);
    }

    function add_pending_contraceptive_shipment($pending = NULL)
    {
        $this->db->insert('contraceptive_pending_shipment_details', $pending);
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