tableextension 50100 "SANBA Sales Line Ext." extends "Sales Line"
{
    fields
    {
        field(50100; "Course No."; Code[20])
        {
            Caption = 'Course No.';
            DataClassification = CustomerContent;
            TableRelation = "SANBA Course";

            trigger OnValidate()
            var
                Course: Record "SANBA Course";
            begin
                if "Course No." = '' then begin
                    "Course Edition No." := 0;
                    exit;
                end;
                Course.Get("Course No.");
                if Course.Blocked <> Course.Blocked::" " then
                    Course.TestField(Blocked, Course.Blocked::" ");
            end;
        }
        field(50101; "Course Edition No."; Integer)
        {
            Caption = 'Course Edition No.';
            DataClassification = CustomerContent;
        }
    }
}