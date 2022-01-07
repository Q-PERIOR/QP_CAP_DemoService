namespace qpe.cloud;

using {
    cuid,
    sap.common
}   from '@sap/cds/common';

@Aggregation.ApplySupported.PropertyRestrictions: true 
entity Cities : cuid, {
    @Analytics.Dimension: true 
    city                  : String(100)          @title : 'City';
    @Analytics.Measure: true
    @Aggregation.default: #SUM
    inhabitants           : Integer(100)          @title : 'Inhabitants';
    @Analytics.Dimension: true 
    state                 : String(100)          @title : 'State';
}