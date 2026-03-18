page 50103 "SANBA Course Edition List"
{
    Caption = 'SANBA Course Editions';
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "SANBA Course Edition";
    Editable = False;
    CardPageId = "SANBA Course Edition Card";

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("Course No."; Rec."Course No.") { }
                field("No."; Rec."No.") { }
                field(Description; Rec.Description) { }
                field("Start Date"; Rec."Start Date") { }
                field("End Date"; Rec."End Date") { }
            }
        }
    }
}
