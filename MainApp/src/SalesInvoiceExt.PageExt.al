pageextension 50101 "SANBA Sales Invoice Ext." extends "Sales Invoice Subform"
{
    layout
    {
        addlast(Control1)
        {
            field("Course No."; Rec."Course No.")
            {
                ApplicationArea = All;
                Caption = 'Course No.';
            }
            field("Course Edition No."; Rec."Course Edition No.")
            {
                ApplicationArea = All;
                Caption = 'Course Edition No.';
            }
        }
    }
}