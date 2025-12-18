class c_3_1;
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

program p_3_1;
    c_3_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "010zxx0xz0z1110xxzzx0z001x10x0z1xxzzzzzzzxxxzxzzxxzxzzxzxxxzxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
