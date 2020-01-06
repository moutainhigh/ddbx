package com.example.ddbx.transfer.seats;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Component;
@Component
public class AddSeat1 implements ApplicationRunner{
	@Override
	public void run(ApplicationArguments var1) throws Exception{
		PoolCache1.initContainer();
	}
}
