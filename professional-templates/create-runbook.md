# Rule: Generating an Operational Runbook

## Goal

To guide an AI assistant in creating a comprehensive runbook that enables any engineer to operate, troubleshoot, and maintain a service in production.

## Process

1. **Receive Service Description:** User provides service/system to document.
2. **Ask Operational Questions:** AI *must* gather operational context.
3. **Generate Runbook:** Create complete operational documentation.
4. **Save Runbook:** Save as `runbook-[service-name].md` in `/tasks/`.
5. **Test Instructions:** Validate all commands and procedures work.

## Clarifying Questions (LLM Must Ask)

**Service Context:**
1. What type of service is this?
   - A) Web application
   - B) API service
   - C) Data pipeline
   - D) Background worker
   - E) Database
   - F) Other (specify)

2. What is the deployment environment?
   - A) Kubernetes
   - B) Docker containers
   - C) VMs (EC2, GCE)
   - D) Serverless (Lambda, Cloud Functions)
   - E) Bare metal

3. What is the criticality level?
   - A) Critical (customer-facing, revenue-impacting)
   - B) High (internal tools, important features)
   - C) Medium (supporting services)
   - D) Low (non-critical, experimental)

**Operational Requirements:**
4. What monitoring tools are used?
   - A) Prometheus/Grafana
   - B) DataDog
   - C) CloudWatch
   - D) New Relic
   - E) Custom monitoring
   - F) Multiple (specify)

5. What is the on-call rotation?
   - A) 24/7 coverage
   - B) Business hours only
   - C) Follow-the-sun
   - D) No formal on-call

## Runbook Structure

```markdown
# Runbook: [Service Name]

**Version:** 1.0
**Last Updated:** [YYYY-MM-DD HH:MM]
**Authors:** [Names/AI Assistant]
**Service Owner:** [Team/Individual]
**Criticality:** Critical | High | Medium | Low
**On-Call:** [Rotation details]

## Table of Contents
1. [Service Overview](#service-overview)
2. [Architecture](#architecture)
3. [Dependencies](#dependencies)
4. [Deployment](#deployment)
5. [Monitoring & Alerts](#monitoring--alerts)
6. [Troubleshooting](#troubleshooting)
7. [Emergency Procedures](#emergency-procedures)
8. [Maintenance](#maintenance)
9. [Disaster Recovery](#disaster-recovery)
10. [Contacts](#contacts)

---

## Service Overview

### Purpose
[What this service does and why it exists]

### Business Impact
[What happens to the business if this service is down]

### SLA/SLO
- **Availability Target:** 99.9% (allows ~43 minutes downtime/month)
- **Response Time p95:** < 200ms
- **Error Rate:** < 0.1%

### Key Metrics
| Metric | Normal Range | Alert Threshold | Dashboard Link |
|--------|--------------|-----------------|----------------|
| CPU Usage | 20-40% | > 80% | [Link] |
| Memory | 2-4GB | > 6GB | [Link] |
| Request Rate | 100-500 rps | > 1000 rps | [Link] |
| Error Rate | < 0.1% | > 1% | [Link] |

---

## Architecture

### System Diagram
```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   Load      │────▶│   Service   │────▶│  Database   │
│  Balancer   │     │   (3 pods)  │     │  (Primary)  │
└─────────────┘     └─────────────┘     └─────────────┘
                           │                    │
                           ▼                    ▼
                    ┌─────────────┐     ┌─────────────┐
                    │    Cache    │     │  DB Replica │
                    │   (Redis)   │     │             │
                    └─────────────┘     └─────────────┘
```

### Components
| Component | Technology | Version | Location | Purpose |
|-----------|------------|---------|----------|---------|
| API Server | Node.js | 18.x | K8s cluster | Handle requests |
| Database | PostgreSQL | 14.x | RDS | Data persistence |
| Cache | Redis | 7.x | ElastiCache | Session/data cache |
| Queue | SQS | - | AWS | Async processing |

### Configuration
- **Environment Variables:** [List key env vars]
- **Config Files:** `/config/production.yaml`
- **Secrets Management:** AWS Secrets Manager
- **Feature Flags:** LaunchDarkly

---

## Dependencies

### Upstream Dependencies
| Service | Purpose | Criticality | Fallback Strategy |
|---------|---------|-------------|-------------------|
| Auth Service | Authentication | Critical | Cache tokens locally |
| Payment API | Process payments | Critical | Queue for retry |
| Email Service | Notifications | Medium | Queue and retry |

### Downstream Dependencies
| Service | Impact if We're Down |
|---------|---------------------|
| Mobile App | Cannot fetch data |
| Web Dashboard | Features disabled |
| Analytics | Missing data points |

---

## Deployment

### Deployment Process

#### 1. Pre-deployment Checks
```bash
# Check service health
kubectl get pods -n production | grep [service-name]

# Check current version
kubectl describe deployment [service-name] -n production | grep Image

# Run pre-deployment tests
./scripts/pre-deploy-check.sh
```

#### 2. Deployment Commands
```bash
# Standard deployment
kubectl apply -f k8s/production/

# Rolling update
kubectl set image deployment/[service-name] [service-name]=[image:tag] -n production

# With specific version
helm upgrade [service-name] ./charts/[service-name] --version [version] -n production
```

#### 3. Post-deployment Verification
```bash
# Check rollout status
kubectl rollout status deployment/[service-name] -n production

# Verify pods are running
kubectl get pods -n production -l app=[service-name]

# Check logs for errors
kubectl logs -n production -l app=[service-name] --tail=100

# Run smoke tests
./scripts/smoke-test.sh production
```

### Rollback Procedure
```bash
# Immediate rollback to previous version
kubectl rollout undo deployment/[service-name] -n production

# Rollback to specific revision
kubectl rollout undo deployment/[service-name] --to-revision=2 -n production

# Verify rollback
kubectl rollout status deployment/[service-name] -n production
```

---

## Monitoring & Alerts

### Dashboards
- **Main Dashboard:** [URL to Grafana/DataDog]
- **Business Metrics:** [URL]
- **Infrastructure:** [URL]
- **Logs:** [URL to ELK/CloudWatch]

### Key Alerts

| Alert Name | Condition | Severity | Response |
|------------|-----------|----------|----------|
| High CPU | > 80% for 5min | Warning | Scale up pods |
| High Memory | > 90% usage | Critical | Restart pods, check for leaks |
| High Error Rate | > 1% for 5min | Critical | Check logs, rollback if needed |
| Low Disk Space | < 10% free | Warning | Clean up logs/temp files |
| Service Down | 0 healthy pods | Critical | Check deployment, restart |

### Log Queries

```sql
-- Find errors in last hour
SELECT * FROM logs
WHERE service='[service-name]'
  AND level='ERROR'
  AND timestamp > NOW() - INTERVAL '1 hour'

-- Find slow queries
SELECT * FROM logs
WHERE service='[service-name]'
  AND response_time > 1000
  AND timestamp > NOW() - INTERVAL '1 hour'
```

---

## Troubleshooting

### Common Issues

#### Issue: High Response Times
**Symptoms:** p95 latency > 500ms
**Check:**
```bash
# Check pod resources
kubectl top pods -n production -l app=[service-name]

# Check database connections
kubectl exec -it [pod-name] -n production -- netstat -an | grep ESTABLISHED | wc -l

# Check cache hit rate
redis-cli --stat
```
**Fix:**
1. Scale up pods if CPU/memory constrained
2. Optimize database queries
3. Increase cache TTL
4. Enable connection pooling

#### Issue: Memory Leak
**Symptoms:** Gradual memory increase, OOM kills
**Check:**
```bash
# Get memory usage over time
kubectl top pods -n production -l app=[service-name] --containers

# Check for heap dumps
kubectl exec -it [pod-name] -n production -- ls /tmp/*.hprof
```
**Fix:**
1. Restart affected pods
2. Take heap dump for analysis
3. Review recent code changes
4. Apply memory limits

#### Issue: Database Connection Errors
**Symptoms:** "Connection pool exhausted" errors
**Check:**
```bash
# Check connection count
psql -h [db-host] -U [user] -c "SELECT count(*) FROM pg_stat_activity WHERE datname='[db-name]';"

# Check for long-running queries
psql -h [db-host] -U [user] -c "SELECT pid, age(clock_timestamp(), query_start), query FROM pg_stat_activity WHERE age(clock_timestamp(), query_start) > '5 minutes';"
```
**Fix:**
1. Increase connection pool size
2. Kill long-running queries
3. Restart connection pool
4. Scale database if needed

---

## Emergency Procedures

### Service is Down

1. **Immediate Actions:**
```bash
# Check if pods are running
kubectl get pods -n production -l app=[service-name]

# If no pods, check deployment
kubectl get deployment [service-name] -n production

# Force restart all pods
kubectl rollout restart deployment/[service-name] -n production
```

2. **If restart doesn't work:**
```bash
# Check recent changes
kubectl rollout history deployment/[service-name] -n production

# Rollback to last known good
kubectl rollout undo deployment/[service-name] -n production
```

3. **Escalation:**
- After 5 minutes: Page secondary on-call
- After 15 minutes: Page team lead
- After 30 minutes: Invoke disaster recovery

### Data Corruption

1. **Stop writes immediately:**
```bash
# Set service to read-only mode
kubectl set env deployment/[service-name] READ_ONLY=true -n production
```

2. **Assess damage:**
```sql
-- Check data integrity
SELECT COUNT(*) FROM [table] WHERE [integrity_check];
```

3. **Restore from backup:**
```bash
# Restore database from snapshot
aws rds restore-db-instance-from-db-snapshot \
  --db-instance-identifier [new-instance] \
  --db-snapshot-identifier [snapshot-id]
```

---

## Maintenance

### Regular Maintenance Tasks

#### Daily
- [ ] Check error logs for anomalies
- [ ] Verify backup completion
- [ ] Review monitoring dashboards

#### Weekly
- [ ] Review and acknowledge alerts
- [ ] Clean up old logs/temp files
- [ ] Update documentation if needed

#### Monthly
- [ ] Security patches
- [ ] Dependency updates
- [ ] Performance review
- [ ] Capacity planning

### Maintenance Commands

```bash
# Clean up old logs
find /var/log/[service-name] -mtime +30 -delete

# Vacuum database
psql -h [db-host] -U [user] -d [db-name] -c "VACUUM ANALYZE;"

# Clear cache
redis-cli FLUSHALL

# Rotate credentials
./scripts/rotate-credentials.sh
```

---

## Disaster Recovery

### Backup Strategy
- **Frequency:** Daily automated, hourly for critical data
- **Retention:** 30 days standard, 1 year for monthly snapshots
- **Location:** Cross-region replication to [region]

### Recovery Procedures

#### RTO: 1 hour | RPO: 1 hour

1. **Database Recovery:**
```bash
# List available snapshots
aws rds describe-db-snapshots --db-instance-identifier [instance-id]

# Restore from snapshot
aws rds restore-db-instance-from-db-snapshot \
  --db-instance-identifier [new-instance] \
  --db-snapshot-identifier [snapshot-id]

# Update connection string
kubectl set env deployment/[service-name] DATABASE_URL=[new-connection-string] -n production
```

2. **Service Recovery:**
```bash
# Deploy to disaster recovery region
kubectl config use-context [dr-region]
kubectl apply -f k8s/disaster-recovery/

# Update DNS to point to DR region
./scripts/update-dns-dr.sh
```

3. **Data Validation:**
```sql
-- Verify data integrity
SELECT COUNT(*) FROM [critical_table];
-- Compare with expected count
```

---

## Contacts

### Escalation Path

| Level | Contact | Method | When to Contact |
|-------|---------|--------|-----------------|
| L1 | On-call Engineer | PagerDuty | First response |
| L2 | Team Lead | Phone | After 15 min |
| L3 | Engineering Manager | Phone | After 30 min |
| L4 | VP Engineering | Phone | Major incident |

### Key Personnel

| Role | Name | Contact | Timezone |
|------|------|---------|----------|
| Service Owner | [Name] | [email/phone] | [TZ] |
| Tech Lead | [Name] | [email/phone] | [TZ] |
| Product Owner | [Name] | [email/phone] | [TZ] |
| SRE Team | [Team] | [slack channel] | Various |

### External Vendors

| Vendor | Purpose | Support Contact | Account # |
|--------|---------|-----------------|-----------|
| AWS | Infrastructure | [support URL] | [account] |
| DataDog | Monitoring | [support email] | [account] |
| PagerDuty | Alerting | [support phone] | [account] |

---

## Appendix

### Useful Commands Cheatsheet

```bash
# Get pod logs
kubectl logs -f [pod-name] -n production

# Execute into pod
kubectl exec -it [pod-name] -n production -- /bin/bash

# Port forward for debugging
kubectl port-forward [pod-name] 8080:8080 -n production

# Get events
kubectl get events -n production --sort-by='.lastTimestamp'

# Describe pod issues
kubectl describe pod [pod-name] -n production
```

### Related Documentation
- [Architecture Design Doc]
- [API Documentation]
- [Deployment Guide]
- [Security Policies]

---

## Revision History

| Version | Date | Changes | Author |
|---------|------|---------|--------|
| 1.0 | [Date] | Initial runbook | [Author] |
```

## Version Control Integration

```bash
# Track runbook
echo "| runbook-[service] | v1.0 | $(date +%Y-%m-%d) | [Service] |" >> RUNBOOK_TRACKING.md

# Commit
git add tasks/runbook-[service].md
git commit -m "Runbook: [Service Name]

- Service: [Name]
- Criticality: [Level]
- On-call: [Rotation]"
```

## AI Assistant Instructions

The AI must:
1. Include actual commands that work
2. Provide specific thresholds and metrics
3. Cover all common failure scenarios
4. Include rollback procedures
5. List all dependencies
6. Provide clear escalation paths
7. Include disaster recovery steps

## Output

- **Format:** Markdown (`.md`)
- **Location:** `/tasks/`
- **Filename:** `runbook-[service-name].md`