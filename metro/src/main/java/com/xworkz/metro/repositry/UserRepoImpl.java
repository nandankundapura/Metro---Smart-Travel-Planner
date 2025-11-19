package com.xworkz.metro.repositry;

import com.xworkz.metro.entity.SmartCardEntity;
import com.xworkz.metro.entity.TicketEntity;
import com.xworkz.metro.entity.UserRegisterEntity;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.*;
import java.util.Collections;
import java.util.List;

@Repository
@Slf4j
public class UserRepoImpl implements UserRepo{

    @Autowired
    EntityManagerFactory entityManagerFactory;

    @Override
    public void save(UserRegisterEntity userRegisterEntity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.persist(userRegisterEntity);
            transaction.commit();
        } catch (Exception e) {
            log.info("exception in repo======="+e.getMessage());
        } finally {
            entityManager.close();
        }
    }

    @Override
    public UserRegisterEntity findingEmailFromDataBase(String email) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            EntityTransaction transaction=entityManager.getTransaction();
            transaction.begin();
            Query query = entityManager.createNamedQuery("emailFindByMe");
            query.setParameter("email", email);
            Object object = query.getSingleResult();
            UserRegisterEntity userRegisterEntity = (UserRegisterEntity) object;
            log.info("userRegistrationEntity from email {}",userRegisterEntity);
            transaction.commit();
            return userRegisterEntity;
        } catch (Exception e) {
            log.info("Some Problem fetching with database ");
            return null;
        } finally {
            entityManager.close();
        }
    }

    @Override
    public UserRegisterEntity findUserByPhoneNumber(String mobileNumber) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            Query query = entityManager.createNamedQuery("findUserByMobileNumber");
            query.setParameter("mobileNumber", mobileNumber);
            Object object = query.getSingleResult();
            UserRegisterEntity userRegisterEntity = (UserRegisterEntity) object;
            log.info("userRegistrationEntity from phNo {}",userRegisterEntity);
            return userRegisterEntity;
        } catch (Exception e) {
            log.info("Some Problem fetching with database");
        } finally {
            entityManager.close();
        }
        return null;
    }

    @Override
    public boolean updateUserProfile(UserRegisterEntity registerEntity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            EntityTransaction entityManagerTransaction = entityManager.getTransaction();
            entityManagerTransaction.begin();
            entityManager.merge(registerEntity);
            entityManagerTransaction.commit();
            return true;
        }catch (Exception e){
            return false;
        }finally {
           entityManager.close();
        }
    }


    @Override
    public boolean saveOtp(String email, String otp) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            EntityTransaction transaction = entityManager.getTransaction();
            transaction.begin();
            Query query = entityManager.createNamedQuery("oneTimeOtp");
            query.setParameter("otp", otp);
            query.setParameter("email", email);
            query.executeUpdate();
            transaction.commit();
        } catch (Exception e) {
            System.out.println("print if theres an error");
        } finally {
            entityManager.close();
        }
        return true;
    }

    @Override
    public void saveTheDetails(TicketEntity ticketEntity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.persist(ticketEntity);
            transaction.commit();
        } catch (Exception e) {
            log.info("exception in repo=======" + e.getMessage());
        } finally {
            entityManager.close();
        }
    }


    @Override
    public List<TicketEntity> findingUserIdInTicketHistory(Integer userId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            Query query = entityManager.createNamedQuery("findUserIdTicketHistory");
            query.setParameter("userId",userId);
            List<TicketEntity> ticketEntity =(List<TicketEntity>)  query.getResultList()  ;
            log.info("ticketEntity {}",ticketEntity);
            return ticketEntity;
        } catch (Exception e) {
            log.info("message {}", e.getMessage());
        } finally {
            entityManager.close();
        }
        return null;
    }

    public void save(SmartCardEntity entity){
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            EntityTransaction entityTransaction = entityManager.getTransaction();
            entityTransaction.begin();
            entityManager.persist(entity);
            System.out.println("Repo" +entity);
            entityTransaction.commit();
        } catch (Exception e) {
        } finally {
            entityManager.close();
        }
    }

    @Override
    public List<SmartCardEntity> getAllSmartCardEntity() {
        return entityManagerFactory.createEntityManager().createNamedQuery("getAllSmartCardEntity").getResultList();
    }


    @Override
    public boolean updateSmartCardStatus(Long cardId, String status) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = null;
        try {
            transaction = entityManager.getTransaction();
            transaction.begin();

            // Create named query or use direct JPQL
            Query query = entityManager.createQuery("UPDATE SmartCardEntity s SET s.status = :status WHERE s.cardId = :cardId");
            query.setParameter("status", status);
            query.setParameter("cardId", cardId);

            int updatedCount = query.executeUpdate();
            transaction.commit();

            log.info("Updated {} smart card with ID: {} to status: {}", updatedCount, cardId, status);
            return updatedCount > 0;

        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            log.error("Error updating smart card status for ID: {} - {}", cardId, e.getMessage());
            return false;
        } finally {
            entityManager.close();
        }
    }

    // Repository method
    public SmartCardEntity getSmartCardByEmail(String email) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = null;
        try {
            Query query = entityManager.createNamedQuery("getCardByEmail");
            query.setParameter("email", email);
            return (SmartCardEntity) query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }


}
