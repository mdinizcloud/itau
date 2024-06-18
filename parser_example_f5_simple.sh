#_code_dynatrace_
USING(
  IN "SNMPv2-MIB::snmpTrapOID":STRING,
  INOUT "F5-BIGIP-COMMON-MIB::bigipNotifyObjMsg":STRING,
  INOUT "SNMPv2-MIB::snmpTrapEnterprise":STRING,
  INOUT "DISMAN-EVENT-MIB::sysUpTimeInstance":STRING,
  INOUT "loglevel":STRING
)
| FIELDS_RENAME(content:COLUMN("F5-BIGIP-COMMON-MIB::bigipNotifyObjMsg"))

| FIELDS_ADD(
    status: (
      case
        when COLUMN('SNMPv2-MIB::snmpTrapOID') == '.1.3.6.1.4.1.3375.2.4.0.10' then 'ERROR' // bigipServiceDown
        when COLUMN('SNMPv2-MIB::snmpTrapOID') == '.1.3.6.1.4.1.3375.2.4.0.111' then 'WARN' // bigipSsdMwiNearThreshold
        else "INFO"
      end
    )
  )

| FIELDS_REMOVE(
    COLUMN("loglevel"),
    COLUMN("F5-BIGIP-COMMON-MIB::bigipNotifyObjMsg"),
    COLUMN("SNMPv2-MIB::snmpTrapEnterprise"),
    COLUMN("DISMAN-EVENT-MIB::sysUpTimeInstance")
  )



#_example_code_
{
  "event.type": "LOG",
  "content": "SNMP trap (F5-BIGIP-COMMON-MIB::bigipChassisPowerSupplyBad) reported from 127.0.0.1\n",
  "status": "NONE",
  "timestamp": "1666702086593",
  "loglevel": "NONE",
  "log.source": "snmptraps",
  "snmp.trap_oid": "F5-BIGIP-COMMON-MIB::bigipChassisPowerSupplyBad",
  "device.address": "127.0.0.1",
  "dt.entity.snmptraps:com_dynatrace_ext_snmp-traps": "CUSTOM_DEVICE-9E41E0B829214020",
  "SNMPv2-MIB::snmpTrapOID": ".1.3.6.1.4.1.3375.2.4.0.9",
  "DISMAN-EVENT-MIB::sysUpTimeInstance": "476",
  "snmp.version": "2c",
  "F5-BIGIP-COMMON-MIB::bigipNotifyObjMsg": "010d0006:0 Chassis power supply 2 has experienced an issue. Status is as follows: DOWN.",
  "SNMPv2-MIB::snmpTrapEnterprise": ".1.3.6.1.4.1.3375.2.4"
}


#_result_code_
{
  "snmp.trap_oid": "F5-BIGIP-COMMON-MIB::bigipChassisPowerSupplyBad",
  "device.address": "127.0.0.1",
  "dt.entity.snmptraps:com_dynatrace_ext_snmp-traps": "CUSTOM_DEVICE-9E41E0B829214020",
  "SNMPv2-MIB::snmpTrapOID": ".1.3.6.1.4.1.3375.2.4.0.9",
  "event.type": "LOG",
  "log.source": "snmptraps",
  "snmp.version": "2c",
  "content": "010d0006:0 Chassis power supply 2 has experienced an issue. Status is as follows: DOWN.",
  "timestamp": "2022-10-25T12:48:06.593000000Z",
  "status": "WARN"
}
