using {
  Currency,
  managed,
  cuid,
  sap
} from '@sap/cds/common';

namespace portfolio;

entity BasicInfo : managed {
  key ID          : UUID;
      Name        : String(255);
      Description : String(1000);
      Phone       : String(20);
      Email       : String(255);
      Website     : String(255);
      GitHub      : String(255);
      LinkedIn    : String(255);
      Address     : String(255);
      City        : String(255);
      Country     : String(255);
      Designation : String(255);
      JobTitle    : String(255);
      Keywords    : String(255);
}

entity Experience {
  key ID          : UUID;
      Company     : String;
      Role        : String;
      Years       : String;
      Description : String;
}

entity Skills {
  key ID        : UUID;
      SkillName : String;
      Category  : String;
}

entity Projects {
  key ID          : UUID;
      Title       : String;
      Description : String;
      Technology  : String;
      GitHub      : String;
}
