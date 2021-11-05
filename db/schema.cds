namespace scp.cloud;

using {
    cuid,
    sap.common
}   from '@sap/cds/common';

entity Cities : cuid, {
    city                  : String(100)          @title : 'City';
    inhabitants           : String(100)          @title : 'Inhabitants';
    state                 : String(100)          @title : 'State';
}