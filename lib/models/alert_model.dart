class alert {
  String id;
  String name;
  String detail;
  bool status;
  alert(this.id, this.name, this.detail, this.status);

  static List<alert> generateAlert() {
    return [
      alert('1', 'เสร็จสิ้นการตรวจมะเร็งเต้านม',
          'กรุณาให้ระดับความพึงพอใจในการมารับบริการครั้งนี้', true),
      alert('2', 'การแจ้งนัดหมายสำเร็จ',
          'การนัดหมายเอกสาร เจ้าหน้าที่ได้รับเรื่องและดำเนินการ', true),
      alert('3', 'การแจ้งนัดหมายสำเร็จ',
          'การนัดหมายเอกสาร เจ้าหน้าที่ได้รับเรื่องและดำเนินการ', true),
      alert('4', 'การแจ้งนัดหมายสำเร็จ',
          'การนัดหมายเอกสาร เจ้าหน้าที่ได้รับเรื่องและดำเนินการ', true),
      alert('5', 'เสร็จสิ้นการตรวจมะเร็งเต้านม',
          'กรุณาให้ระดับความพึงพอใจในการมารับบริการครั้งนี้', false),
      alert('6', 'เสร็จสิ้นการตรวจมะเร็งเต้านม',
          'กรุณาให้ระดับความพึงพอใจในการมารับบริการครั้งนี้', false),
      alert('7', 'เสร็จสิ้นการตรวจมะเร็งเต้านม',
          'กรุณาให้ระดับความพึงพอใจในการมารับบริการครั้งนี้', false),
      alert('8', 'เสร็จสิ้นการตรวจมะเร็งเต้านม',
          'กรุณาให้ระดับความพึงพอใจในการมารับบริการครั้งนี้', false),
    ];
  }
}
