pageextension 50100 "SANBA Sales Order Ext." extends "Sales Order Subform"
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