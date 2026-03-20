table 50101 "SANBA Courses Setup"
{
    Caption = 'SANBA Courses Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[20])
        {
            Caption = 'Primary Key';
            DataClassification = CustomerContent;
        }
        field(2; "Course Nos."; Code[20])
        {
            Caption = 'Course Nos.';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
    trigger OnDelete()
    begin
        Error('No se puede eliminar la configuración de cursos');
    end;

}