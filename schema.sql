CREATE TABLE routines (
    routine_id bigserial PRIMARY KEY,
    topic varchar(50),
    description text,
    routine_uuid UUID,
    created_at timestamp,
    updated_at timestamp
);

CREATE TABLE routine_hierachy (
    hierachy_id bigserial PRIMARY KEY,
    parent_routine_id bigserial REFERENCES routines(routine_id),
    child_routine_id bigserial REFERENCES routines(routine_id),
    hierachy_uuid UUID,
    created_at timestamp,
    updated_at timestamp
);

CREATE TABLE users (
    user_id serial PRIMARY KEY,
    user_name varchar(50),
    account varchar(50),
    password varchar(100),
    user_uuid UUID,
    created_at timestamp,
    updated_at timestamp
);

CREATE TABLE account_activities (
    activity_id serial PRIMARY KEY,
    user_id serial REFERENCES users(user_id),
    activity_type varchar(100),
    created_at timestamp,
    updated_at timestamp
);

CREATE TABLE user_permissions (
    permission_id serial PRIMARY KEY,
    permission_name varchar(50),
    description text
);

CREATE TABLE permission_assignment (
    assignment_id bigserial PRIMARY KEY,
    user_id serial REFERENCES users(user_id),
    routine_id bigserial REFERENCES routines(routine_id),
    permission_id serial REFERENCES user_permissions(permission_id),
    authorized_by serial REFERENCES users(user_id),
    assignment_uuid UUID,
    created_at timestamp,
    updated_at timestamp
);

CREATE TABLE groups(
    group_id bigserial PRIMARY KEY,
    group_name varchar(255),
    group_description varchar(255),
    group_uuid UUID,
    created_at timestamp,
    updated_at timestamp
)

CREATE TABLE memberships(
    membership_id bigserial PRIMARY KEY,
    user_id serial REFERENCES users(user_id),
    group_id serial REFERENCES groups(group_id),
    authorized_by serial REFERENCES users(user_id),
    created_at timestamp,
    updated_at timestamp
)

CREATE TABLE group_hierachy (
    hierachy_id bigserial PRIMARY KEY,
    parent_group_id bigserial REFERENCES groups(group_id),
    child_group_id bigserial REFERENCES groups(group_id),
    hierachy_uuid UUID,
    created_at timestamp,
    updated_at timestamp
);