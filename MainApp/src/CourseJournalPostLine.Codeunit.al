codeunit 50101 "SANBA Course Journal Post Line"
{
    trigger OnRun()
    begin

    end;

    Procedure Run(var JournalLine: Record "SANBA Course Journal Line")
    var
        LedgerEntry: Record "SANBA Course Ledger Entry";
    begin
        // Validar Campos obligatorios
        JournalLine.TestField("Course No.");
        JournalLine.TestField("Posting Date");
        JournalLine.TestField(Quantity);
        JournalLine.TestField("Document No.");

        //Crear LedgerEntry
        LedgerEntry.Init();
        LedgerEntry."Entry No." := GetLastEntryNo() + 1;
        LedgerEntry."Course No." := JournalLine."Course No.";
        LedgerEntry."Course Edition No." := JournalLine."Course Edition No.";
        LedgerEntry."Posting date" := JournalLine."Posting Date";
        LedgerEntry.Description := JournalLine.Description;
        LedgerEntry.Quantity := JournalLine.Quantity;
        LedgerEntry."Document No." := JournalLine."Document No.";
        LedgerEntry."User ID" := CopyStr(UserId(), 1, 50);
        LedgerEntry."Source Code" := JournalLine."Source Code";
        LedgerEntry.Insert();

        // Borrar la linea de diario
        JournalLine.Delete(true);
    end;



    procedure PostAll(BatchName: Code[10])
    var
        JournalLine: Record "SANBA Course Journal Line";
    begin
        JournalLine.SetRange("Journal Batch Name", BatchName);
        if JournalLine.FindSet() then
            repeat
                Run(JournalLine);
            until JournalLine.Next() = 0;
    end;



    Local procedure GetLastEntryNo(): Integer
    var
        LedgerEntry: Record "SANBA Course Ledger Entry";
    begin
        if LedgerEntry.FindLast() then
            exit(LedgerEntry."Entry No.");
        exit(0);
    end;
}