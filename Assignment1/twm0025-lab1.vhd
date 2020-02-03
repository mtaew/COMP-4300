entity ORandAND is 
	generic(prop_delay: Time := 10 ns);
	port(a_in,b_in,control: in bit;
             result: out bit);
end entity ORandAND; 


architecture behaviour1 of ORandAND is
begin
	controlProcess : process(a_in,b_in,control) is 
	
	begin
	if control = '1' then
                if a_in = '1' then 
                  if b_in = '1' then
                     --  1 and 1 = 1 
                     result <= '1' after prop_delay; 
                  else
                     -- 1 and 0 = 0  
                     result <= '0' after prop_delay; 
                  end if;
                else
  		  if b_in = '1' then
                     --  0 and 1 = 0
                     result <= '0' after prop_delay; 
                   else
                     -- 0 and 0 = 0  
                     result <= '0' after prop_delay; 
                   end if;  
                end if;
	end if;

	if control = '0' then
                if a_in = '1' then 
                  if b_in = '1' then
                     --  1 and 1 = 1 
                     result <= '1' after prop_delay; 
                  else
                     -- 1 and 0 = 1  
                     result <= '1' after prop_delay; 
                  end if;
                else
  		  if b_in = '1' then
                     --  0 and 1 = 1
                     result <= '1' after prop_delay; 
                   else
                     -- 0 and 0 = 0  
                     result <= '0' after prop_delay; 
                   end if;  
                end if;
	end if;

	end process controlProcess; 
end architecture behaviour1; 
