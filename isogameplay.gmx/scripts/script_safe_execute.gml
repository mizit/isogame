///script_safe_execute(script);

if (script_exists(argument0))
{
    script_execute(argument0);
    return true;
}
else
{
    return false;
}
