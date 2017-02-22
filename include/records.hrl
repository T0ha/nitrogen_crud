%% Table column definition like
%% {MapField, "Column Title", 'input type'}
-type column() :: {atom(), string(), input_type()}.

%% Input type for column data updatting
%% 'tb' - inplace textbox
%% 'ta' - inplace textarea
%% 'none' - just print stringified data
%% {select, DropDownOptions} - select element,
%% for DropDownOptions syntax see http://nitrogenproject.com/doc/elements/dropdown.html
-type input_type() :: tb | ta | {select, [{string(), string()}]} | none.

-record(crud, {?ELEMENT_BASE(element_crud),
               table_class=[], % Additional classes for table element
               button_class=[], % Additional classes for CRUD buttons (last column)
               pagination_class=[], % Pagination buttons classes
               cols=[] ::  [column()], % Missed columns are not displayed
               funs=#{}, % Funs for "list", "delete" and "update" functions, see README example
               start=0, % Pagination start for current page
               count=10 % Pagination elements per page
    }).
