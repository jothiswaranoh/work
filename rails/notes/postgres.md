Sure, here's a Markdown file containing the information I provided earlier:

```markdown
# Creating PostgreSQL User with Superuser Privileges

To create a PostgreSQL user named "portal" with superuser privileges, follow these steps:

1. **Access PostgreSQL Prompt:**

   Access the PostgreSQL prompt as a superuser:

   ```bash
   psql -U postgres
   ```

2. **Alter User to Superuser:**

   Inside the PostgreSQL prompt, alter the existing "portal" user to have superuser privileges:

   ```sql
   ALTER USER portal WITH SUPERUSER;
   ```

3. **Exit the PostgreSQL Prompt:**

   After altering the user's privileges, exit the PostgreSQL prompt:

   ```sql
   \q
   ```

This will grant superuser privileges to the existing "portal" user. Keep in mind that superuser privileges grant extensive access and control over the database, so use them with caution and only for trusted users who require such privileges.

Remember to replace `'your_password'` with a strong and secure password. Additionally, ensure that you're following security best practices and only granting superuser privileges to trusted users who require such permissions.
```

You can copy and paste this content into a Markdown file (e.g., `create_superuser.md`) using a text editor or a Markdown editor. This file will then contain the instructions for creating a PostgreSQL user with superuser privileges.