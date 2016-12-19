@extends('student.st-index')

@section('content')
<style>
	.banner-title {
		text-align: center; 
		vertical-align: text-bottom; 
		color:#fff; 
		
		text-shadow:#52534f 0px 2px 3px;
		letter-spacing: 8px;
	    font-family: Muli,'Helvetica Neue','Hiragino Sans GB','WenQuanYi Micro Hei','Microsoft Yahei',sans-serif !important;
	}
</style>

<!-- <body role="document" style="background-image:url({{ Config::get('view.images') }}/background.jpeg);background-size: 100%; background-repeat:no-repeat" > -->
<div style="background-image:url({{ Config::get('view.images') }}/background.jpeg);background-size: 100%; background-repeat:no-repeat; height: 800px" >
    <div style="height:180px;"></div>
    <h1 class="banner-title" style="font-size:70px;">Welcome to NWPU Library</h1>
    <div style="margin-top: 200px"><h1 class="banner-title">Search for your interests from here</h1></div>

    <div style="margin-top: 180px;" align="center">
          <!-- <a href="{{ URL::route('student-registration') }}"><BUTTON class="btn btn-lg btn-default" type="button">Student registration</BUTTON></a> -->
          <a href="{{ URL::route('search-book') }}"><BUTTON class="btn btn-lg btn-default" type="button">Search Books</BUTTON></a> 
    </div>
</div>
<!-- <div class="row" style="margin-left: 20px; margin-top: 20px;">
			<div class="module span12">
				<div class="module-head">
					<h3>Search books in the library</h3>
				</div>
				<div class="module-body">
					<form class="form-horizontal row-fluid">
						<div class="control-group">
							<label class="control-label">Name or author<br>of the book</label>
							<div class="controls">
								<textarea class="span12" rows="2"></textarea>
							</div>
						</div>

						<div class="control-group">
							<div class="controls" id="search_book_button">
								<a class="btn btn-default">Search Book</a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>   -->
@stop