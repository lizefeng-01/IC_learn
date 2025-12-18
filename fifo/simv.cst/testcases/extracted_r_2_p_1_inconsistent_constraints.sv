class c_2_1;
    rand bit[30:0] pload_size_; // rand_mode = ON 

    constraint pload_cons_this    // (constraint_mode = ON) (my_transaction.sv:11)
    {
       (pload_size_ >= 46);
    }
    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (my_case1.sv:21)
    {
       (pload_size_ == 20);
    }
endclass

program p_2_1;
    c_2_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z0xx10010xz10011zz00z1x0x10z101zzzxxzzzxxxzzzzzzzzxxzxzzxzzzzzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
