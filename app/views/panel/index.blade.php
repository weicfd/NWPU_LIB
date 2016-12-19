@extends('layout.index')

@section('content')
<div class="content">
    <div class="btn-controls">
        <div class="btn-box-row row-fluid">
            <a class="btn-box span12"><b>Welcome to NWPU Library</b></a>
        </div>

        <div class="btn-box-row row-fluid">
            <a class="btn-box big span4 homepage-form-box" id="findbookbox">
                <i class="icon-list"></i>
                <b>Find Book</b>
            </a>

            <a class="btn-box big span4 homepage-form-box" id="findissuebox">
                <i class="icon-book"></i>
                <b>Find Book Issue</b>
            </a>

            <a class="btn-box big span4 homepage-form-box" id="findstudentbox">
                <i class="icon-user"></i>
                <b>Find Student</b>
            </a>
        </div>

        <div class="content">
            <div class="module" style="display: none;">
                <div class="module-body">
                    <form class="form-horizontal row-fluid form-submit" id="findbookform">
                        <div class="control-group">
                            <label class="control-label">Enter Book Name or Author or ISBN</label>
                            <div class="controls">
                                <input type="text" data-type="search" placeholder="Click here then scan the code" class="span9">
                                <button type="submit" class="btn homepage-form-submit">Submit</button>
                            </div>
                        </div>
                    </form>
                    <hr>
                    <table class="table table-striped table-bordered table-condensed" style="display: none;">
                        <thead>
                            <tr>
                                <th>Book ID</th>
                                <th>Book Title</th>
                                <th>Author</th>
                                <th>ISBN</th>
                                <th>Location</th>
                                <th>Category</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody id="book-results"></tbody>
                    </table>
                </div>
            </div>
            
            <div class="module" style="display: none;">
                <div class="module-body">
                    <form class="form-horizontal row-fluid form-submit" id="findissueform" >
                        <div class="control-group">
                            <label class="control-label">Enter Book ID</label>
                            <div class="controls">
                                <input type="text" data-type="search" placeholder="Click here then scan the code" class="span9">
                                <button type="submit" class="btn homepage-form-submit">Submit</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="module-body" id="module-body-results"></div>
            </div>

            <div class="module" style="display: none;">
                <div class="module-body">
                    <form class="form-horizontal row-fluid form-submit" id="findstudentform">
                        <div class="control-group">
                            <label class="control-label">Enter Student ID</label>
                            <div class="controls">
                                <input type="text" placeholder="Click here then scan the code" class="span9">
                                <button type="submit" class="btn homepage-form-submit">Submit</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="module-body" id="module-body-results"></div>
            </div>
        </div>
    </div>
</div>
@stop


@section('custom_bottom_script')
<script type="text/javascript">
    var branches_list = {{ json_encode($branch_list) }},
        student_categories_list = {{ json_encode($student_categories_list) }};
    var categories_list = {{ json_encode($categories_list) }}
</script>

<script type="text/javascript" src="{{ Config::get('view.custom.js') }}/script.mainpage.js"></script>


<script type="text/template" id="search_book">
    @include('underscore.search_book')
</script>
<script type="text/template" id="search_issue">
    @include('underscore.search_issue')
</script>
<script type="text/template" id="search_student">
    @include('underscore.search_student')
</script>
<script type="text/template" id="approvalstudents_show">
    @include('underscore.approvalstudents_show')
</script>
@stop