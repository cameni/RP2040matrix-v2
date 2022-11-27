#include "pico/stdlib.h"
#include "hardware/i2c.h"

// I2C address
static const uint8_t SHT40_ADDR = 0x44;         // temp/humidity sensor
static const uint8_t BH1750_ADDR = 0x23;        // light sensor

float temperature = 0;
float humidity = 0;

/*******************************************************************************
 * Function Declarations
 */
int reg_write(i2c_inst_t *i2c, 
                const uint addr, 
                const uint8_t reg, 
                uint8_t *buf,
                const uint8_t nbytes);

int reg_read(i2c_inst_t *i2c,
                const uint addr,
                const uint8_t reg,
                uint8_t *buf,
                const uint8_t nbytes);

/*******************************************************************************
 * Function Definitions
 */

// Write 1 byte to the specified register
int reg_write(  i2c_inst_t *i2c, 
                const uint addr, 
                const uint8_t reg, 
                uint8_t *buf,
                const uint8_t nbytes) {

    int num_bytes_read = 0;
    uint8_t msg[nbytes + 1];

    // Check to make sure caller is sending 1 or more bytes
    if (nbytes < 1) {
        return 0;
    }

    // Append register address to front of data packet
    msg[0] = reg;
    for (int i = 0; i < nbytes; i++) {
        msg[i + 1] = buf[i];
    }

    // Write data to register(s) over I2C
    i2c_write_blocking(i2c, addr, msg, (nbytes + 1), false);

    return num_bytes_read;
}

// Read byte(s) from specified register. If nbytes > 1, read from consecutive
// registers.
int reg_read(  i2c_inst_t *i2c,
                const uint addr,
                const uint8_t reg,
                uint8_t *buf,
                const uint8_t nbytes) {

    int num_bytes_read = 0;

    // Check to make sure caller is asking for 1 or more bytes
    if (nbytes < 1) {
        return 0;
    }

    // Read data from register(s) over I2C
    i2c_write_blocking(i2c, addr, &reg, 1, true);

    sleep_ms(10);

    num_bytes_read = i2c_read_blocking(i2c, addr, buf, nbytes, false);

    return num_bytes_read;
}

/*******************************************************************************
 * Main
 */
void sensorTask(void* para)
{
    // Pins
    static const uint sda_pin = 16;
    static const uint scl_pin = 17;

    // Ports
    i2c_inst_t *i2c = i2c0;

    // Buffer to store raw reads
    uint8_t data[6];

    // Initialize chosen serial port
    //stdio_init_all();

    //Initialize I2C port at 400 kHz
    i2c_init(i2c, 100 * 1000);

    // Initialize I2C pins
    gpio_set_function(sda_pin, GPIO_FUNC_I2C);
    gpio_set_function(scl_pin, GPIO_FUNC_I2C);

    uint8_t channel_mask = 0x01;
    i2c_write_blocking(i2c, 0x70, &channel_mask, 1, false);

    do {
        sleep_ms(2000);

        reg_read(i2c, SHT40_ADDR, 0xFD, data, 6);

        temperature = -45 + 175.0f / 65535 * ((data[0] << 8u) | data[1]);
        humidity = -6 + 125.0f / 65535 * ((data[3] << 8u) | data[4]);
    }
    while(1);
}
