CREATE TABLE blocks (
  id int NOT NULL PRIMARY KEY,
  hash bytea NOT NULL,
  coinbase bytea NOT NULL
);

CREATE TABLE address (
  id decimal NOT NULL PRIMARY KEY,
  addr bytea NOT NULL
) ;

CREATE TABLE trxs (
  id decimal NOT NULL PRIMARY KEY,
  hash bytea NOT NULL,
  ins boolean NOT NULL,
  outs boolean NOT NULL,
  txsize smallint NOT NULL,
  txdata decimal DEFAULT NULL,
  block_id decimal DEFAULT NULL
);

CREATE INDEX ON trxs (block_id);

CREATE TABLE outputs (
  id decimal NOT NULL PRIMARY KEY,
  value decimal DEFAULT NULL,
  addr_id decimal DEFAULT NULL,
  tx_id decimal DEFAULT NULL
);

CREATE INDEX ON outputs (addr_id);

CREATE TABLE mempool (
  id decimal NOT NULL PRIMARY KEY,
  sync_id int DEFAULT NULL
);

CREATE INDEX ON  mempool (sync_id);

CREATE TABLE orphans (
  sync_id int NOT NULL,
  block_id int NOT NULL,
  hash bytea NOT NULL,
  hdr bytea NOT NULL,
  coinbase bytea NOT NULL   
);

CREATE INDEX ON orphans (sync_id)

CREATE TABLE info (
  class varchar NOT NULL PRIMARY KEY,
  key varchar NOT NULL,
  value varchar DEFAULT NULL
);
