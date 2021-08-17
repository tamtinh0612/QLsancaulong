using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Final_window
{
    public partial class Form6 : Form
    {
        public Form6()
        {
            InitializeComponent();
        }
        DBConnector db;
        private void button1_Click(object sender, EventArgs e)
        {
            db = new DBConnector();
            string cmnd = txtCMND.Text;
            string hovaten = txtHoTen.Text;
            string sdt = txtSDT.Text;
            db.ThemKhachHang(hovaten,cmnd,sdt);
            this.Close();
            Form1 frm1 = new Form1();
            frm1.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            frm_datsan frmdatsan = new frm_datsan();
            this.Hide();
            frmdatsan.Show();
            
        }
    }
}
