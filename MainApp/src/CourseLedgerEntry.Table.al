table 50103 "SANBA Course Ledger Entry"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
        }
        field(2; "Course No."; Code[50])
        {
            Caption = 'Course No.';
            DataClassification = CustomerContent;
            TableRelation = "SANBA Course";
        }
        field(3; "Course Edition No."; Integer)
        {
            Caption = 'Course Edition No.';
            DataClassification = CustomerContent;
        }
        field(4; "Posting date"; Date)
        {
            Caption = 'Posting date';
            DataClassification = CustomerContent;
        }
        field(5; Description; Text[100])
        {
            Caption = 'Descripption';
            DataClassification = CustomerContent;
        }
        field(6; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = CustomerContent;
        }
        field(7; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = CustomerContent;
        }
        field(8; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
        }
        field(9; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            DataClassification = CustomerContent;
            TableRelation = "Source Code";
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
    trigger OnModify()
    begin
        Error('Los movimientos de curso no se pueden modificar.');
    end;

    trigger OnDelete()
    begin
        Error('Los movimientos de curso no se pueden eliminar.');
    end;
}