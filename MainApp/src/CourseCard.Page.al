page 50101 "SANBA Course Card"
{
    PageType = Card;
    ApplicationArea = ALL;
    UsageCategory = None;
    SourceTable = "SANBA Course";
    Caption = 'SANBA Course';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = All;
                }
            }
            part(Editions; "SANBA Course Edition Subpage")
            {
                Caption = 'Course Editions';
                ApplicationArea = All;
                SubPageLink = "Course No." = field("No.");
            }
        }
    }
}