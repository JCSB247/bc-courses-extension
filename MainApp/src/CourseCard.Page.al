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
            field("No."; Rec."No.")
            {
                ApplicationArea = All;
            }
            field(Description; Rec.Description)
            {
                ApplicationArea = All;
            }
        }
    }
}