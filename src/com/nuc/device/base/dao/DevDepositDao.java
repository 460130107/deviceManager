package com.nuc.device.base.dao;

import com.nuc.device.base.bean.Deposit;

import java.util.List;


public interface DevDepositDao {
    public List<Deposit> queryDepositList();
    public Deposit queryDepositById(Long id);
    public void updateDeposit(Deposit deposit);
    public void delDeposit(Deposit deposit);
    public void insertDeposit(Deposit deposit);
}
