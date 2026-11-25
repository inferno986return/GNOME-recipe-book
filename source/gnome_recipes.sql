PRAGMA journal_mode = WAL;
PRAGMA foreign_keys = ON;

CREATE TABLE chefs (
    chef_id     TEXT PRIMARY KEY,
    name        TEXT NOT NULL,
    full_name   TEXT,
    image_path  TEXT,
    description TEXT
) STRICT;

CREATE TABLE recipes (
    recipe_id     TEXT PRIMARY KEY,
    name          TEXT NOT NULL,
    author_id     TEXT REFERENCES chefs(chef_id) ON UPDATE CASCADE,
    description   TEXT,
    cuisine       TEXT,
    season        TEXT,
    category      TEXT,
    prep_time     TEXT,
    cook_time     TEXT,
    instructions  TEXT,
    notes         TEXT,
    serves        INTEGER,
    yield_text    TEXT,
    spiciness     INTEGER,
    diets         INTEGER,
    default_image INTEGER,
    images_raw    TEXT,
    created_at    TEXT,
    modified_at   TEXT
) STRICT;

CREATE TABLE ingredients (
    id         INTEGER PRIMARY KEY AUTOINCREMENT,
    recipe_id  TEXT NOT NULL REFERENCES recipes(recipe_id) ON DELETE CASCADE,
    sort_order INTEGER NOT NULL,
    amount     TEXT,
    unit       TEXT,
    item       TEXT NOT NULL,
    ingredient_group TEXT
) STRICT;

CREATE TABLE featured_items (
    list_type  TEXT NOT NULL CHECK (list_type IN ('todays', 'picks', 'chefs')),
    sort_order INTEGER NOT NULL,
    target_id  TEXT NOT NULL,
    PRIMARY KEY (list_type, sort_order)
) STRICT;