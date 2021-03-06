@extends('layout.index')

@section('custom_top_script')
@stop

@section('content')
<style>
.form-control-inline {
    min-width: 0;
    width: auto;
    max-width: 80px;
    display: inline;
    }
</style>
<div class="content">
    <div class="module">
        <div class="module-head">
            <h3>Tables</h3>
        </div>
        <div class="module-body">
<!--             <p>
                <strong>Combined</strong>
                -
                <small>table class="table table-striped table-bordered table-condensed"</small>
            </p> -->
            <div class="controls">
                <select class="" id="category_fill">
                    @foreach($categories_list as $category)
                        <option value="{{ $category->id }}">{{ $category->category }}</option>
                    @endforeach
                </select>
            </div>
            <table class="table table-striped table-bordered table-condensed">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Book Title</th>
                        <th>Author</th>
                        <th>ISBN</th>
                        <th>Location</th>
                        <th>Category</th>
                        <th>Available</th>
                        <th>Total</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody id="all-books">
                    <tr class="text-center">
                        <td colspan="99">Loading...</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
@stop

@section('custom_bottom_script')
<script type="text/javascript">
    var categories_list = {{ json_encode($categories_list) }}
</script>
<script type="text/javascript" src="{{ Config::get('view.custom.js') }}/script.editbook.js"></script>
<script type="text/template" id="allbooks_show">
    @include('underscore.allbooks_edit')
</script>
@stop