debug_print("Application: " .. get_application_name() ..
            ", window: " .. get_window_name() ..
            ", window type: " .. get_window_type());

if (get_window_type() == 'WINDOW_TYPE_NORMAL') then
    if (string.find(get_application_name(), 'IntelliJ IDEA')) then
        set_window_workspace(2);
        maximize();
    elseif (get_application_name() == 'Document Viewer') then
        maximize();
    elseif (get_application_name() == 'mpv') then
        center();
    elseif (get_window_name() == 'gitk') then
        maximize();
    end
end
