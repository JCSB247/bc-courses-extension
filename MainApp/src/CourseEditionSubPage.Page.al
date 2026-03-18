page 50105 "SANBA Course Edition Subpage"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "SANBA Course Edition";

    layout
    {
        area(Content)
        {
            repeater(Lineas)
            {
                field("No."; Rec."No.") { ApplicationArea = All; }
                field(Description; Rec.Description) { ApplicationArea = All; }
                field("Start Date"; Rec."Start Date") { ApplicationArea = All; }
                field("End Date"; Rec."End Date") { ApplicationArea = All; }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(OpenCard)
            {
                Caption = 'Open';
                ApplicationArea = All;
                Image = Open;
                RunObject = page "SANBA Course Edition Card";
            }
        }
    }
}