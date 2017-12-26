
module top (
    // Clocks
    input  wire         HPS_CLK,

    // Ethernet
    output              HPS_ETH_TX_CLK,
    output              HPS_ETH_TX_CTL,
    output  [3:0]       HPS_ETH_TXD,
    input               HPS_ETH_RX_CLK,
    input               HPS_ETH_RX_CTL,
    input   [3:0]       HPS_ETH_RXD,
    inout               HPS_ETH_MDIO,
    output              HPS_ETH_MDC,
    
    // SDMMC 
    inout               HPS_SD_CMD,
    output              HPS_SD_CLK,
    inout   [3:0]       HPS_SD_D,

    // USB 
    input               HPS_USB_CLK,
    input               HPS_USB_DIR,
    input               HPS_USB_NXT,
    output              HPS_USB_STP,
    inout   [7:0]       HPS_USB_D,
    
    // SPI
    output              HPS_SPI_CLK,
    output              HPS_SPI_SS,
    output              HPS_SPI_MOSI,
    input               HPS_SPI_MISO,

    // I2C0
    inout               HPS_I2C0_SCL,
    inout               HPS_I2C0_SDA,

    // I2C1
    inout               HPS_I2C1_SCL,
    inout               HPS_I2C1_SDA,

    // UART
    output              HPS_UART_TX,
    input               HPS_UART_RX,

    // GPIO
    inout               HPS_USB_CONV_N,
    inout               HPS_ETH_INT_N,
    inout               HPS_LTC_GPIO,
    inout               HPS_USB_RST,   // N/C
    inout               HPS_ETH_RST_N, // N/C 
    inout               HPS_LED,
    inout               HPS_KEY,
    inout               HPS_GSENSOR_INT,

    // DDR3
    output [14:0]       HPS_MEM_A,
    output [2:0]        HPS_MEM_BA,
    output              HPS_MEM_CAS_N,
    output              HPS_MEM_CK,
    output              HPS_MEM_CK_N,
    output              HPS_MEM_CKE,
    output              HPS_MEM_CS_N,
    output [3:0]        HPS_MEM_DM,
    inout  [31:0]       HPS_MEM_DQ,
    inout  [3:0]        HPS_MEM_DQS,
    inout  [3:0]        HPS_MEM_DQS_N,
    output              HPS_MEM_ODT,
    output              HPS_MEM_RAS_N,
    output              HPS_MEM_RST_N,
    input               HPS_MEM_RZQIN,
    output              HPS_MEM_WE_N
);
    
    // Wires and Registers
    wire reset_n;
    assign reset_n = 1'b1;


    soc_system u0 (
        .clk_clk                         (HPS_CLK),             // clk.clk
        // Ethernet
        .hps_io_hps_io_emac1_inst_TX_CLK (HPS_ETH_TX_CLK),      // .hps_io.hps_io_emac1_inst_TX_CLK
        .hps_io_hps_io_emac1_inst_TXD0   (HPS_ETH_TXD[0]),      // .hps_io_emac1_inst_TXD0
        .hps_io_hps_io_emac1_inst_TXD1   (HPS_ETH_TXD[1]),      // .hps_io_emac1_inst_TXD1
        .hps_io_hps_io_emac1_inst_TXD2   (HPS_ETH_TXD[2]),      // .hps_io_emac1_inst_TXD2
        .hps_io_hps_io_emac1_inst_TXD3   (HPS_ETH_TXD[3]),      // .hps_io_emac1_inst_TXD3
        .hps_io_hps_io_emac1_inst_RXD0   (HPS_ETH_RXD[0]),      // .hps_io_emac1_inst_RXD0
        .hps_io_hps_io_emac1_inst_MDIO   (HPS_ETH_MDIO),        // .hps_io_emac1_inst_MDIO
        .hps_io_hps_io_emac1_inst_MDC    (HPS_ETH_MDC),         // .hps_io_emac1_inst_MDC
        .hps_io_hps_io_emac1_inst_RX_CTL (HPS_ETH_RX_CTL),      // .hps_io_emac1_inst_RX_CTL
        .hps_io_hps_io_emac1_inst_TX_CTL (HPS_TX_CTL),          // .hps_io_emac1_inst_TX_CTL
        .hps_io_hps_io_emac1_inst_RX_CLK (HPS_ETH_RX_CLK),      // .hps_io_emac1_inst_RX_CLK
        .hps_io_hps_io_emac1_inst_RXD1   (HPS_ETH_RXD[1]),      // .hps_io_emac1_inst_RXD1
        .hps_io_hps_io_emac1_inst_RXD2   (HPS_ETH_RXD[2]),      // .hps_io_emac1_inst_RXD2
        .hps_io_hps_io_emac1_inst_RXD3   (HPS_ETH_RXD[3]),      // .hps_io_emac1_inst_RXD3
        // SDMMC
        .hps_io_hps_io_sdio_inst_CMD     (HPS_SD_CMD),          // .hps_io_sdio_inst_CMD
        .hps_io_hps_io_sdio_inst_D0      (HPS_SD_D[0]),         // .hps_io_sdio_inst_D0
        .hps_io_hps_io_sdio_inst_D1      (HPS_SD_D[1]),         // .hps_io_sdio_inst_D1
        .hps_io_hps_io_sdio_inst_CLK     (HPS_SD_CLK),          // .hps_io_sdio_inst_CLK
        .hps_io_hps_io_sdio_inst_D2      (HPS_SD_D[2]),         // .hps_io_sdio_inst_D2
        .hps_io_hps_io_sdio_inst_D3      (HPS_SD_D[3]),         // .hps_io_sdio_inst_D3
        // USB
        .hps_io_hps_io_usb1_inst_D0      (HPS_USB_D[0]),        // .hps_io_usb1_inst_D0
        .hps_io_hps_io_usb1_inst_D1      (HPS_USB_D[1]),        // .hps_io_usb1_inst_D1
        .hps_io_hps_io_usb1_inst_D2      (HPS_USB_D[2]),        // .hps_io_usb1_inst_D2
        .hps_io_hps_io_usb1_inst_D3      (HPS_USB_D[3]),        // .hps_io_usb1_inst_D3
        .hps_io_hps_io_usb1_inst_D4      (HPS_USB_D[4]),        // .hps_io_usb1_inst_D4
        .hps_io_hps_io_usb1_inst_D5      (HPS_USB_D[5]),        // .hps_io_usb1_inst_D5
        .hps_io_hps_io_usb1_inst_D6      (HPS_USB_D[6]),        // .hps_io_usb1_inst_D6
        .hps_io_hps_io_usb1_inst_D7      (HPS_USB_D[7]),        // .hps_io_usb1_inst_D7
        .hps_io_hps_io_usb1_inst_CLK     (HPS_USB_CLK),         // .hps_io_usb1_inst_CLK
        .hps_io_hps_io_usb1_inst_STP     (HPS_USB_STP),         // .hps_io_usb1_inst_STP
        .hps_io_hps_io_usb1_inst_DIR     (HPS_USB_DIR),         // .hps_io_usb1_inst_DIR
        .hps_io_hps_io_usb1_inst_NXT     (HPS_USB_NXT),         // .hps_io_usb1_inst_NXT
        // SPI
        .hps_io_hps_io_spim1_inst_CLK    (HPS_SPI_CLK),         // .hps_io_spim1_inst_CLK
        .hps_io_hps_io_spim1_inst_MOSI   (HPS_SPI_MOSI),        // .hps_io_spim1_inst_MOSI
        .hps_io_hps_io_spim1_inst_MISO   (HPS_SPI_MISO),        // .hps_io_spim1_inst_MISO
        .hps_io_hps_io_spim1_inst_SS0    (HPS_SPI_SS),          // .hps_io_spim1_inst_SS0
        // UART
        .hps_io_hps_io_uart0_inst_RX     (HPS_UART_RX),         // .hps_io_uart0_inst_RX
        .hps_io_hps_io_uart0_inst_TX     (HPS_UART_TX),         // .hps_io_uart0_inst_TX
        // I2C0
        .hps_io_hps_io_i2c0_inst_SDA     (HPS_I2C0_SDA),        // .hps_io_i2c0_inst_SDA
        .hps_io_hps_io_i2c0_inst_SCL     (HPS_I2C0_SCL),        // .hps_io_i2c0_inst_SCL
        // I2C1
        .hps_io_hps_io_i2c1_inst_SDA     (HPS_I2C1_SDA),        // .hps_io_i2c1_inst_SDA
        .hps_io_hps_io_i2c1_inst_SCL     (HPS_I2C1_SCL),        // .hps_io_i2c1_inst_SCL
        // GPIO
        .hps_io_hps_io_gpio_inst_GPIO09  (HPS_USB_CONV_N),      // .hps_io_gpio_inst_GPIO09
        .hps_io_hps_io_gpio_inst_GPIO35  (HPS_ETH_INT_N),       // .hps_io_gpio_inst_GPIO35
        .hps_io_hps_io_gpio_inst_GPIO40  (HPS_LTC_GPIO),        // .hps_io_gpio_inst_GPIO40
        .hps_io_hps_io_gpio_inst_GPIO42  (HPS_USB_RST),         // .hps_io_gpio_inst_GPIO42 N/C
        .hps_io_hps_io_gpio_inst_GPIO43  (HPS_ETH_RST_N),       // .hps_io_gpio_inst_GPIO43 N/C
        .hps_io_hps_io_gpio_inst_GPIO53  (HPS_LED),             // .hps_io_gpio_inst_GPIO53
        .hps_io_hps_io_gpio_inst_GPIO54  (HPS_KEY),             // .hps_io_gpio_inst_GPIO54
        .hps_io_hps_io_gpio_inst_GPIO61  (HPS_GSENSOR_INT),     // .hps_io_gpio_inst_GPIO61
        // DDR3
        .memory_mem_a                    (HPS_MEM_A),           // memory.mem_a
        .memory_mem_ba                   (HPS_MEM_BA),          // .mem_ba
        .memory_mem_ck                   (HPS_MEM_CK),          // .mem_ck
        .memory_mem_ck_n                 (HPS_MEM_CK_N),        // .mem_ck_n
        .memory_mem_cke                  (HPS_MEM_CKE),         // .mem_cke
        .memory_mem_cs_n                 (HPS_MEM_CS_N),        // .mem_cs_n
        .memory_mem_ras_n                (HPS_MEM_RAS_N),       // .mem_ras_n
        .memory_mem_cas_n                (HPS_MEM_CAS_N),       // .mem_cas_n
        .memory_mem_we_n                 (HPS_MEM_WE_N),        // .mem_we_n
        .memory_mem_reset_n              (HPS_MEM_RST_N),       // .mem_reset_n
        .memory_mem_dq                   (HPS_MEM_DQ),          // .mem_dq
        .memory_mem_dqs                  (HPS_MEM_DQS),         // .mem_dqs
        .memory_mem_dqs_n                (HPS_MEM_DQS_N),       // .mem_dqs_n
        .memory_mem_odt                  (HPS_MEM_ODT),         // .mem_odt
        .memory_mem_dm                   (HPS_MEM_DM),          // .mem_dm
        .memory_oct_rzqin                (HPS_MEM_RZQIN),       // .oct_rzqin
        // RESET
        .reset_reset_n                   (reset_n)                // .reset_n
    );

endmodule
