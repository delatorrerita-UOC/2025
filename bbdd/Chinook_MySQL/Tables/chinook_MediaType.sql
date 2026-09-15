DROP TABLE IF EXISTS `MediaType`;

CREATE TABLE `MediaType` (
    `MediaTypeId` INT auto_increment PRIMARY KEY,
    `MediaTypeName` VARCHAR(80) NOT NULL
) ENGINE=InnoDB;

INSERT INTO `MediaType` (`MediaTypeId`, `MediaTypeName`) VALUES
    (1, 'MPEG audio file'),
    (2, 'Protected AAC audio file'),
    (3, 'Protected MPEG-4 video file'),
    (4, 'Purchased AAC audio file'),
    (5, 'AAC audio file'); 
    
SELECT * FROM mediatype;