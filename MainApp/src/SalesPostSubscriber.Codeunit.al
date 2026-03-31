codeunit 50102 "SANBA Sales Post Subscriber"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post",
        'OnAfterPostSalesLine', '', false, false)]
    local procedure OnAfterPostSalesLine(
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line")
    var
        PostLine: Codeunit "SANBA Course Journal Post Line";
        JournalLine: Record "SANBA Course Journal Line";
    begin
        if SalesLine."Course No." = '' then
            exit;

        JournalLine.Init();
        JournalLine."Journal Batch Name" := 'SALES';
        JournalLine."Line No." := 1;
        JournalLine."Course No." := SalesLine."Course No.";
        JournalLine."Course Edition No." := SalesLine."Course Edition No.";
        JournalLine."Posting Date" := SalesHeader."Posting Date";
        JournalLine.Description := SalesLine.Description;
        JournalLine.Quantity := SalesLine.Quantity;
        JournalLine."Document No." := SalesHeader."No.";
        JournalLine.Insert();
        PostLine.Run(JournalLine);
    end;
}