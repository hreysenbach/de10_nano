--
-- This block is designed to interface with LTC2308 which is found on the
-- DE-10 Nano Development Board by Terasic. It uses an AXI3 bus so it can
-- easily interface with the HPS of the Cyclone 5
--
-- by Haydn Reysenbach
--
--


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity ltc2308 is
    generic (
        clk_freq            : integer := 50000000;
        sampling_freq       : integer := 500000;
        spi_freq            : integer := 40000000
        axi_version         : integer := 3;                         -- Supported values are 3 or 4
    );
    port (
        clk                 : in std_logic;                         -- CLK
        reset_n             : in std_logic;                         -- RESET

        -- AXI Bus

        -- Write Address Channel Signals
        awid                : in    std_logic_vector(11 downto 0);  -- Write Address ID
        awaddr              : in    std_logic_vector(3 downto 0);   -- Write Address
        awlen               : in    std_logic_vector(3 downto 0);   -- Write Burst Length
        awsize              : in    std_logic_vector(2 downto 0);   -- Write Burst Size
        awburst             : in    std_logic_vector(1 downto 0);   -- Burst Type
        awlock              : in    std_logic_vector(1 downto 0);   -- Lock Type
        awcache             : in    std_logic_vector(3 downto 0);   -- Memory Type
        awprot              : in    std_logic_vector(2 downto 0);   -- Protection Type
        awvalid             : in    std_logic;                      -- Write Address Valid
        awready             : out   std_logic;                      -- Slave Ready

        -- Write Data Channel Signals
        wid                 : in    std_Logic_vector(11 downto 0);  -- Write Data ID
        wdata               : in    std_logic_vector(31 downto 0);  -- Data
        wstrb               : in    std_logic_vector(3 downto 0);   -- Strobe Signal
        wlast               : in    std_logic;                      -- Write Last
        wvalid              : in    std_logic;                      -- Write Data Valid
        wready              : out   std_logic;                      -- Slave Ready

        -- Write Response Channel Signals
        bid                 : out   std_logic_vector(11 downto 0);  -- Response ID
        bresp               : out   std_logic_vector(1 downto 0);   -- Write Response
        bvalid              : out   std_logic;                      -- Response Valid
        bready              : in    std_Logic;                      -- Response Ready

        -- Read Address Channel Signals
        arid                : in    std_logic_vector(11 downto 0);  -- Read Address ID
        araddr              : in    std_logic_vector(3 downto 0);   -- Read Address
        arlen               : in    std_logic_vector(3 downto 0);   -- Read Burst Length
        arsize              : in    std_logic_vector(2 downto 0);   -- Read Burst Size
        arburst             : in    std_logic_vector(1 downto 0);   -- Read Burst Type
        arlock              : in    std_logic_vector(1 downto 0);   -- Read Lock
        arcache             : in    std_logic_Vector(3 downto 0);   -- Read Memory Type
        arprot              : in    std_logic_vector(2 downto 0);   -- Read Protection Type
        arvalid             : in    std_logic;                      -- Read Valid
        arready             : out   std_logic;                      -- Read Ready

        -- Read Data Channel Signals
        rid                 : out   std_logic_vector(11 downto 0);  -- Read Data ID
        rdata               : out   std_logic_vector(31 downto 0);  -- Read Data
        rresp               : out   std_logic_vector(11 downto 0);  -- Read Response
        rlast               : out   std_logic;                      -- Read Last
        rvalid              : out   std_logic;                      -- Read Data Valid
        rready              : in    std_logic;                      -- Read Data Ready

        -- ADC Signals
        conv                : out   std_logic;                      -- Convert Signal
        sck                 : out   std_logic;                      -- Serial Clock
        sdi                 : out   std_logic;                      -- Serial Data into ADC
        sdo                 : in    std_logic                       -- Serial Data from ADC
    );
end entity;

architecture behavioural of ltc2380 is 
    -- The AXI bus has a handshake that the requires both of the ready and
    -- valid signals to be high for a transaction to occur. Valid can't wait
    -- for ready to go high however ready can wait for valid to go high before
    -- going high. This is not recommended as it causes the transaction to take
    -- two clock cycles instead of 1. 
begin
end architecture;
