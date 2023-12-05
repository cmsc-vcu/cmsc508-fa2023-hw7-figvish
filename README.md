# Homework 7 CMSC508 - Fig Vishton

Premise:
My company consists of a ragtag bunch of designers and developers trying to pay for school by picking up project work under the tutelage of a world famous sensei of Kill-Bill fame. Business has been slow and my sensei has been looking for ways to jumpstart this frankenstein.

This database represents a company-wide resume capturing the collective skills and certifications of all the people in my company. This database captures skills, employees and their roles within the company.  The database helps my sensei find employees with specific skills, list the skills of any employee and help find gaps in the skill sets of employees in specific roles.

Skills and certifications are stored in a database table. Each skill has an ID, a name, a description, and a URL pointing to where customers can learn more about the credential and shake their heads in awe that this company is actually claiming it. It also includes desired skills, credentials and certifications that the sensei wants the company to have even if no worker currently does.

Employees are stored in a database table. Each employee has an employee ID, a name, an email address, a LinkedIn URL, a headshot, discord handle, a brief bio, and the date that they joined the company.

Roles are stored in a database table.  Each role has a role_id, a role name and a sort ID that will support pretty report creation.

The database associates skills and certifications with employees. Each skill can be associated with none or more employees. Each employee can have none or more skills. Each pairing of skill and employee includes a date the skill was acquired by or awarded to the employee. The table can also include the date that the skill or credential is ANTICIPATED to be acquired, so that the table can include expected graduation dates of the employees. Go Team!

This database associates employees with roles.  Each role can have one or more employees and each employee can play one or more roles. This table also tracks the date that an employee was assigned to a specific role. 

Enjoy!
