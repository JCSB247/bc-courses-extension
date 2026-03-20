table 50100 "SANBA Course"
{
    Caption = 'Course';
    DataCaptionFields = "No.", Description;
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                SetupMgt: Codeunit "SANBA Courses Setup Mgt.";
                NoSeries: Codeunit "No. Series";
            begin
                NoSeries.TestManual(SetupMgt.GetCourseNos());
            end;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }

        field(3; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = "No. Series";
        }
        field(4; Type; Enum "SANBA Course Type")
        {
            Caption = 'Type';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        SetupMgt: Codeunit "SANBA Courses Setup Mgt.";
        NoSeries: Codeunit "No. Series";
    begin
        if "No." = '' then begin
            "No." := NoSeries.GetNextNo(SetupMgt.GetCourseNos());
            "No. Series" := SetupMgt.GetCourseNos();
        end;
    end;

    procedure AssistEdit(OldCourse: Record "SANBA Course"): Boolean
    var
        SetupMgt: Codeunit "SANBA Courses Setup Mgt.";
        NoSeries: Codeunit "No. Series";
    begin
        if NoSeries.LookupRelatedNoSeries(SetupMgt.GetCourseNos(), OldCourse."No. Series", "No. Series") then begin
            "No." := NoSeries.GetNextNo("No. Series");
            exit(true);
        end;
    end;
}