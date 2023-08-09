package kr.or.ddit.service.kmw;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.kmw.OrderMapper;
import kr.or.ddit.vo.kmw.OrderVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class DeliveryService {
	
	@Inject
	private OrderMapper mapper;
	
	private boolean isScheduled = true;
	private ScheduledExecutorService executorService;
	
	@PostConstruct
	public void init() {
		executorService = Executors.newScheduledThreadPool(1);
		executorService.scheduleAtFixedRate(this::updateDeliveryStatus, 0, 1, TimeUnit.MINUTES);
	}
	
	public void updateDeliveryStatus() {
		LocalDateTime now = LocalDateTime.now();
		String currentNow = now.format(DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss"));
		LocalDateTime currentTime = LocalDateTime.parse(currentNow, DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss"));
		
		List<OrderVO> deliveries = mapper.deliveryList();
		for (OrderVO delivery : deliveries) {
			LocalDateTime startTime = LocalDateTime.parse(delivery.getDelivery_start_ymd(), DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss"));
			Duration duration = Duration.between(startTime, currentTime);
			log.info("----------시간차이 : "+duration.toMinutes());
			if (duration.toMinutes() >= 1 && duration.toMinutes() < 2) {
				delivery.setCcg_d001("배송중");
				mapper.updateDeliveryStatus(delivery);
			} else if (duration.toMinutes() >= 2) {
				delivery.setCcg_d001("배송완료");
				mapper.updateDeliveryStatus(delivery);
			}
		}
		
		if (!isScheduled) {
			executorService.shutdown();
		}
	}
	
	public void stopScheduling() {
		isScheduled = false;
		executorService.shutdown();
	}
}
