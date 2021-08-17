using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Final_window
{
    public partial class Form1 : Form
    {
        
        public Form1()
        {
            InitializeComponent();
        }

        private void SCL_Click(object sender, EventArgs e)
        {

        }
        private DBConnector db;
        private void Form1_Load(object sender, EventArgs e)
        {
            db = new DBConnector();
            dataGridView1.DataSource = db.GetData();
            dataGridView1.Refresh();
        }

        private void đặtSânToolStripMenuItem_Click(object sender, EventArgs e)
        {
            
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            panel5.Height = btnDatSan.Height;
            panel5.Top = btnDatSan.Top;
            frm_datsan frm2 = new frm_datsan();
            this.Hide();
            frm2.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            panel5.Height = btn_XuatBaoCao.Height;
            panel5.Top = btn_XuatBaoCao.Top;
            
            string message = "Bạn có phải nhân viên?";
            string title = "Truy cập thông tin chi tiết";
            MessageBoxButtons buttons = MessageBoxButtons.YesNo;
            DialogResult result = MessageBox.Show(message, title, buttons);
            if (result == DialogResult.Yes)
            {
                Form10 frm10 = new Form10();
                frm10.Show();

            }
        }

        private void button3_Click(object sender, EventArgs e)
        {

            panel5.Height = btn_XemThongTin.Height;
            panel5.Top = btn_XemThongTin.Top;
            
            Form1 frm1 = new Form1();
            string message = "Bạn có phải nhân viên?";
            string title = "Truy cập thông tin chi tiết";
            MessageBoxButtons buttons = MessageBoxButtons.YesNo;
            DialogResult result = MessageBox.Show(message, title, buttons);
            if (result == DialogResult.Yes)
            {
                Form9 frm9 = new Form9();
                frm9.Show();
                
            }
        }

        private void dataGridView1_CellContentClick_1(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dataGridView1_CellContentClick_2(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
