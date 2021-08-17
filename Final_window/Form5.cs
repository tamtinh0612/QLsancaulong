using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Excel = Microsoft.Office.Interop.Excel;

namespace Final_window
{
    public partial class Form5 : Form
    {
        public Form5()
        {
            InitializeComponent();
        }
        DBConnector db;
        private void button1_Click(object sender, EventArgs e)
        {
            db = new DBConnector();
            int ngay, thang, nam;
            Int32.TryParse(numericUpDown1.Value.ToString(), out ngay);
            Int32.TryParse(numericUpDown2.Value.ToString(), out thang);
            Int32.TryParse(numericUpDown3.Value.ToString(), out nam);
            if(ngay==0 && thang==0)
            {
                dataGridView1.DataSource = db.getthongtinnam(nam);
                dataGridView1.Refresh();
            }
            else if(ngay==0)
            {
                dataGridView1.DataSource = db.getthongtinwiththangnam(thang,nam);
                dataGridView1.Refresh();
            }
            else
            {
                dataGridView1.DataSource = db.getthongtinfull(ngay,thang,nam);
                dataGridView1.Refresh();
            }
            
        }

        private void numericUpDown3_ValueChanged(object sender, EventArgs e)
        {

        }

        private void Form5_Load(object sender, EventArgs e)
        {

        }
        private void copyAlltoClipboard()
        {
            dataGridView1.SelectAll();
            DataObject dataObj = dataGridView1.GetClipboardContent();
            if (dataObj != null)
                Clipboard.SetDataObject(dataObj);
        }
        private void button2_Click(object sender, EventArgs e)
        {
            copyAlltoClipboard();
            Microsoft.Office.Interop.Excel.Application xlexcel;
            Microsoft.Office.Interop.Excel.Workbook xlWorkBook;
            Microsoft.Office.Interop.Excel.Worksheet xlWorkSheet;
            object misValue = System.Reflection.Missing.Value;
            xlexcel = new Excel.Application();
            xlexcel.Visible = true;
            xlWorkBook = xlexcel.Workbooks.Add(misValue);
            xlWorkSheet = (Excel.Worksheet)xlWorkBook.Worksheets.get_Item(1);
            Excel.Range CR = (Excel.Range)xlWorkSheet.Cells[1, 1];
            CR.Select();
            xlWorkSheet.PasteSpecial(CR, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, true);
        }
    }
}
