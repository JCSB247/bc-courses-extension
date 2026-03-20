page 50106 "SANBA Course Ledger Entries"
{
    Caption = 'Course Ledger Entries';
    PageType = List;
    SourceTable = "SANBA Course Ledger Entry";
    UsageCategory = History;
    ApplicationArea = All;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("Entry No."; Rec."Entry No.") { ApplicationArea = All; }
                field("Course No."; Rec."Course No.") { ApplicationArea = All; }
                field("Course Edition No."; Rec."Course Edition No.") { ApplicationArea = All; }
                field("Posting Date"; Rec."Posting Date") { ApplicationArea = All; }
                field(Description; Rec.Description) { ApplicationArea = All; }
                field(Quantity; Rec.Quantity) { ApplicationArea = All; }
                field("Document No."; Rec."Document No.") { ApplicationArea = All; }
                field("User ID"; Rec."User ID") { ApplicationArea = All; }
                field("Source Code"; Rec."Source Code") { ApplicationArea = All; }
            }
        }
    }
}