package service2;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
@RequestMapping("/service2")
@RequiredArgsConstructor
public class SimpleController {

    @Value("${service1.url}")
    private String service1Url;

    private final RestTemplate restTemplate = new RestTemplate();

    @GetMapping("/test")
    public ResponseEntity<?> test() {
        return ResponseEntity.ok("test");
    }

    @GetMapping("/service1/ping")
    public ResponseEntity<?> ping() {
        String pong = restTemplate.getForObject(service1Url + "/service1/pong", String.class);
        return ResponseEntity.ok(pong);
    }

}
