<?php
/**
 * Created by IntelliJ IDEA.
 * User: enock
 * Date: 7/9/15
 * Time: 4:49 PM
 */
class Lab_update_stocks_model extends CI_Model{


    function show_lab_current_stock(){
        $this->db->distinct();
        $this->db->group_by('period DESC' );
        $query = $this->db->get('lab_current_stock');
        $query_result = $query->result();
        return $query_result;
    }

    function show_lab_current_stock_by_period($period){
        $this->db->select('*, SUM(quantity_received) AS PendingTotal, SUM(quantity_issued) AS sum_issued');
        $this->db->from('lab_current_stock');
        $this->db->group_by('commodity_id');
        $this->db->where('period', $period);
        $query = $this->db->get();
        $query_result = $query->result();
        return $query_result;
    }

    /*    function show_sorted_central_stock(){
    $this->db->distinct();
    $this->db->group_by('period DESC' );
    $query = $this->db->get('central_level_data');
    $query_result = $query->result();
    return $query_result;

}*/

  
    // Function To Fetch All Commodies Record
    function show_lab_commodities(){
    $query = $this->db->get('lab_commodities');
    $query_result = $query->result();
    return $query_result;
    }

    // GET THE COMMODITY WITH NAME SAME AS THE NAME IN CENTRAL DATA
    function get_lab_commodity_id_with_the_given_name($commodity_name){
    $this->db->select('commodity_id');
    $this->db->from('lab_commodities');
    $this->db->where('commodity_name', $commodity_name);
    $query = $this->db->get();
    $result = $query->row()->commodity_id;
    return $result;
    }
    function add_current_lab_stock($data=NULL){
    $this->db->insert('lab_current_stock', $data);
    return $this->db->insert_id();
}
function update_lab_commodity($id,$data){
    $this->db->where('current_stock_id', $id);
    $this->db->update('lab_current_stock', $data);
    }


     public function delete_lab_current_data($id){         
        $this->db->where('current_stock_id', $id);
        $deleterecord=$this->db->delete('lab_current_stock');
        


     }

}