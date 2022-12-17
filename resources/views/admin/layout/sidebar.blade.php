<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
    <div class="menu_section">

        <ul class="nav side-menu">
            @if($adminHasPermition->can(['dashboard_list'])=="1")
                <li><a href="{{ url('admin/dashboard') }}" style="color: #F7DC6F;"><i class="fa fa-tachometer"></i> Dashboard</a></li>
            @endif

            @if($adminHasPermition->can(['client_list']) =="1")
                <li><a href="{{ route('clients.index') }}" style="color: #F7DC6F;"><i class="fa fa-user-plus"></i> Client</a></li>
            @endif

            @if($adminHasPermition->can(['case_list']) =="1")
                <li><a href="{{ route('case-running.index') }}" style="color: #F7DC6F;"><i class="fa fa-gavel"></i> Case</a></li>

            @endif
            @if($adminHasPermition->can(['task_list']) =="1")
                <li><a href="{{ route('tasks.index') }}" style="color: #F7DC6F;"><i class="fa fa-tasks"></i> Task</a></li>
            @endif


            @if($adminHasPermition->can(['appointment_list']) =="1")
                <li><a href="{{ route('appointment.index') }}" style="color: #F7DC6F;"><i class="fa fa-calendar-plus-o"></i> Appointment</a>
                </li>

            @endif
            @if(\Auth::guard('admin')->user()->user_type=="Admin")
                <li><a style="color: #F7DC6F;"><i class="fa fa-users"></i> Team Members <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                        <li><a href="{{ url('admin/client_user') }}" style="color: #F7DC6F;"> Team Member</a></li>
                        <li><a href="{{ route('role.index') }}" style="color: #F7DC6F;">Role</a></li>

                    </ul>
                </li>
            @endif
            @if($adminHasPermition->can(['service_list']) == "1" || $adminHasPermition->can(['invoice_list'])=="1")
                <li><a style="color: #F7DC6F;"><i class="fa fa-money"></i> Income <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                        @if($adminHasPermition->can(['service_list']) == "1")
                            <li><a href="{{ url('admin/service') }}" style="color: #F7DC6F;">Service</a></li>
                        @endif

                        @if($adminHasPermition->can(['invoice_list']) == "1")
                            <li><a href="{{ url('admin/invoice') }}" style="color: #F7DC6F;">Invoice</a>
                        @endif


                    </ul>
                </li>
            @endif
            @if($adminHasPermition->can(['vendor_list']) =="1")
                <li><a href="{{ route('vendor.index') }}" style="color: #F7DC6F;"><i class="fa fa-user-plus"></i> Vendor</a></li>
            @endif

            @if($adminHasPermition->can(['expense_type_list'])=="1" || $adminHasPermition->can(['expense_list'])=="1")
                <li><a style="color: #F7DC6F;"><i class="fa fa-money"></i> Expense <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">

                        @if($adminHasPermition->can(['expense_type_list']) =="1")
                            <li><a href="{{ url('admin/expense-type') }}" style="color: #F7DC6F;">Expense Type</a></li>
                        @endif


                        @if($adminHasPermition->can(['expense_list']) =="1")
                            <li><a href="{{ url('admin/expense') }}" style="color: #F7DC6F;">Expense</a></li>
                        @endif

                    </ul>
                </li>

            @endif


            @if($adminHasPermition->can(['case_type_list'])=="1"
            || $adminHasPermition->can(['court_type_list'])=="1"
            || $adminHasPermition->can(['court_list'])=="1"
            || $adminHasPermition->can(['case_status_list'])=="1"
            || $adminHasPermition->can(['judge_list'])=="1"
            || $adminHasPermition->can(['tax_list'])=="1"
            || $adminHasPermition->can(['general_setting_edit'])=="1")
                <li><a style="color: #F7DC6F;"><i class="fa fa-gear"></i> Settings <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">

                        @if($adminHasPermition->can(['case_type_list']) == "1")
                            <li><a href="{{ url('admin/case-type') }}" style="color: #F7DC6F;">Case Type</a></li>
                        @endif

                        @if($adminHasPermition->can(['court_type_list']) == "1")
                            <li><a href="{{ url('admin/court-type') }}" style="color: #F7DC6F;">Court Type</a></li>
                        @endif

                        @if($adminHasPermition->can(['court_list']) == "1")
                            <li><a href="{{ url('admin/court') }}" style="color: #F7DC6F;">Court</a></li>
                        @endif

                        @if($adminHasPermition->can(['case_status_list']) == "1")
                            <li><a href="{{ url('admin/case-status') }}" style="color: #F7DC6F;">Case Status</a></li>
                        @endif

                        @if($adminHasPermition->can(['judge_list']) == "1")
                            <li><a href="{{ url('admin/judge') }}" style="color: #F7DC6F;">Judge</a></li>
                        @endif

                        @if($adminHasPermition->can(['tax_list']) == "1")
                            <li><a href="{{ url('admin/tax') }}" style="color: #F7DC6F;">Tax</a></li>
                        @endif


                        @if($adminHasPermition->can(['general_setting_edit']) == "1")
                            <li><a href="{{ url('admin/general-setting') }}" style="color: #F7DC6F;">General Setting</a></li>
                        @endif
                        @if(\Auth::guard('admin')->user()->user_type=="Admin")
                            <li><a href="{{ url('admin/database-backup') }}" style="color: #F7DC6F;">Database Backup</a></li>
                        @endif

                    </ul>
                </li>
            @endif

        </ul>
    </div>
</div>