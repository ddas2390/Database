-- Index - speed up queries

-- EXPLAIN SELECT * FROM hero_battles WHERE outcome = 'Won';
CREATE INDEX index_outcome ON hero_battles(outcome);
-- SHOW INDEX FROM hero_battles;
-- EXPLAIN SELECT * FROM hero_battles WHERE outcome = 'Won';
CREATE UNIQUE INDEX index_num_enemies ON hero_battles(num_enemies);
-- CREATE TEXT INDEX index_text ON hero_battles(text_column);
-- CREATE REGULAR INDEX index_text ON hero_battles(text_column);
-- CREATE SPATIAL INDEX index_text ON hero_battles(text_column);