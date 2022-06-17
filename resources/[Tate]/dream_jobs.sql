CREATE TABLE `dream_jobs` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) CHARACTER SET latin1 NOT NULL,
  `experience` int(11) NOT NULL,
  `pickaxe` int(11) NOT NULL,
  `job` varchar(255) CHARACTER SET latin1 NOT NULL,
  `first_time` varchar(255) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `dream_jobs`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `dream_jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;
