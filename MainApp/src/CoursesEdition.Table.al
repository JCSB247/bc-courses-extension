table 50102 "SANBA Course Edition"
{
    Caption = 'Course Edition';
    DataCaptionFields = "Course No.", "No.";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Course No."; Code[20])
        {
            Caption = 'Course No.';
            DataClassification = CustomerContent;
            TableRelation = "SANBA Course";
        }
        field(2; "No."; Integer)
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(4; "Start Date"; Date)
        {
            Caption = 'Start Date';
            DataClassification = CustomerContent;
        }
        field(5; "End Date"; Date)
        {
            Caption = 'End Date';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Course No.", "No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        CourseEdition: Record "SANBA Course Edition";
    begin
        if "No." = 0 then begin
            CourseEdition.SetRange("Course No.", "Course No.");
            if CourseEdition.FindLast() then
                "No." := CourseEdition."No." + 1
            else
                "No." := 1;
        end;
    end;
}