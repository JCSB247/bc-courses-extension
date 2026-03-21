table 50104 "SANBA Course Journal Line"
{
    Caption = 'Course Journal Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
            DataClassification = CustomerContent;
        }
        field(2; "line No."; Integer)
        {
            Caption = 'line No.';
            DataClassification = CustomerContent;
        }
        field(3; "Course No."; Code[20])
        {
            Caption = 'Course No.';
            DataClassification = CustomerContent;
            TableRelation = "SANBA Course";

            trigger OnValidate()
            var
                Course: Record "SANBA Course";
            begin
                if "Course No." = '' then begin
                    Description := '';
                    exit;
                end;
                Course.Get("Course No.");
                Description := Course.Description;
            end;
        }
        field(4; "Course Edition No."; Integer)
        {
            Caption = 'Course Edition No.';
            DataClassification = CustomerContent;
        }
        field(5; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;
        }
        field(6; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(7; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = CustomerContent;
        }
        field(8; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = CustomerContent;
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
        key(PK; "Journal Batch Name", "Line No.")
        {
            Clustered = true;
        }
    }
}