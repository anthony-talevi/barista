class Device::Gyro
  include Beaglebone
  
  def read
    puts read_i2c(6, 0x1D)
  end

  def write
  end

  private

  def write_i2c(data)
    i2c_gyro.write(0x53, data.pack('C*'))
  end

  def read_i2c(bytes, start_address)
    i2c_accelerometeri2c_gyro.read(0x53, bytes, [start_address].pack('C*'))
  end

  def i2c
    @i2c_gyro ||= I2CDevice.new(:I2C2)
  end
end
