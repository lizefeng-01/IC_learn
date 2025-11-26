class bus_seq;

    task run();
        bus_item it;

        repeat (5) begin
            it = new();
            assert(it.randomize());
            it.display();
        end
    endtask

endclass
