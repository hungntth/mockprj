package com.vti.specification;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.jpa.domain.Specification;

import com.vti.entity.Account;

public class AccountSpecification implements Specification<Account> {
	private String field;// ten truong can tim kiem
	private String operator; // toan tu so sanh
	private Object value; // gia tri so sanh

	public AccountSpecification(String field, String operator, Object value) {
		this.field = field;
		this.operator = operator;
		this.value = value;
	}

	@Override
	public Predicate toPredicate(Root<Account> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
		if (operator.equalsIgnoreCase("LIKE")) {
//			if ((field.equalsIgnoreCase("fullname")) || (field.equalsIgnoreCase("type"))) {
				return builder.like(root.get(field), "%" + value.toString() + "%");
//			}
		}
		return null;

	}
}
