page 50107 "SANBA Course Journal Lines"
{
    Caption = 'SANBA Course Journal';
    PageType = Worksheet;
    ApplicationArea = All;
    UsageCategory = Tasks;
    SourceTable = "SANBA Course Journal Line";

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("Journal Batch Name"; Rec."Journal Batch Name")
                {
                    ApplicationArea = All;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                }
                field("Course No."; Rec."Course No.")
                {
                    ApplicationArea = All;
                }
                field("Course Edition No."; Rec."Course Edition No.")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                }
            }
        }

    }
    actions
    {
        area(Processing)
        {
            action(Post)
            {
                Caption = 'Contabilizar';
                ApplicationArea = All;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    PostLine: Codeunit "SANBA Course Journal Post Line";
                begin
                    //llamamos a la postline CodeUnit
                    PostLine.PostAll(Rec."Journal Batch Name");
                    CurrPage.Update();
                end;
            }
        }
    }
}