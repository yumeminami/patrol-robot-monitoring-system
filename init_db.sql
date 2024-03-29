INSERT INTO `robots` (
        `name`,
        `battery`,
        `battery_status`,
        `status`,
        `velocity`,
        `position`,
        `id`,
        `created_at`,
        `updated_at`
    )
VALUES (
        'zj_robot',
        0,
        0,
        0,
        0,
        0,
        1,
        '2023-08-03 18:56:03',
        '2023-12-06 11:02:27'
    );
INSERT INTO `sensors` (
        `name`,
        `value`,
        `unit`,
        `robot_id`,
        `id`,
        `created_at`,
        `updated_at`
    )
VALUES (
        'temperature',
        0,
        '°C',
        1,
        1,
        '2023-08-03 18:56:55',
        '2023-12-06 11:02:27'
    );
INSERT INTO `sensors` (
        `name`,
        `value`,
        `unit`,
        `robot_id`,
        `id`,
        `created_at`,
        `updated_at`
    )
VALUES (
        'humidity',
        0,
        '%',
        1,
        3,
        '2023-08-04 10:52:16',
        '2023-12-06 11:02:27'
    );
INSERT INTO `sensors` (
        `name`,
        `value`,
        `unit`,
        `robot_id`,
        `id`,
        `created_at`,
        `updated_at`
    )
VALUES (
        'light',
        0,
        'Lux',
        1,
        4,
        '2023-08-04 10:52:42',
        '2023-12-06 11:02:27'
    );
INSERT INTO `sensors` (
        `name`,
        `value`,
        `unit`,
        `robot_id`,
        `id`,
        `created_at`,
        `updated_at`
    )
VALUES (
        'PM1_0',
        0,
        'μg/m³',
        1,
        5,
        '2023-08-04 10:53:03',
        '2023-12-06 11:02:27'
    );
INSERT INTO `sensors` (
        `name`,
        `value`,
        `unit`,
        `robot_id`,
        `id`,
        `created_at`,
        `updated_at`
    )
VALUES (
        'PM2_5',
        0,
        'μg/m³',
        1,
        6,
        '2023-08-04 10:53:09',
        '2023-12-06 11:02:27'
    );
INSERT INTO `sensors` (
        `name`,
        `value`,
        `unit`,
        `robot_id`,
        `id`,
        `created_at`,
        `updated_at`
    )
VALUES (
        'PM10',
        0,
        'μg/m³',
        1,
        7,
        '2023-08-04 10:53:16',
        '2023-12-06 11:02:20'
    );
INSERT INTO `sensors` (
        `name`,
        `value`,
        `unit`,
        `robot_id`,
        `id`,
        `created_at`,
        `updated_at`
    )
VALUES (
        'smoke1',
        0,
        'bool',
        1,
        8,
        '2023-08-04 10:53:25',
        '2023-12-06 11:02:20'
    );
INSERT INTO `sensors` (
        `name`,
        `value`,
        `unit`,
        `robot_id`,
        `id`,
        `created_at`,
        `updated_at`
    )
VALUES (
        'smoke2',
        0,
        'bool',
        1,
        9,
        '2023-08-04 10:53:30',
        '2023-12-06 11:02:21'
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'cable',
        0.9,
        1,
        '2023-08-04 07:57:13',
        '2023-11-16 11:15:01',
        0
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'gallery',
        0.7,
        2,
        '2023-08-04 07:57:22',
        '2023-11-15 10:28:42',
        0
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'water',
        0.6,
        3,
        '2023-08-04 07:57:28',
        '2023-08-04 07:57:28',
        0
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'vents',
        0.8,
        4,
        '2023-08-04 07:57:37',
        '2023-08-04 07:57:37',
        0
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'drain',
        0.6,
        5,
        '2023-08-04 07:57:54',
        '2023-08-04 07:57:54',
        0
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'lighting',
        0.7,
        7,
        '2023-08-04 07:58:35',
        '2023-08-04 07:58:35',
        0
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'dust',
        0.4,
        8,
        '2023-08-04 07:59:03',
        '2023-08-04 07:59:03',
        0
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'fireExtinguisher',
        0.8,
        9,
        '2023-08-04 07:59:51',
        '2023-08-04 07:59:51',
        0
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'rust',
        0.8,
        10,
        '2023-08-04 07:59:58',
        '2023-08-04 07:59:58',
        0
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'pound',
        0.6,
        11,
        '2023-08-04 08:00:07',
        '2023-08-04 08:00:07',
        0
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'animal',
        0.5,
        12,
        '2023-08-04 08:00:14',
        '2023-08-04 08:00:14',
        0
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'hatPhoto',
        0.6,
        13,
        '2023-08-04 08:00:24',
        '2023-08-04 08:00:24',
        0
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'fall',
        0.6,
        15,
        '2023-08-04 08:00:32',
        '2023-08-04 08:00:32',
        0
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'gas',
        0.7,
        16,
        '2023-08-04 08:00:43',
        '2023-08-04 08:00:43',
        0
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'catchment',
        0.9,
        17,
        '2023-08-04 08:00:52',
        '2023-08-04 08:00:52',
        0
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'ports',
        0.7,
        18,
        '2023-08-04 08:01:02',
        '2023-08-04 08:01:02',
        0
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'wire',
        0.8,
        19,
        '2023-08-04 08:01:13',
        '2023-08-04 08:01:13',
        0
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'drainPound',
        0.9,
        21,
        '2023-08-04 08:01:28',
        '2023-08-04 08:01:28',
        0
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'smoke',
        0.6,
        22,
        '2023-08-04 08:01:34',
        '2023-08-04 08:01:34',
        0
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'signage',
        0.8,
        24,
        '2023-08-21 11:49:08',
        '2023-08-21 11:49:08',
        0
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'wallCasing',
        0.8,
        25,
        '2023-08-21 11:49:22',
        '2023-08-21 11:49:22',
        0
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'cable',
        0.5,
        26,
        '2023-08-24 18:11:40',
        '2023-08-24 18:11:40',
        1
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'gallery',
        0.5,
        27,
        '2023-08-24 18:11:46',
        '2023-08-24 18:11:46',
        1
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'pipeline',
        0.5,
        28,
        '2023-08-24 18:11:51',
        '2023-08-24 18:11:51',
        1
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'vents',
        0.5,
        29,
        '2023-08-24 18:11:55',
        '2023-08-24 18:11:55',
        1
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'drain',
        0.5,
        30,
        '2023-08-24 18:12:00',
        '2023-08-24 18:12:00',
        1
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'lighting',
        0.5,
        31,
        '2023-08-24 18:12:05',
        '2023-08-24 18:12:05',
        1
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'fire_extinguisher',
        0.5,
        32,
        '2023-08-24 18:12:12',
        '2023-08-24 18:12:12',
        1
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'dust_damp',
        0.5,
        33,
        '2023-08-24 18:12:17',
        '2023-08-24 18:12:17',
        1
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'rust',
        0.5,
        34,
        '2023-08-24 18:12:22',
        '2023-08-24 18:12:22',
        1
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'pound',
        0.5,
        35,
        '2023-08-24 18:12:30',
        '2023-08-24 18:12:30',
        1
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'animal',
        0.5,
        36,
        '2023-08-24 18:12:34',
        '2023-08-24 18:12:34',
        1
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'hat_person',
        0.5,
        37,
        '2023-08-24 18:12:39',
        '2023-08-24 18:12:39',
        1
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'fall',
        0.5,
        38,
        '2023-08-24 18:12:44',
        '2023-08-24 18:12:44',
        1
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'gas_detector',
        0.5,
        39,
        '2023-08-24 18:12:49',
        '2023-08-24 18:12:49',
        1
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'water_level',
        0.5,
        40,
        '2023-08-24 18:12:53',
        '2023-08-24 18:12:53',
        1
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'escape',
        0.5,
        41,
        '2023-08-24 18:12:58',
        '2023-08-24 18:12:58',
        1
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'ground_wire',
        0.5,
        43,
        '2023-08-24 18:13:05',
        '2023-08-24 18:13:05',
        1
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'drain_pound',
        0.5,
        44,
        '2023-08-24 18:13:09',
        '2023-08-24 18:13:09',
        1
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'reflective_smoke',
        0.5,
        45,
        '2023-08-24 18:13:14',
        '2023-08-24 18:13:14',
        1
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'safety_signage',
        0.5,
        46,
        '2023-08-24 18:13:18',
        '2023-08-24 18:13:18',
        1
    );
INSERT INTO `vision_algorithms` (
        `name`,
        `sensitivity`,
        `id`,
        `created_at`,
        `updated_at`,
        `type`
    )
VALUES (
        'through_wall',
        0.5,
        47,
        '2023-08-24 18:13:23',
        '2023-08-24 18:13:23',
        1
    );