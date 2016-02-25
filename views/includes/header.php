<?php
require_once("top_includes.php");
/**
 * Created by IntelliJ IDEA.
 * User: urandu
 * Date: 7/11/15
 * Time: 2:44 PM
 */

?>

<body>
<div id="wrapper">
<nav class="navbar-default navbar-static-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav" id="side-menu">
            <li class="nav-header">

                <div class="dropdown profile-element"> <span>
                            <img alt="image" class="img image" src="<?php echo(base_url()); ?>assets/img/moh.jpg" />
                             </span>


                    <a> <span class="clear"> <span class="block m-t-xs" style="font-size:14px">Logged in as: <strong
                                    class="font-bold"> <?php echo($this->session->userdata('names')); ?></strong>
                             </span>  </span></a>
                </div>
                <div class="logo-element">
                    MSH
                </div>
            </li>
            <li>
                <?php if($this->session->userdata('system') == 'malaria'){?>
                <a href="<?php echo(base_url().'malaria_welcome'); ?>"><i class="fa fa-th-large"></i> <span
                        class="nav-label" style="font-size:16px">Home</span> </a>
                <?php } if($this->session->userdata('system') == 'family'){?>
                <a href="<?php echo(base_url().'contraceptive_welcome'); ?>"><i class="fa fa-th-large"></i> <span
                        class="nav-label" style="font-size:16px">Home</span> </a>
                
                <?php }if($this->session->userdata('system') == 'laboratory'){?>
                <a href="<?php echo(base_url().'lab_welcome'); ?>"><i class="fa fa-th-large"></i> <span
                        class="nav-label" style="font-size:16px">Home</span> </a>
                
                <?php }?>
            </li>


            <?php if($this->session->userdata('role')==-1 || $this->session->userdata('role')==1){ ?>
                <li>
                    <a href="#"><i class="fa fa-edit"></i> <span class="nav-label" style="font-size:16px">Stocks</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">

                        <li><a style="font-size:15px" href="<?php echo(base_url()); ?>malaria_planned_procurements">Planned procurements</a></li>
                        <li><a style="font-size:15px" href="<?php echo(base_url()); ?>malaria_pending_shipments">Pending shipments</a></li>
                        <li><a style="font-size:15px" href="<?php echo(base_url()); ?>malaria_current_stock">Received stock</a></li>
                        <li><a style="font-size:15px" href="<?php echo(base_url()); ?>malaria_update_stocks">Update stock</a></li>


                </ul>
            </li>
<?php } ?>



            <li>
                <a href="#"><i class="fa fa-bar-chart-o"></i> <span class="nav-label" style="font-size:16px" >Reports</span><span
                        class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li><a style="font-size:15px" href="<?php echo(base_url()); ?>malaria_report/central_mos">Central level MOS</a></li>
                    <li><a style="font-size:15px" href="<?php echo(base_url()); ?>malaria_report/facility_mos">Facility level MOS</a></li>
                    <li><a style="font-size:15px"href="<?php echo(base_url()); ?>malaria_report/national_mos">National level MOS</a></li>
                    <li><a style="font-size:15px"href="<?php echo(base_url()); ?>malaria_report/county_mos">County level MOS</a></li>
                    <li><a style="font-size:15px"href="<?php echo(base_url()); ?>malaria_report/forecast_mos">Forecast data MOS</a></li>

                    <li><a style="font-size:15px"href="<?php echo(base_url()); ?>malaria_report/variance_tracker">Forecast Variance Tracker</a></li>
                    <li><a style="font-size:15px"href="<?php echo(base_url()); ?>malaria_report/stocks">Stocks</a></li>
                    <li><a style="font-size:15px"href="<?php echo(base_url()); ?>malaria_report/commodities">Pending Shipments</a></li>
                    <li><a style="font-size:15px"href="<?php echo(base_url()); ?>malaria_report/agencies">Commodities Report</a></li>
                    <li><a style="font-size:15px"href="<?php echo(base_url()); ?>malaria_report/individual_commodity">Individual Shipments</a></li>
                </ul>
            </li>

            <?php if($this->session->userdata('role')==-1){

            ?>
            <li>
            <a href="#"><i class="fa fa-wrench"></i> <span class="nav-label" style="font-size:16px">Settings</span><span
                        class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">

                    <li><a style="font-size:15px"href="<?php echo(base_url()); ?>funding_agency">Funding agencies</a></li>
                    <li><a style="font-size:15px"href="<?php echo(base_url()); ?>malaria_supply_chain">Supply chain agencies</a></li>
                    <li><a style="font-size:15px"href="<?php echo(base_url()); ?>malaria_commodity">Commodities</a></li>
                    <li><a style="font-size:15px"href="<?php echo(base_url()); ?>zone">Zones</a></li>
                    <li><a style="font-size:15px"href="<?php echo(base_url()); ?>county">Counties</a></li>
                    <li><a style="font-size:15px"href="<?php echo(base_url()); ?>malaria_forecast">Forecasts</a></li>
                    <li> <a style="font-size:15px"href="<?php echo(base_url()); ?>mos_color_codes">Manage MOS color codes</a></li>
                    <li> <a style="font-size:15px"href="<?php echo(base_url()); ?>users">Manage Users</a></li>
               <!-- <a href="<?php echo(base_url()); ?>settings/users"><i class="fa fa-user"></i> <span class="nav-label">Settings</span>
                </a>-->
                
             </ul>



            </li>
<?php
}
?>

        </ul>

    </div>
</nav>

<div id="page-wrapper" class="barclays-bg">
    <div class="row border-bottom">
        <nav class="navbar navbar-static-top  " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>


            </div>
            <ul class="nav navbar-top-links navbar-right">
                <li>
                    <?php if($this->session->userdata('system') == 'malaria'){?>
                    <span class="m-r-sm text-muted welcome-message">Malaria Commodities Stock Monitoring Tool</span>
                    <?php }else if($this->session->userdata('system') == 'family'){?>
                    <span class="m-r-sm text-muted welcome-message">Family Planning Commodities Stock Monitoring Tool</span>
                    <br /><sub><span class="m-r-sm text-muted welcome-message">Facility Contraceptives Consumption Report and Request</span></sub>
                    <?php }else if($this->session->userdata('system') == 'laboratory'){?>
                    <span class="m-r-sm text-muted welcome-message">Laboratory Commodities Stock Monitoring Tool</span><br />
                    <sub><span class="m-r-sm text-muted welcome-message">F-CDRR For Lab Commodities<span></sub>
                    <?php }?>
                </li>



                <li>
                    <a href="<?php echo base_url(); ?>login/logout">
                        <i class="fa fa-sign-out"></i> Log out
                    </a>
                </li>
            </ul>

        </nav>
    </div>
