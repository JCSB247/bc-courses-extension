codeunit 50100 "SANBA Courses Setup Mgt."
{
    var
        CoursesSetup: Record "SANBA Courses Setup";
        IsSetupRead: Boolean;

    procedure GetRecordOnce()
    begin
        if not IsSetupRead then begin
            CoursesSetup.Get();
            IsSetupRead := true;
        end;
    end;

    procedure GetCoursesSetup(): Record "SANBA Courses Setup"
    begin
        GetRecordOnce();
        exit(CoursesSetup);
    end;

    procedure GetCourseNos(): Code[20]
    begin
        GetRecordOnce();
        exit(CoursesSetup."Course Nos.");
    end;
}