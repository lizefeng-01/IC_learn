class bus_item;

    rand bit [31:0] addr;
    rand bit [31:0] data;
    rand bit        write;  // 1 = write, 0 = read

    function void display();
        $display("[ITEM] addr=%h data=%h write=%0b",
                 addr, data, write);
    endfunction

endclass
