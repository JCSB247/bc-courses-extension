page 50104 "SANBA Course Edition Card"
{
    Caption = 'Course Editon';
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "SANBA Course Edition";

    layout
    {
        area(Content)
        {
            group(General)
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