
ToggleReg(KeyName, ValueName) {
    TestValue := RegRead(KeyName, ValueName, 0)
    TestValue := !TestValue
    RegWrite(TestValue, "REG_DWORD", KeyName, ValueName)
    return TestValue
}