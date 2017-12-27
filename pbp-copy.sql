USE SCHEMA RAW;

CREATE OR REPLACE TABLE RAW.NFL_PLAY_BY_PLAY (
	GameId STRING,
	GameDate STRING,
	Quarter STRING,
	Minute STRING,
	Second STRING,
	OffenseTeam STRING,
	DefenseTeam STRING,
	Down STRING,
	ToGo STRING,
	YardLine STRING,
	BLANK1 STRING,
	SeriesFirstDown STRING,
	BLANK2 STRING,
	NextScore STRING,
	Description STRING,
	TeamWin STRING,
	BLANK3 STRING,
	BLANK4 STRING,
	SeasonYear STRING,
	Yards STRING,
	Formation STRING,
	PlayType STRING,
	IsRush STRING,
	IsPass STRING,
	IsIncomplete STRING,
	IsTouchdown STRING,
	PassType STRING,
	IsSack STRING,
	IsChallenge STRING,
	IsChallengeReversed STRING,
	Challenger STRING,
	IsMeasurement STRING,
	IsInterception STRING,
	IsFumble STRING,
	IsPenalty STRING,
	IsTwoPointConversion STRING,
	IsTwoPointConversionSuccessful STRING,
	RushDirection STRING,
	YardLineFixed STRING,
	YardLineDirection STRING,
	IsPenaltyAccepted STRING,
	PenaltyTeam STRING,
	IsNoPlay STRING,
	PenaltyType STRING,
	PenaltyYards STRING);

CREATE OR REPLACE FILE FORMAT RAW.CSV 
    TYPE = 'CSV' 
    COMPRESSION = 'AUTO' 
    FIELD_DELIMITER = ',' 
    RECORD_DELIMITER = '\n' 
    SKIP_HEADER = 1 
    FIELD_OPTIONALLY_ENCLOSED_BY = '\042' 
    TRIM_SPACE = FALSE 
    ERROR_ON_COLUMN_COUNT_MISMATCH = TRUE 
    ESCAPE = 'NONE' 
    ESCAPE_UNENCLOSED_FIELD = '\134' 
    DATE_FORMAT = 'AUTO' 
    TIMESTAMP_FORMAT = 'AUTO' 
    NULL_IF = ('');
    
COPY INTO RAW.NFL_PLAY_BY_PLAY
    FROM '@"JAMES_TEST_DB"."RAW"."JGA_CI_TESTING"' 
    FILE_FORMAT = (FORMAT_NAME='RAW.CSV')
    PATTERN = '.*.csv'
    ON_ERROR = 'ABORT_STATEMENT' 
    PURGE = FALSE;