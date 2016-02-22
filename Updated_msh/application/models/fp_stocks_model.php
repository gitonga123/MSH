<?php
/**
 * Created by IntelliJ IDEA.
 * User: enock
 * Date: 7/9/15
 * Time: 4:49 PM
 */
class Fp_stocks_contraceptive_model extends CI_Model{


    function update_contraceptive_central_data($cdid,$cdData){
        $this->db->where('central_level_stock_id', $cdid);
        $this->db->update('contraceptive_central_level_data', $cdData);
    }

    function add_contraceptive_central_stock($central_data=NULL){
        $this->db->insert('contraceptive_central_level_data', $central_data);
        return $this->db->insert_id();
    }

    function show_sorted_contraceptive_central_stock(){
    $this->db->distinct();
    $this->db->group_by('period DESC' );
    $query = $this->db->get('contraceptive_central_level_data');
    $query_result = $query->result();
    return $query_result;

}
    function show_current_contraceptive_stock_by_period($period){
    $this->db->select('*');
    $this->db->from('contraceptive_central_level_data');
    $this->db->where('period', $period);
    $query = $this->db->get();
    $result = $query->result();
    return $result;
}

        function show_pending_contraceptive_shipments(){
        $query = $this->db->get('contraceptive_pending_shipment_details');
        $query_result = $query->result();
        return $query_result;
    }

     function update_pending_contraceptive_shipment($psid,$pendingdata)
    {
        $this->db->where('pending_shipment_id', $psid);
        $this->db->update('contraceptive_pending_shipment_details', $pendingdata);
    }


     function show_pending_contraceptive_shipment($pid)
    {
        $this->db->select('quantity');
        $this->db->from('contraceptive_pending_shipment_details');
        $this->db->where('pending_shipment_id', $pid);
        $query = $this->db->get();
        $query_result = $query->result();
        return $query_result;
     
    }


     public function delete_pending_contraceptive_data($id){
        $this->db->where('pending_shipment_id', $id);
        $deleterecord=$this->db->delete('contraceptive_pending_shipment_details');
    }



     function show_pending_contraceptive_shipment_by_id($pid)
    {
        $this->db->select('*');
        $this->db->from('contraceptive_pending_shipment_details');
        $this->db->where('pending_shipment_id', $pid);
        $query = $this->db->get();
        $query_result = $query->result();
        return $query_result;
     
    }

    
       function get_contraceptive_commodity_id_with_the_given_id($commodity_id)
    {
        $this->db->select('commodity_name');
        $this->db->from('contraceptive_commodities');
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
   