page 50100 "SANBA Course List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = false;
    SourceTable = "SANBA Course";
    CardPageId = "SANBA Course Card";
    Caption = 'SANBA Courses';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Description"; Rec."Description")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}