package com.store.goguma.utils.payment;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

@Data
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
public class PaymentResponseData {
    private Integer amount;
    private String applyNum;
    private String buyerCode;
    private String buyerName;
    private String buyerPostcode;
    private String buyerTel;
    private String currency;
    private String impUid;
    private String merchantUid;
    private String name;
    private String paidAt;
    private String payMethod;
    private String pgProvider;
    private String status;
    private String userAgent;
    private Integer cancelAmount;
    private Integer cancelledAt;

}