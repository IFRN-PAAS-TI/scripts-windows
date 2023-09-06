for /f %%u in (users.txt) do dsquery user -name %%u | dsmod user -pwd "SenhaPadrao" -mustchpwd yes >> log.txt 2>&1
