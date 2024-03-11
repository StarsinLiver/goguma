package com.store.goguma.handler;

import org.springframework.context.event.EventListener;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.socket.messaging.SessionConnectEvent;
import org.springframework.web.socket.messaging.SessionDisconnectEvent;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class StompEventListener {

    private final SimpMessageSendingOperations simpleMessageSendingOperations;

    @EventListener
    public void handleWebSocketConnectListener(SessionConnectEvent event) {
        System.out.println("Received a new web socket connection");
        StompHeaderAccessor headerAccessor = StompHeaderAccessor.wrap(event.getMessage());
        String sessionId = headerAccessor.getSessionId();
        System.out.println("Session Connected: " + sessionId);
    }

    @EventListener
    public void handleWebSocketDisconnectListener(SessionDisconnectEvent event) {
        StompHeaderAccessor headerAccessor = StompHeaderAccessor.wrap(event.getMessage());
        String sessionId = headerAccessor.getSessionId();

        System.out.println("Session Disconnected: " + sessionId);

        // 세션 해제 시 필요한 로직을 추가할 수 있습니다.
        // 예를 들어, 채팅방에서 사용자가 나갔을 때 해당 사용자를 처리하는 등의 작업을 수행할 수 있습니다.
        // 이 부분에 필요한 로직을 추가하세요.
    }

}