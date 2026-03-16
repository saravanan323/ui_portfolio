/*
 Common Annotations shared by all apps
*/

using {sap.ui5.portfolio as my} from '../db/schema';
using {
  sap.common,
  sap.common.Currencies
} from '@sap/cds/common';

annotate Currencies with {
  symbol @Common.Label: '{i18n>Currency}';
}

////////////////////////////////////////////////////////////////////////////
//
//	Languages List
//
annotate common.Languages with @(
  Common.SemanticKey: [code],
  Identification    : [{Value: code}],
  UI                : {
    SelectionFields: [
      name,
      descr
    ],
    LineItem       : [
      {Value: code},
      {Value: name},
    ],
  }
);

////////////////////////////////////////////////////////////////////////////
//
//	Language Details
//
annotate common.Languages with @(UI: {
  HeaderInfo         : {
    TypeName      : '{i18n>Language}',
    TypeNamePlural: '{i18n>Languages}',
    Title         : {Value: name},
    Description   : {Value: descr}
  },
  Facets             : [{
    $Type : 'UI.ReferenceFacet',
    Label : '{i18n>Details}',
    Target: '@UI.FieldGroup#Details'
  }, ],
  FieldGroup #Details: {Data: [
    {Value: code},
    {Value: name},
    {Value: descr}
  ]},
});

////////////////////////////////////////////////////////////////////////////
//
//	Currencies List
//
annotate common.Currencies with @(
  Common.SemanticKey: [code],
  Identification    : [{Value: code}],
  UI                : {
    SelectionFields: [
      name,
      descr
    ],
    LineItem       : [
      {Value: descr},
      {Value: symbol},
      {Value: code},
    ],
  }
);

////////////////////////////////////////////////////////////////////////////
//
//	Currency Details
//
annotate common.Currencies with @(UI: {
  HeaderInfo         : {
    TypeName      : '{i18n>Currency}',
    TypeNamePlural: '{i18n>Currencies}',
    Title         : {Value: descr},
    Description   : {Value: code}
  },
  Facets             : [{
    $Type : 'UI.ReferenceFacet',
    Label : '{i18n>Details}',
    Target: '@UI.FieldGroup#Details'
  }],
  FieldGroup #Details: {Data: [
    {Value: name},
    {Value: symbol},
    {Value: code},
    {Value: descr}
  ]}
});
