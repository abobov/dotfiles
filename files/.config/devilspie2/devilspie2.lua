debug_print("Application: " .. get_application_name() ..
            ", window: " .. get_window_name() ..
            ", window type: " .. get_window_type() ..
            ", window class: " .. get_window_class());

if (get_window_type() == 'WINDOW_TYPE_NORMAL') then
    if (get_application_name() == 'Document Viewer') then
        maximize();
    elseif (get_application_name() == 'mpv') then
        center();
    elseif (get_application_name() == 'KeePassXC') then
        center();
    elseif (get_application_name() == 'TkRemind') then
        center();
    elseif (get_window_name() == 'gitk') then
        maximize();
    elseif (get_window_name() == 'win0') then
        -- IntelliJ IDEA starting window
        set_window_workspace(2);
    elseif (get_window_class() == 'jetbrains-idea' or get_window_class() == 'jetbrains-datagrip') then
        set_window_workspace(2);
        --maximize();
    end
end
