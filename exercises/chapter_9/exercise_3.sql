--
-- Learning SQL
-- Exercise 9-3
--


SELECT actor_n_role.actor_id, actor_level.level
FROM (
  -- subquery to count no. of roles an actor has starred in
  SELECT actor_id, COUNT(film_id) n_roles FROM film_actor
  GROUP BY actor_id
) actor_n_role
INNER JOIN (
  -- subquery to construct a actor level grading table
  SELECT 'Hollywood Star' level, 30 min_roles, 99999 max_roles
  UNION ALL
  SELECT 'Prolific Actor' level, 20 min_roles, 29 max_roles
  UNION ALL
  SELECT 'Newcomer' level, 1 min_roles, 19 max_roles
) actor_level ON actor_n_role.n_roles BETWEEN actor_level.min_roles AND actor_level.max_roles;
