page 50102 "SANBA Courses Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "SANBA Courses Setup";
    Caption = 'SANBA Courses Setup';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Course Nos."; Rec."Course Nos.")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}