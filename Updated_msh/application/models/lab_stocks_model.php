<?php
/**
 * Created by IntelliJ IDEA.
 * User: enock
 * Date: 7/9/15
 * Time: 4:49 PM
 */
class Lab_stocks_model extends CI_Model{


    function update_central_lab_data($cdid,$cdData){
        $this->db->where('central_level_stock_id', $cdid);
        $this->db->update('lab_central_level_data', $cdData);
    }

    function add_central_lab_stock($central_data=NULL){
        $this->db->insert('lab_central_level_data', $central_data);
        return $this->db->insert_id();
    }

    function show_sorted_central_lab_stock(){
    $this->db->distinct();
    $this->db->group_by('period DESC' );
    $query = $this->db->get('lab_central_level_data');
    $query_result = $query->result();
    return $query_result;

}
    function show_current_lab_stock_by_period($period){
    $this->db->select('*');
    $this->db->from('lab_central_level_data');
    $this->db->where('period', $period);
    $query = $this->db->get();
    $result = $query->result();
    return $result;
}

        function show_pending_lab_shipments(){
        $query = $this->db->get('lab_pending_shipment_details');
        $query_result = $query->result();
        return $query_result;
    }

     function update_pending_lab_shipment($psid,$pendingdata)
    {
        $this->db->where('pending_shipment_id', $psid);
        $this->db->update('lab_pending_shipment_details', $pendingdata);
    }


     function show_pending_lab_shipment($pid)
    {
        $this->db->select('quantity');
        $this->db->from('lab_pending_shipment_details');
        $this->db->where('pending_shipment_id', $pid);
        $query = $this->db->get();
        $query_result = $query->result();
        return $query_result;
     
    }


     public function delete_pending_lab_data($id){
        $this->db->where('pending_shipment_id', $id);
        $deleterecord=$this->db->delete('lab_pending_shipment_details');
    }



     function show_pending_lab_shipment_by_id($pid)
    {
        $this->db->select('*');
        $this->db->from('lab_pending_shipment_details');
        $this->db->where('pending_shipment_id', $pid);
        $query = $this->db->get();
        $query_result = $query->result();
        return $query_result;
     
    }

    
       function get_lab_commodity_id_with_the_given_id($commodity_id)
    {
        $this->db->select('commodity_name');
        $this->db->from('lab_commodities');
        $this->db->where('commodity_id', $commodity_id);
        $query = $this->db->get();
        $result = $query->row()->commodity_name;
        return $result;
    }

        function get_funding_agency_name($agency_id){
        $this->db->select('funding_agency_name');
        $this->db->from('funding_agencies');
        $this->db->where('funding_agency_id', $agency_id);
        $query = $this->db->get();
        $result = $query->row()->funding_agency_name;
        return $result;
        }



}
   \